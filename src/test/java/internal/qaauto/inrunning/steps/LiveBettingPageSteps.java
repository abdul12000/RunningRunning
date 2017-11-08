package internal.qaauto.inrunning.steps;

import internal.qaauto.framework.Assert;
import internal.qaauto.inrunning.StepCandidatesHelperMethods.EventStepsHelperMethods;
import internal.qaauto.inrunning.StepCandidatesHelperMethods.HelperFactory;
import internal.qaauto.inrunning.StepCandidatesHelperMethods.LeftNavEventStepsHelperMethods;
import internal.qaauto.inrunning.StepCandidatesHelperMethods.LiveBettingStepMethods;
import internal.qaauto.inrunning.framework.InRunningBaseStep;
import internal.qaauto.inrunning.tom.LiveBettingPage;
import internal.qaauto.inrunning.tom.LiveBettingPageImpl;
import internal.qaauto.inrunning.tom.Utilties.LeftNavComponents;
import internal.qaauto.inrunning.tom.Utilties.LiveBettingPageFactory;
import internal.qaauto.inrunning.tom.api.UserPreferences;
import internal.qaauto.inrunning.tom.betslip.BetSlip;
import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavLiveNowEvent;
import internal.qaauto.inrunning.tom.markets.Market;
import internal.qaauto.inrunning.tom.markets.MarketOutcome;
import internal.qaauto.inrunning.utils.InRunningComponents;
import internal.qaauto.inrunning.utils.WaitUtils;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.interfaces.Event;

import java.net.MalformedURLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.lang3.StringUtils;
import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Aliases;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Named;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.jbehave.core.model.ExamplesTable;
import org.json.JSONException;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

/**
 * Created by Harish Renukunta and Raghu Kora.
 */
public class LiveBettingPageSteps extends InRunningBaseStep {

    private static final int MARKETS_DISPLAY_WAIT_TIME = 3000;

    private static final String BETSLIP_EMPTY = "BetSlip empty";

    private static final String BETSLIP_NOT_EMPTY = "BetSlip not empty";

    private static final String BETTING_MODE_MATCH = "Betting Mode match. BettingMode : %s";

    private static final String BETTING_MODE_MISMATCH = "Betting Mode mis match. Expected:%s Actual:%s";

    private static final String LIVE_BETTING_LINK = "Live Betting link not found";

    private static final String FIRST_EVENT_RETRIEVED = "First event retrieved";

    private static final String NO_EVENTS = "No events in left nav";

    private static final String FIRST_EVENT_HIGHLIGHTED = "First event(%s) is highlighted";

    private static final String FIRST_EVENT_NOT_HIGHLIGHTED = "First event(%s) is not highlighted";

    private static final int LEFT_NAV_WAIT_TIME = 5000;

    private static final String NO_BETS_USERNAME = "10135860";

    private static final String NO_BETS_PASSWORD = "Testing1";

    private static final String[] EVENT_STATUSES = { "O", "H", "C", "U" };

    private static final int APP_NAVIGATION_DELAY = 2000;
    
    private static final String LINT_NO_BETS_USERNAME = "10345567";
    
    private static final String LINT_NO_BETS_PASSWORD = "Testing01";

    private static final String SIGN_OUT_LINK = "Sign Out";

    private static final By signOutLocator = new By.ByLinkText(SIGN_OUT_LINK);

    private static String FRONT_END_ENV;
    
    private static final String LINT_ENV = "lint";

    private final EventStepsHelperMethods eventStepsHelperMethods = HelperFactory.getEventStepsHelper();

    private final LiveBettingStepMethods liveBettingStepMethods = HelperFactory.getLifeBettingStepMethods();

    private LeftNavEventStepsHelperMethods leftNavEventStepsHelper = HelperFactory.getCouponStepsHelper();

    private By liveBettingLocator = new By.ByLinkText("Live Betting");
    
    public LiveBettingPageSteps(){
          FRONT_END_ENV = LiveBettingPageImpl.getFrontEndEnv();
    }

    public LiveBettingPage getLiveBettingPage() {
        return LiveBettingPageFactory.getLiveBettingPageImpl();
    }

    @Given("a new browser is opened")
    public void openNewBrowser() throws ConfigurationException, MalformedURLException {
        stopBrowser();
        startBrowser();
    }

    @Given("{player|Player|user} is at live betting page")
    @Alias(value = "player navigates to Live betting home page")
    @When("refresh the page")
    @Then("refresh the page")
    public void givenPlayerIsAtLiveBettingPage() throws JSONException, ParseException, InterruptedException {
        getLiveBettingPage().goToEvent(StringUtils.EMPTY);
    }

    private Map<String, Event> getEventsMap(final List<Event> events) {
        final Map<String, Event> eventsMap = new HashMap<String, Event>();
        for (Event event : events) {
            eventsMap.put(event.getGameId(), event);
        }
        return eventsMap;
    }

    @When("refresh the page being at coupon area of above event")
    public void refreshAtEventsCouponAreaPage() {
        logoutIfLoggedIn();
        getLiveBettingPage().goToEvent(getEvent().getGameId());

    }

    @When("{I|player} navigate to any In-Running page")
    @Alias("{I|player} navigate to In-Running page")
    public void navigateToInRunningPage() throws JSONException, ParseException, InterruptedException {
        givenPlayerIsAtLiveBettingPage();
    }

    @Then("Left Nav should have following components:$componentsToCheck")
    public void verifyLeftNavComponents(final ExamplesTable componentsToCheck) {
        String component;

        for (Map<String, String> dataRow : componentsToCheck.getRows()) {
            component = dataRow.get("Component");
            if (component.equals(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT.getLabel())) {
                liveBettingStepMethods.verifyLiveNowComponent();
            } else if (component.equals(LeftNavComponents.UPCOMING_EVENTS_COMPONENT.getLabel())) {
                liveBettingStepMethods.verifyUpcomingCouponsComponent();
            } else if (component.equals(LeftNavComponents.BETSLIP_MODE_COMPONENT.getLabel())) {
                liveBettingStepMethods.verifyBetSlipModeComponent();
            } else if (component.equals(InRunningComponents.BETSLIP_COMPONENT.getLabel())) {
                liveBettingStepMethods.verifyBetSlipComponent();
            } else {
                Assert.fail(component + " not available in left nav page");
            }

        }
    }

    @Then("Live Now component is displayed")
    public void verifyLiveNowComponentDisplays() {
        liveBettingStepMethods.verifyLiveNowComponent();
    }

    @Then("live bettings page should have coupon component")
    @Aliases(values = { "Live Coupon page is displayed" })
    public void verifyCouponComponent() {
        liveBettingStepMethods.verifyCouponComponent();
    }

    @Given("player navigate to a Single Game View page of a Live Event <<GameId>>")
    @When("player navigate to a Single Game View page of a Live Event <<GameId>>")
    @Aliases(values = { "player navigate back to event <<GameId>>" })
    public void whenUserNavigateToASingleGameViewPageForALiveEvent(@Named("<GameId>") String gameId) {
        try {
            Thread.sleep(APP_NAVIGATION_DELAY);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        getLiveBettingPage().goToEvent(gameId);
    }

    public void logoutIfLoggedIn() {
        final List<WebElement> signOut = webDriver.findElements(By.linkText("Sign Out"));
        if (signOut.size() > 0) {
            getLiveBettingPage().logout();
        }
    }

    @When("player navigate to a Single Game View page of a Live Event <<GameId1>>")
    public void whenUserNavigateToASingleGameViewPageForALiveEvent1(@Named("<GameId1>") String gameId) {
        getLiveBettingPage().goToEvent(gameId);
    }

    @When("player navigates to above event")
    @Aliases(values = { "player refreshes page", "user navigates to above event" })
    public void navigateToEvent() {
        final Event event = getEvent();
        getLiveBettingPage().goToEvent(event.getGameId());
    }

    @When("selects '<OddsFormat>' as odds format")
    public void setOddsFormat(@Named("OddsFormat")
    final String oddsFormat) {
        getLiveBettingPage().setOddsFormat(oddsFormat);
    }

    @Then("the list of markets of the selected event are displayed in the coupon area")
    public void verifyMarketsDisplayedForTheSelectedEvent() throws InterruptedException {
        Thread.sleep(MARKETS_DISPLAY_WAIT_TIME);
        Assert.assertEquals(eventStepsHelperMethods.getMarketsTitleFromEvent(getEvent()).size(),
                getLiveBettingPage().getMarkets().size(), "Expected markets are displayed in the Coupon area",
                "Expected markets are not displayed in the Coupon area");
        Assert.assertTrue(!liveBettingStepMethods.verifyMarketTitles(), "All market titles are not displayed",
                "All market titles are displayed");
    }

    @Then("the market which has $MarketTitle should display 3 column layout")
    public void verify3ColumnLayoutMarketDisplay(@Named("MarketTitle")
    final String marketTitle) {
        final Market market = getLiveBettingPage().getMarketByTitle(marketTitle);
        market.isThreeColumnLayoutDisplayed();

    }

    @Then("the markets should display two columns layout $marketTable")
    public void verify2ColumnLayoutMarketDisplay(ExamplesTable marketTable) {
        for (Map<String, String> marketData : marketTable.getRows()) {
            for (final Map.Entry<String, String> marketName : marketData.entrySet()) {
                final String marketTitle = marketName.getValue();
                final Market market = getLiveBettingPage().getMarketByTitle(marketTitle);
                Assert.assertNotNull(market, String.format("Market is Displayed:%s", marketTitle),
                        String.format("Market is not Displayed:%s", marketTitle));
                final boolean twoColumnLayoutDisplayed = market.isTwoColumnLayoutDisplayed();
                Assert.assertTrue(twoColumnLayoutDisplayed,
                        String.format("Market is displayed with Two column Layout: %s", marketTitle),
                        String.format("Market is not displayed with Two column Layout: %s", marketTitle));
            }
        }
    }

    @Then("the bet buttons of the market which has $MarketTitle should display selection, price and $ExpectedHandicap")
    public void verifySelectionPriceHandicap(@Named("<MarketTitle>")
    final String marketTitle, @Named("ExpectedHandicap")
    final String expectedHandicap) {
        final Market market = getLiveBettingPage().getMarketByTitle(marketTitle);
        final List<MarketOutcome> marketOutcomes = market.getOutcomes();
        boolean isHandicapDisplayed = Boolean.FALSE;
        boolean isOutcomesDisplayed = Boolean.FALSE;
        for (MarketOutcome marketOutcome : marketOutcomes) {
            isOutcomesDisplayed = Boolean.FALSE;
            isHandicapDisplayed = Boolean.FALSE;
            if ((marketOutcome.getOutcomeDescription() != null) && (marketOutcome.getPrice() != null)) {
                isOutcomesDisplayed = Boolean.TRUE;
                if (!expectedHandicap.isEmpty()) {
                    final String handicapValue = marketOutcome.getHandicapValue();
                    if (handicapValue.equals(expectedHandicap)) {
                        isHandicapDisplayed = Boolean.TRUE;
                    } else {
                        isHandicapDisplayed = Boolean.FALSE;
                    }
                } else {
                    isHandicapDisplayed = Boolean.TRUE;
                }
            } else {
                reporter.info(String.format("Outcome is not  displayed with relevant data:%s", marketOutcome.getDescription()));
            }
        }
        Assert.assertTrue(isOutcomesDisplayed && isHandicapDisplayed, "Outcome is displayed with relevant data",
                "Outcome is not displayed with relevant data");
    }

    @When("select the event $GameId displayed in the left nav under Live now")
    public LeftNavEvent verifyEventInLeftNav(@Named("<GameId>")
    final String gameId) {
        final Event event = getEventByGameId(gameId);
        final LeftNavEvent leftNavEvent =
                leftNavEventStepsHelper.verifyLeftNavEventExist(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT, event);
        return leftNavEvent;
    }

    @Given("HTML5 Live Client with Betslip as wager placement mode with no selections")
    public void html5LiveClientWithNoSelectionsInBetSlip() {
        LiveBettingPage liveClient = getLiveBettingPage();
        liveClient.go();
        BetSlip betSlip = liveClient.getBetSlip();
        Assert.assertTrue(betSlip.getSelectionCount() == 0, BETSLIP_EMPTY, BETSLIP_NOT_EMPTY);
    }

    @Then("there will be no betting available on the $MarketTitle")
    public void verifyNoBettingAvailable(@Named("<MarketTitle>")
    final String marketTitle) {
        final Market market = getLiveBettingPage().getMarketByTitle(marketTitle);
        Assert.assertTrue(market.isSuspended(), String.format("No Betting available on the market:%s", marketTitle),
                String.format("Betting available on the market:%s", marketTitle));

    }

    @Then("buttons for $MarketTitle outcomes will be displayed as greyed out")
    @Alias("buttons of $MarketTitle should not be visible")
    public void verifyGreyedOutMarketOutcomes(@Named("<MarketTitle>")
    final String marketTitle) {
        final Market market = getLiveBettingPage().getMarketByTitle(marketTitle);
        final List<MarketOutcome> marketOutcomes = market.getOutcomes();
        StringBuilder visibility = new StringBuilder();
        for (MarketOutcome marketOutcome : marketOutcomes) {
            if (marketOutcome.isVisible()) {
                visibility.append("\n" + marketOutcome.getDescription() + ",");
            }
        }
        Assert.assertTrue(StringUtils.isEmpty(visibility.toString()), "All outcomes are Greyed Out",
                "All outcomes are not Greyed Out");
    }

    @Given("a user logged in with username '<Username>' and password '<Password>'")
    public void login(@Named("Username")
    final String uname, @Named("Password")
    final String pwd) {
        getLiveBettingPage().login(uname, pwd);
    }
    
    private void login(){
        getLiveBettingPage().login();
    }

    @Given("a user tried to loggedIn with Invalid username '<Username>' and password '<Password>'")
    public void inValidLogin(@Named("Username")
    final String uname, @Named("Password")
    final String pwd) {
        getLiveBettingPage().loginInPageHeader(uname, pwd);
    }

    @Given("a player loggedIn and navigate to live betting page")
    @When("player logs in and navigate to In-Running page")
    public void goToLiveBettingPageAfterLogin() throws JSONException, ParseException, InterruptedException {
        //login(USERNAME, PASSWORD);
        login();
        givenPlayerIsAtLiveBettingPage();
    }
    
    @Given("login to a account where there are no placed bets")
    public void myBetsLogin() throws ConfigurationException {
        
        if(FRONT_END_ENV.equals(LINT_ENV)){
            login(LINT_NO_BETS_USERNAME, LINT_NO_BETS_PASSWORD);
        }else{
            login(NO_BETS_USERNAME, NO_BETS_PASSWORD);
        }
    }

    @Given("player loggedIn and navigate to the above event")
    @When("a player loggedIn and navigate to above event")
    public void goToEventAfterLogin() {
        getLiveBettingPage().goToEvent(getEvent().getGameId());
        new WaitUtils().waitForWebElementToDisplay(signOutLocator);
        final List<WebElement> signOut = webDriver.findElements(signOutLocator);
        if (!(signOut.size() > 0)) {
            //login(USERNAME, PASSWORD);
            login();
        }
        
        if(!webDriver.getCurrentUrl().contains(getEvent().getGameId())){
            getLiveBettingPage().goToEvent(getEvent().getGameId());
        }
        
      }

    @When("logout and login again")
    public void logoutAndLogin() throws JSONException, ParseException, InterruptedException {
        getLiveBettingPage().logout();
        goToLiveBettingPageAfterLogin();
    }

    @Given("clear all the Live now events in the page")
    public void clearAllEvents() {
        final List<LeftNavLiveNowEvent> leftNavLiveNowEvents =
                getLiveBettingPage().getLiveNowCouponsComponent().getLiveNowEvents();

    }

    @When("CWF provides account balance")
    public void isCWFAccountBalanceDisplayed() {
        final String accountBalance = getLiveBettingPage().getAccountBalance();
        Assert.assertTrue(!accountBalance.isEmpty(), String.format("Account Balance is Displayed: %s", accountBalance),
                String.format("Account balance is not displayed : %s", accountBalance));

    }

    @Given("the /api/bet/preference endpoint providing the wager mode for visitors")
    public void getUserPreferences() {
        try {
            final UserPreferences preferences = new UserPreferences();
            preferences.getPreferences();
            getScenarioContext().getTempStorage().put("bettingMode", preferences.getBettingMode());
        } catch (Exception ex) {
            Assert.fail(ex.getMessage());
        }
    }

    @Given("the received betting mode is '$bettingMode'")
    public void verifyBettingMode(final String bettingMode) {
        final String actualBettingMode = getScenarioContext().getTempStorage().get("bettingMode");
        Assert.assertEquals(actualBettingMode, bettingMode, String.format(BETTING_MODE_MATCH, bettingMode),
                String.format(BETTING_MODE_MISMATCH, bettingMode, actualBettingMode));
    }

    @Given("platform endpoint providing default amount from user preference information")
    public void getUserPrefernces() {
        try {
            final UserPreferences preferences = new UserPreferences();
            preferences.getPreferences();
            Map<String, String> userPreferences = getScenarioContext().getTempStorage();
            userPreferences.put("bettingMode", preferences.getBettingMode());
            userPreferences.put("DefaultAmoutInCents", preferences.getDefaultAmountInCents());

        } catch (Exception ex) {
            Assert.fail(ex.getMessage());
        }

    }

    @Given("update betting mode to 'Single'")
    public void updateBettingMode() {
        try {
            final UserPreferences preferences = new UserPreferences();
            preferences.updatePreferences();
            getScenarioContext().getTempStorage().put("bettingMode", preferences.getBettingMode());
        } catch (Exception ex) {
            Assert.fail(ex.getMessage());
        }
    }

    @When("player selects live betting")
    public void selectLiveBetting() {
        final List<WebElement> liveBettingWebElements = webDriver.findElements(liveBettingLocator);
        if (liveBettingWebElements == null || liveBettingWebElements.isEmpty()) {
            Assert.fail(LIVE_BETTING_LINK);
        }
        liveBettingWebElements.get(0).click();
    }

    @Then("player should be redirected to the single game page view of first event of first sport group")
    public void verifyIfFirstEventIsHighlighted() throws InterruptedException {
        Thread.sleep(LEFT_NAV_WAIT_TIME);
        internal.qaauto.inrunning.tom.Utilties.WaitUtils waitUtils = new internal.qaauto.inrunning.tom.Utilties.WaitUtils();
        waitUtils.waitForEventsComponentToRender(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT);
        waitUtils.waitForEventsComponentToRender(LeftNavComponents.UPCOMING_EVENTS_COMPONENT);
        LeftNavEvent leftNavEvent = null;
        leftNavEvent = getLiveBettingPage().getFirstLeftNavEvent();
        Assert.assertNotNull(leftNavEvent, FIRST_EVENT_RETRIEVED, NO_EVENTS);
        final String eventName = leftNavEvent.getName();
        Assert.assertTrue(leftNavEvent.isHighlighted(), String.format(FIRST_EVENT_HIGHLIGHTED, eventName),
                String.format(FIRST_EVENT_NOT_HIGHLIGHTED, eventName));

    }

    @Then("user should be redirected to LogIn page")
    public void verifyRedirectionToSignInPage() {
        final String redirectedURL = webDriver.getCurrentUrl();
        Assert.assertTrue(redirectedURL.contains("loginSuccessRedirectUrl"), "page is redirected to Login page",
                "page is not redirected to login page");
    }

}
