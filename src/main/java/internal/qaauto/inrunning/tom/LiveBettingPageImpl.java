package internal.qaauto.inrunning.tom;

import com.google.common.base.Function;

import edu.emory.mathcs.backport.java.util.Arrays;
import internal.qaauto.deltawebsites.websites.bovadabodog.tom.CommonBovadaBodogPage;
import internal.qaauto.framework.Assert;
import internal.qaauto.framework.ConfigManager;
import internal.qaauto.inrunning.tom.Utilties.BGSEnvironment;
import internal.qaauto.inrunning.tom.Utilties.LeftNavComponents;
import internal.qaauto.inrunning.tom.Utilties.Odds;
import internal.qaauto.inrunning.tom.Utilties.WaitUtils;
import internal.qaauto.inrunning.tom.betslip.*;
import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavLiveNowEvent;
import internal.qaauto.inrunning.tom.leftnav.*;
import internal.qaauto.inrunning.tom.markets.Market;
import internal.qaauto.inrunning.tom.markets.MarketImpl;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.lang.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.concurrent.TimeUnit;

//import internal.qaauto.inrunning.utils.WaitUtils;

/**
 * Created by Harish Renukunta on 03/10/2014.
 */
public class LiveBettingPageImpl extends CommonBovadaBodogPage implements LiveBettingPage {

    //private static final String MARKET_SELECTOR = "#coupon > ul > li";
    private static final String MARKET_SELECTOR = "//div[@id='coupon']/ul/li";

    //private By marketLocator = new By.ByCssSelector(MARKET_SELECTOR);
    private By marketLocator = new By.ByXPath(MARKET_SELECTOR);

    private static final String LEFT_NAV_SELECTOR = "leftCol";

    private By leftNavLocator = new By.ById(LEFT_NAV_SELECTOR);

    private static final String QBM_SELECTOR = ".quick-bet-mode,.betting-mode";

    private By quickBetModeLocator = new By.ByCssSelector(QBM_SELECTOR);

    private static final String COUPON_COMPONENT_SELECTOR = "#coupon";

    private By couponComponentLocator = new By.ByCssSelector(COUPON_COMPONENT_SELECTOR);

    private static final String BETSLIP_COMPONENT_SELECTOR = "#live-betslip";

    private By betSlipLocator = new By.ByCssSelector(BETSLIP_COMPONENT_SELECTOR);

    private static final String BETSLIP_MODE = "#live-bets-strip";

    private By betSlipMode = new By.ByCssSelector(BETSLIP_MODE);

    private static final String SIGNIN_LOCATOR = "#submitSignIn";

    private By signIn_selector = new By.ByCssSelector(SIGNIN_LOCATOR);

    private static final String ODDS_CONTAINER_SELECTOR = "div.price-format-menu";

    private By oddsContainerLocator = new By.ByCssSelector(ODDS_CONTAINER_SELECTOR);

    private static final String ODDS_SELECTOR = ":scope>ul>li";

    private By oddsLocator = new By.ByCssSelector(ODDS_SELECTOR);

    private static final String PASSWORD_LOCATOR = "password";

    private By password_selector = new By.ById(PASSWORD_LOCATOR);

    private static final String TIMEZONE_SELECTOR = "#timeZoneCodeHolder";

    private By timeZoneLocator = new By.ByCssSelector(TIMEZONE_SELECTOR);

    private static final String USERNAME_LOCATOR = "username";

    private By username_selector = new By.ById(USERNAME_LOCATOR);

    private static final int SELECTION_INDEX = 0;

    private static final String EVENT_RESOURCE = "/event/";

    private static final String SIGN_IN = "submitSignIn";

    private static final String LOGOUT_FORM = "logoutForm";

    private static String LOGIN_PAGE_URL;

    private static String FRONT_END_ENV;

    private String pageURL = StringUtils.EMPTY;
    
    private String LINT_ENV = "lint";
    
    private static final String USERNAME = "10081802";

    private static final String PASSWORD = "Testing1";
    
    private static final String LINT_USERNAME = "10065950";
    
    private static final String LINT_PASSWORD = "testing";
    
    private static final String INVALID_ENVIRONMENT = "Invalid environment '%s'. Please provide correct environment in jqaConfigOverride.properties";
    
    static {
        try {
            final String env = ConfigManager.getEnv();
        	if(env.equals(BGSEnvironment.MDEV.getEnvironmentLabel())){
        		FRONT_END_ENV = BGSEnvironment.LDEV.getEnvironmentLabel();
        	}else if(env.equals(BGSEnvironment.LINT.getEnvironmentLabel())){
        		FRONT_END_ENV = BGSEnvironment.LINT.getEnvironmentLabel();
          	}else{
          		Assert.fail(String.format(INVALID_ENVIRONMENT, env));
          	}
            LOGIN_PAGE_URL = "https://www." + FRONT_END_ENV + "." + ConfigManager.getConfig().getString("domain.id");

        } catch (ConfigurationException ex) {
            Assert.fail("Configuration Exception : " + ex.getMessage());
        }
    }

    public LiveBettingPageImpl() {
        try {
            if(FRONT_END_ENV.equals(LINT_ENV)){
                this.pageURL = "http://live.";
            }else{
                this.pageURL = "http://bgs-live."; 
            }
            this.pageURL += FRONT_END_ENV + "." + ConfigManager.getConfig().getString("domain.id");
            webDriver.manage().timeouts().pageLoadTimeout(60, TimeUnit.SECONDS);
            webDriver.manage().timeouts().setScriptTimeout(60, TimeUnit.SECONDS);
        } catch (ConfigurationException ex) {
            reporter.info("Configuration Exception:" + ex.getMessage());
        }
    }
    
    public static String getFrontEndEnv(){
    	return FRONT_END_ENV;
    }

    @Override
    public LeftNavMenu getLeftNav() {
        return new LeftNavMenuImpl(webDriver.findElement(leftNavLocator));
    }

    @Override
    public LiveNowEventsComponent getLiveNowCouponsComponent() {

        return getLeftNav().getLiveNowCouponsComponent();
    }

    @Override
    public LeftNavLiveNowEvent getLiveNowEventByName(final String sport, final String eventName) {
        final LiveNowEventsComponent liveNowComponent = getLiveNowCouponsComponent();
        FluentWait<LiveNowEventsComponent> fWait = new FluentWait<LiveNowEventsComponent>(liveNowComponent);
        LeftNavLiveNowEvent leftNavEvent;
        try {
            leftNavEvent = fWait.until(new Function<LiveNowEventsComponent, LeftNavLiveNowEvent>() {
                @Override
                public LeftNavLiveNowEvent apply(LiveNowEventsComponent eventsComponent) {
                    final LeftNavEvent leftNavEvent = liveNowComponent.getLeftNavEventByName(sport, eventName);
                    if (leftNavEvent != null) {
                        return (LeftNavLiveNowEvent) leftNavEvent;
                    }
                    return null;
                }
            });
        } catch (Exception ex) {
            return null;
        }
        return leftNavEvent;

    }

    @Override
    public LeftNavEvent getUpcomingEventByName(final String sport, final String eventName) {
        final UpcomingEventsComponent upcomingEvent = getUpcomingEventsComponent();
        FluentWait<UpcomingEventsComponent> fWait = new FluentWait<UpcomingEventsComponent>(upcomingEvent);
        final LeftNavEvent leftNavEvent;
        try {
            leftNavEvent = fWait.until(new Function<UpcomingEventsComponent, LeftNavEvent>() {
                @Override
                public LeftNavEvent apply(final UpcomingEventsComponent eventsComponent) {
                    return eventsComponent.getLeftNavEventByName(eventName, sport);
                }
            });
        } catch (Exception ex) {
            return null;
        }

        return leftNavEvent;
    }

    @Override
    public UpcomingEventsComponent getUpcomingEventsComponent() {
        return getLeftNav().getUpcomingCouponsComponent();
    }

    @Override
    public EventComponentInterface getEventsComponent() {
        WebElement couponArea = getChildWebElement(couponComponentLocator);
        return new EventComponent(couponArea);
    }

    @Override
    public List<Market> getMarkets() {
        List<WebElement> marketWebElements = webDriver.findElements(marketLocator);
        if (marketWebElements.size() == 0) {
            return null;
        }
        List<Market> markets = new LinkedList<Market>();
        for (WebElement marketWebElement : marketWebElements) {
            markets.add(new MarketImpl(marketWebElement));
        }
        return markets;
    }

    @Override
    public Market getMarketByTitle(final String title) {
        List<Market> markets = getMarkets();
        if (markets == null) {
            return null;
        }
        boolean marketFound = false;
        String marketTitle = StringUtils.EMPTY;
        Market desiredMarket = null;
        for (int i = 0; (i < markets.size() && marketFound == false); i++) {
            marketTitle = markets.get(i).getMarketTitle();
            if (title.toUpperCase().equals(marketTitle)) {
                marketFound = true;
                desiredMarket = markets.get(i);
            }
        }
        return desiredMarket;
    }

    @Override
    public BetSlipModeComponent getBetSlipModeComponent() {
        List<WebElement> betSlipModeWebElements = webDriver.findElements(betSlipMode);
        if (betSlipModeWebElements == null || betSlipModeWebElements.size() == 0) {
            return null;
        }
        return new BetSlipModeComponentImpl(betSlipModeWebElements.get(SELECTION_INDEX));
    }

    @Override
    public BetSlip getBetSlip() {
        List<WebElement> betSlipWebElements = webDriver.findElements(betSlipLocator);
        if (betSlipWebElements == null || betSlipWebElements.size() == 0) {
            return null;
        }
        return new BetSlipImpl(betSlipWebElements.get(SELECTION_INDEX));
    }

    @Override
    public WebElement getChildWebElement(final By childElementLocator) {
        List<WebElement> childWebElements = webDriver.findElements(childElementLocator);
        if (childWebElements == null || childWebElements.size() == 0) {
            return null;
        }
        return childWebElements.get(SELECTION_INDEX);
    }

    @Override
    public void setOddsFormat(final String oddsFormat) {
        String formatToSelect = null;
        if (oddsFormat.equals(Odds.AMERICAN.getOddsFormat())) {
            formatToSelect = Odds.AMERICAN.getOddsFormatText();
        } else if (oddsFormat.equals(Odds.DECIMAL.getOddsFormat())) {
            formatToSelect = Odds.DECIMAL.getOddsFormatText();
        } else if (oddsFormat.equals(Odds.FRACTIONAL.getOddsFormat())) {
            formatToSelect = Odds.FRACTIONAL.getOddsFormatText();
        }

        if (StringUtils.isNotEmpty(formatToSelect)) {
            final WebElement oddsContainer = webDriver.findElement(oddsContainerLocator);
            oddsContainer.click();
            final List<WebElement> odds = oddsContainer.findElements(oddsLocator);
            for (final WebElement odd : odds) {
                if (formatToSelect.equals(odd.getText())) {
                    odd.click();
                    break;
                }
            }
        }
    }

    @Override
    public void go() {
        goToEvent(StringUtils.EMPTY);
    }

    private void waitForLeftNavToRender() {
        final WaitUtils waitUtils = new WaitUtils();
        waitUtils.setTimeOut(60);
        waitUtils.waitForEventsComponentToRender(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT);
        waitUtils.waitForEventsComponentToRender(LeftNavComponents.UPCOMING_EVENTS_COMPONENT);

    }

    @Override
    public String getPageURL() {
        return this.pageURL;
    }

    @Override
    public void refresh() {
        goToEvent(StringUtils.EMPTY);
    }

    @Override
    public void goToEvent(final String gameId) {
        webDriver.get(pageURL + EVENT_RESOURCE + gameId);
        waitForLeftNavToRender();
    }
    
    @Override
    public QuickBetMode getQuickBetMode() {
        List<WebElement> qbmWebElements = webDriver.findElements(quickBetModeLocator);
        if (qbmWebElements == null) {

            return null;
        }
        return new QuickBetModeImpl(qbmWebElements.get(SELECTION_INDEX));
    }

    @Override
    public String getTimeZone() {
        final WebElement timeZoneWebElement;
        try {
            timeZoneWebElement = webDriver.findElement(timeZoneLocator);
        } catch (NoSuchElementException ex) {
            return StringUtils.EMPTY;
        }
        return timeZoneWebElement.getText();
    }

    @Override
    public List<LeftNavLiveNowEvent> getLiveNowEventsBySport(String sport) {
        final LiveNowEventsComponent liveNowEventsComponent = getLiveNowCouponsComponent();
        final List<LeftNavEvent> leftNavEvents = liveNowEventsComponent.getLeftNavEventsBySport(sport);
        return (List<LeftNavLiveNowEvent>) ((List<?>) leftNavEvents);
    }

    @Override
    public void login(final String uname, final String pwd) {
        //this.webDriver.get(LOGIN_PAGE_URL);
        this.webDriver.get(getLoginPageUrl());
        
        final WebElement username = webDriver.findElement(username_selector);
        final WebElement password = webDriver.findElement(password_selector);
        final WebElement signIn = webDriver.findElement(signIn_selector);
        username.sendKeys(uname);
        username.sendKeys(Keys.TAB);
        password.sendKeys(pwd);
        signIn.click();
    }
    
    @Override
    public void login(){
        Map<String, String> loginDetails = getUserDetails();
        login(loginDetails.get("username"), loginDetails.get("password"));
    }
    private String getLoginPageUrl(){
        final String loginUrl;
        if(FRONT_END_ENV.equals(LINT_ENV)){
            loginUrl = this.pageURL;
        }else{
            loginUrl = this.LOGIN_PAGE_URL;
        }
        return loginUrl;
    }
    
        
    private Map<String, String> getUserDetails(){
        final Map<String, String> userDetails = new HashMap<String, String>();
        if(FRONT_END_ENV.equals(LINT_ENV)){
            userDetails.put("username",LINT_USERNAME);
            userDetails.put("password",LINT_PASSWORD);
        }else{
            userDetails.put("username",USERNAME);
            userDetails.put("password",PASSWORD);
        }
        return userDetails;
    }

    @Override
    public void loginInPageHeader(final String uname, final String pwd) {
        final WebElement username = webDriver.findElement(username_selector);
        final WebElement password = webDriver.findElement(password_selector);
        final WebElement signIn = webDriver.findElement(signIn_selector);
        username.sendKeys(uname);
        username.sendKeys(Keys.TAB);
        password.sendKeys(pwd);
        signIn.click();
    }

    @Override
    public boolean logout() {
        this.webDriver.get(LOGIN_PAGE_URL);
        final List<WebElement> signOut=webDriver.findElements(By.linkText("Sign Out"));
        if (signOut.size() > 0) {
            signOut.get(0).click();
            return true;
        }
        return false;
    }

    @Override
    public String getAccountBalance() {
        final WebElement currency = webDriver.findElement(By.id("accountCurrencySymbolHolder"));
        final WebElement balance = webDriver.findElement(By.id("accountBalanceHolder"));
        final String accountBalance = currency.getText() + " " + balance.getText();
        return accountBalance;
    }

    @Override
    public LeftNavEventsComponent getLeftNavEventsComponent(final LeftNavComponents eventsComponent) {
        final LeftNavEventsComponent navEventsComponent;
        if (LeftNavComponents.UPCOMING_EVENTS_COMPONENT.equals(eventsComponent)) {
            navEventsComponent = getUpcomingEventsComponent();
        } else {
            navEventsComponent = getLiveNowCouponsComponent();
        }
        return navEventsComponent;
    }

    @Override
    public String getCurrentURL() {
        return webDriver.getCurrentUrl();
    }

    @Override
    public LeftNavEvent getFirstLeftNavEvent() {
        final Sport sport = getFirstSportByEventsComponent();
        LeftNavEvent leftNavEvent = null;
        if (sport != null) {
            leftNavEvent = sport.getEvents().get(0);
        }
        return leftNavEvent;
    }

    private Sport getFirstSportByEventsComponent() {
        final LeftNavComponents[] menuComponent =
                { LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT, LeftNavComponents.UPCOMING_EVENTS_COMPONENT };
        Sport desiredSport = null;
        for (Object navComponent : Arrays.asList(menuComponent)) {
            final LeftNavEventsComponent eventsComponent = getLeftNavEventsComponent((LeftNavComponents) navComponent);
            final List<Sport> sports = eventsComponent.getSportGroups();
            if (sports != null && !sports.isEmpty()) {
                desiredSport = sports.get(0);
                break;
            }
        }
        return desiredSport;

    }
}
