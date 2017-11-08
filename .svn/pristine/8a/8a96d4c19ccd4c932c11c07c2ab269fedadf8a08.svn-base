package internal.qaauto.inrunning.utils;

import com.google.common.base.Function;
import com.google.common.base.Predicate;
import internal.qaauto.inrunning.framework.InRunningBaseStep;
import internal.qaauto.inrunning.tom.LiveBettingPage;
import internal.qaauto.inrunning.tom.MyBets.MyBets;
import internal.qaauto.inrunning.tom.Utilties.LeftNavComponents;
import internal.qaauto.inrunning.tom.Utilties.OutcomeStatus;
import internal.qaauto.inrunning.tom.betslip.BetSlip;
import internal.qaauto.inrunning.tom.betslip.BetSlipModeComponent;
import internal.qaauto.inrunning.tom.betslip.BetSlipSelection;
import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavUpcomingEvent;
import internal.qaauto.inrunning.tom.leftnav.LeftNavEventsComponent;
import internal.qaauto.inrunning.tom.leftnav.Sport;
import internal.qaauto.inrunning.tom.markets.Market;
import internal.qaauto.inrunning.tom.markets.MarketOutcome;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.UtilsPXP;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.interfaces.Event;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.interfaces.Line;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.lines.LineFactory;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.lines.NewPlayOutcomeLine;
import org.apache.commons.configuration.ConfigurationException;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Created by Harish Renukunta on 12/11/2014.
 */
public class WaitUtils extends InRunningBaseStep {

    private static final String MESSAGE_SELECTOR = "p";

    public static final int MILLISECONDS_TIMEOUT = 500;

    private final By messageLocator = new By.ByCssSelector(MESSAGE_SELECTOR);

    private static final String GREEN = "green";

    private static final String RED = "red";

    private static final String PLACING_BETS_MSG = "Placing bets..";

    private static final String LOAD_ICON_SELECTOR = "//*[contains(@class,'loading-markets-msg')]";
    
    private static final int EVENT_WAIT_TIME = 5000;
    
    private static final int MARKET_DISPLAY_TIMEOUT_SECS = 15;

    private final By loadIconLocator = new By.ByXPath(LOAD_ICON_SELECTOR);

    private int maxTimeOut = 5;

    public int getTimeOut() {
        return maxTimeOut;
    }

    public void setTimeOut(final int seconds) {
        maxTimeOut = seconds;
    }

    public void setTimeOut(final String seconds) {
        maxTimeOut = Integer.parseInt(seconds);
    }

    public void waitForMarketToDisplayInCoupon(final LiveBettingPage page, final String marketTitle) {
        final FluentWait<LiveBettingPage> wait = new FluentWait<LiveBettingPage>(page);
        wait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(MARKET_DISPLAY_TIMEOUT_SECS, TimeUnit.SECONDS);
        wait.until(new Predicate<LiveBettingPage>() {
            @Override
            public boolean apply(LiveBettingPage input) {
                try {
                    if (page.getMarketByTitle(marketTitle) == null) {
                        return Boolean.FALSE;
                    } else {
                        return Boolean.TRUE;
                    }
                } catch (final StaleElementReferenceException ex) {
                    return Boolean.FALSE;
                }
            }
        });
    }

    public void waitForMarketsToDisplay() {
        final FluentWait<LiveBettingPage> wait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        wait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            wait.until(new Predicate<LiveBettingPage>() {
                @Override
                public boolean apply(LiveBettingPage page) {
                    try {
                        List<Market> markets = page.getMarkets();
                        return (markets != null);
                    } catch (final StaleElementReferenceException ex) {
                        return false;
                    }
                }
            });
        } catch (TimeoutException ex) {
            reporter.info(ex.getMessage());
        }
    }

    public void waitForMarketWithTitleSuspended(final String marketTitle) throws ConfigurationException, IOException {
        getManager().update(UtilsPXP.marshallEventToUpdate(getEvent()));
        final LiveBettingPage page = getLiveBettingPage();
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(page);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<LiveBettingPage>() {
                @Override
                public boolean apply(LiveBettingPage page) {
                    boolean suspensionStatus = false;
                    final Market market;
                    try {
                        market = page.getMarketByTitle(marketTitle);
                        if (market != null) {
                            suspensionStatus = market.isSuspended();
                        }
                    } catch (final StaleElementReferenceException ex) {
                        return false;
                    }
                    return suspensionStatus;

                }
            });
        } catch (Exception ex) {
            return;
        }

    }

    public void waitForMarketWithTitleUnSuspended(final String marketTitle) throws ConfigurationException, IOException {
        getManager().update(UtilsPXP.marshallEventToUpdate(getEvent()));
        final LiveBettingPage page = getLiveBettingPage();
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(page);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<LiveBettingPage>() {
                @Override
                public boolean apply(LiveBettingPage page) {
                    boolean suspensionStatus = false;
                    final Market market;
                    try {
                        market = page.getMarketByTitle(marketTitle);
                        if (market != null) {
                            suspensionStatus = market.isSuspended();
                        }
                    } catch (final StaleElementReferenceException ex) {
                        return false;
                    }
                    return !suspensionStatus;

                }
            });
        } catch (Exception ex) {
            return;
        }

    }

    public void waitForMarketWithTitleToDisappear(final String marketTitle) throws ConfigurationException, IOException {
        final Event event = getEvent();
        final Line extraMarket = LineFactory.getLineInstance(NewPlayOutcomeLine.MARKET_NAME, event);
        extraMarket.setDisplayText("Extra Market 2");
        event.addLine(extraMarket);
        getManager().update(UtilsPXP.marshallEventToUpdate(getEvent()));
        getManager().update(UtilsPXP.marshallEventToUpdate(getEvent()));
        final LiveBettingPage page = getLiveBettingPage();
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(page);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<LiveBettingPage>() {
                @Override
                public boolean apply(LiveBettingPage page) {
                    boolean marketNotExists = false;
                    final Market market;
                    try {
                        market = page.getMarketByTitle(marketTitle);
                        marketNotExists = (market == null);

                    } catch (final StaleElementReferenceException ex) {
                        return false;
                    }
                    return marketNotExists;

                }
            });
        } catch (Exception ex) {
            return;
        }
    }

    public void waitForOutcomeToDisappear(final String marketTitle, final String outcomeDesc) throws ConfigurationException,
            IOException {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.pollingEvery(1000, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);

        try {
            fWait.until(new Predicate<LiveBettingPage>() {
                @Override
                public boolean apply(LiveBettingPage page) {
                    boolean outcomeStatus = false;
                    try {
                        getManager().update(UtilsPXP.marshallEventToUpdate(getEvent()));
                        final Market market = page.getMarketByTitle(marketTitle);
                        final MarketOutcome outcome = market.getOutcomeByDescription(outcomeDesc);
                        outcomeStatus = (outcome == null);
                    } catch (StaleElementReferenceException | ConfigurationException | IOException EX) {
                        return false;
                    }
                    return outcomeStatus;
                }
            });
        } catch (Exception ex) {
            return;
        }

    }

    public void waitForOutcomeToBeIdle(final String marketTitle, final String outcomeDesc) {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.pollingEvery(1000, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);

        try {
            fWait.until(new Predicate<LiveBettingPage>() {
                @Override
                public boolean apply(LiveBettingPage page) {
                    try {
                        final Market market = page.getMarketByTitle(marketTitle);
                        final MarketOutcome outcome = market.getOutcomeByDescription(outcomeDesc);
                        final String outcomeClass = outcome.getWebElement().getAttribute("class");
                        if ((outcomeClass == null) || (!outcomeClass.contains(OutcomeStatus.ACCEPTED.getStatusLabel()))
                                        && !outcomeClass.contains(OutcomeStatus.REJECTED.getStatusLabel())) {
                            return true;
                        }
                    } catch (StaleElementReferenceException EX) {
                        reporter.info(EX.getMessage());
                        return false;
                    }
                    return false;
                }
            });
        } catch (Exception ex) {
            reporter.info("Exception:" + ex.getMessage());
            return;
        }

    }

    public MarketOutcome waitForOutcomeToDisplay(final String marketTitle, final String outcomeDesc)
            throws ConfigurationException, IOException {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.pollingEvery(1000, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        getManager().update(UtilsPXP.marshallEventToUpdate(getEvent()));

        try {
            return fWait.until(new Function<LiveBettingPage, MarketOutcome>() {
                @Override
                public MarketOutcome apply(LiveBettingPage page) {
                    MarketOutcome outcome = null;
                    try {
                        final Market market = page.getMarketByTitle(marketTitle);
                        outcome = market.getOutcomeByDescription(outcomeDesc);

                    } catch (StaleElementReferenceException ex) {
                        reporter.info("Exception when waiting for outcome:" + ex.getMessage());
                        return null;
                    }
                    return outcome;
                }
            });
        } catch (Exception ex) {
            reporter.info("Exception when waiting for outcome:" + ex.getMessage());
            return null;
        }

    }

    public void waitForPriceUpdate(final String outcomeDesc, final String expectedPrice) throws ConfigurationException,
            IOException {
        final LiveBettingPage page = getLiveBettingPage();
        final FluentWait<String> fWait = new FluentWait<String>(outcomeDesc);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<String>() {
                @Override
                public boolean apply(final String outcomeDesc) {
                    boolean isPriceUpdated = false;
                    try {
                        getManager().update(UtilsPXP.marshallEventToUpdate(getEvent()));
                        final MarketOutcome marketOutcome = page.getMarkets().get(0).getOutcomeByDescription(outcomeDesc);
                        isPriceUpdated = expectedPrice.equals(marketOutcome.getPrice());
                    } catch (final Exception ex) {
                        return false;
                    }
                    return isPriceUpdated;
                }
            });
        } catch (Exception ex) {
            return;
        }

    }
    
    public void waitForPriceUpdate(final Event event, final String marketTitle, final String outcomeDesc, final String expectedPrice) throws ConfigurationException,
    IOException {
        final LiveBettingPage page = getLiveBettingPage();
        final FluentWait<String> fWait = new FluentWait<String>(marketTitle);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<String>() {
                @Override
                public boolean apply(final String marketTitle) {
                    boolean isPriceUpdated = false;
                    try {
                        getManager().update(UtilsPXP.marshallEventToUpdate(event));
                        final MarketOutcome marketOutcome = page.getMarketByTitle(marketTitle).getOutcomeByDescription(outcomeDesc);
                        isPriceUpdated = expectedPrice.equals(marketOutcome.getPrice());
                    } catch (final Exception ex) {
                        return false;
                    }
                    return isPriceUpdated;
                }
            });
        } catch (Exception ex) {
            reporter.info(ex.getMessage());
            return;
        }

}

    public void waitForHandicapUpdate(final String handicapValue, String marketTitle) {
        final Market market = getLiveBettingPage().getMarketByTitle(marketTitle);
        final FluentWait<Market> fWait = new FluentWait<Market>(market);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<Market>() {
                @Override
                public boolean apply(Market market) {
                    boolean isHandicapUpdated = false;
                    try {
                        final MarketOutcome marketOutcome = market.getOutcomeByPosition(0);
                        isHandicapUpdated = handicapValue.equals(marketOutcome.getHandicapValue());
                        if (!isHandicapUpdated) {
                            getManager().update(UtilsPXP.marshallEventToUpdate(getEvent()));
                        }
                    } catch (final Exception ex) {
                        return false;
                    }
                    return isHandicapUpdated;
                }
            });
        } catch (Exception ex) {
            return;
        }
    }

    public void waitForQBMBetToPlaced(final String marketTitle, final String outcomeDesc) {
        final Market market = getLiveBettingPage().getMarketByTitle(marketTitle);
        final FluentWait<Market> fWait = new FluentWait<Market>(market);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(60, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<Market>() {
                @Override
                public boolean apply(Market market) {
                    boolean isQBMBetPlaced = false;
                    try {
                        final MarketOutcome marketOutcome = market.getOutcomeByDescription(outcomeDesc);
                        isQBMBetPlaced = marketOutcome.isQBMBetPlaced();
                    } catch (final StaleElementReferenceException ex) {
                        return false;
                    }
                    return isQBMBetPlaced;
                }
            });
        } catch (Exception ex) {
            return;
        }
    }

    public void waitForBetToBePlaced() {
        final BetSlip betSlip = getLiveBettingPage().getBetSlip();
        final FluentWait<BetSlip> fWait = new FluentWait<BetSlip>(betSlip);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<BetSlip>() {
                @Override
                public boolean apply(BetSlip betSlip1) {
                    boolean isBetPlaced = false;
                    try {
                        final BetSlip betSlip = getLiveBettingPage().getBetSlip();
                        isBetPlaced = (betSlip.getMessage().equals(PLACING_BETS_MSG));
                    } catch (final StaleElementReferenceException ex) {
                        return false;
                    }
                    return isBetPlaced;
                }
            });
        } catch (Exception ex) {
            return;
        }
    }

    public void waitForPriceChangeArrowToDisplay(final String outcomeDesc) {
        final LiveBettingPage page = getLiveBettingPage();
        final FluentWait<String> fWait = new FluentWait<String>(outcomeDesc);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<String>() {
                @Override
                public boolean apply(final String outcomeDesc) {
                    boolean isPriceChangeArrowDisplayed = false;
                    try {
                        final MarketOutcome marketOutcome = page.getMarkets().get(0).getOutcomeByDescription(outcomeDesc);
                        final String priceChangeArrow = marketOutcome.getDisplayedArrow();
                        isPriceChangeArrowDisplayed = (priceChangeArrow.equals(GREEN) || priceChangeArrow.equals(RED));
                    } catch (StaleElementReferenceException ex) {
                        return false;
                    }
                    return isPriceChangeArrowDisplayed;
                }
            });
        } catch (Exception ex) {
            return;
        }

    }

    public Sport waitForSportToDisplay(final LeftNavComponents navEventsComponent, final String sport) {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.pollingEvery(EVENT_WAIT_TIME, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS).ignoring(
                TimeoutException.class);

        Sport sportGroup = null;
        try {
            sportGroup = fWait.until(new Function<LiveBettingPage, Sport>() {
                @Override
                public Sport apply(LiveBettingPage page) {
                    final LeftNavEventsComponent eventsComponent;
                    try {
                        
                        eventsComponent = page.getLeftNavEventsComponent(navEventsComponent);
                    } catch (StaleElementReferenceException ex) {
                        return null;
                    }
                    final Sport sportGroup = eventsComponent.getSportByTitle(sport);
                    if(sportGroup == null){
                        page.go();
                    }
                    return sportGroup;
                }

            });
        } catch (TimeoutException ex) {
            reporter.info(ex.getMessage());
        }

        return sportGroup;

    }

    public MarketOutcome waitForOutcomeToUnSuspend(final Market market, final String outcomeDescription) {
        final FluentWait<Market> fWait = new FluentWait<Market>(market);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS).ignoring(
                TimeoutException.class);
        MarketOutcome marketOutcome = null;

        try {
            marketOutcome = fWait.until(new Function<Market, MarketOutcome>() {

                @Override
                public MarketOutcome apply(final Market market) {
                    MarketOutcome marketOutcome = null;
                    try {
                        marketOutcome = market.getOutcomeByDescription(outcomeDescription);
                        if ((marketOutcome != null) && (!marketOutcome.isSuspended())
                                && (marketOutcome.getDescription().indexOf("SUSPENDED") == -1)) {
                            return marketOutcome;
                        }
                    } catch (Exception ex) {
                        reporter.info(ex.getMessage());
                    }
                    return null;
                }

            });
        } catch (TimeoutException ex) {
            reporter.info(ex.getMessage());
        }
        return marketOutcome;

    }

    public boolean waitForBetToRender(final String outcomeDescription) {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS).ignoring(
                TimeoutException.class);

        try {
            fWait.until(new Predicate<LiveBettingPage>() {

                @Override
                public boolean apply(final LiveBettingPage page) {
                    try {
                        final BetSlip betslip = page.getBetSlip();
                        List<BetSlipSelection> betSelections = betslip.getBetslipSelections();
                        for (BetSlipSelection selection : betSelections) {
                            if (outcomeDescription.equals(selection.getDescription())) {
                                return true;
                            }
                        }
                    } catch (Exception ex) {
                        reporter.info(ex.getMessage());
                        return false;
                    }
                    return false;
                }

            });
        } catch (TimeoutException ex) {
            reporter.info(ex.getMessage());
            return false;
        }
        return true;

    }

    public void waitForMessageToDisplayInCouponArea(final String message) {
        final FluentWait<String> wait = new FluentWait<String>(message);
        wait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            wait.until(new Predicate<String>() {
                @Override
                public boolean apply(final String message) {
                    boolean isMessageDisplayed = Boolean.FALSE;
                    try {
                        final WebElement couponArea = getCouponArea();
                        final List<WebElement> noMarketMsgWebElements = couponArea.findElements(messageLocator);
                        if (noMarketMsgWebElements.isEmpty()) {
                            return Boolean.FALSE;
                        }
                        isMessageDisplayed = noMarketMsgWebElements.get(0).getText().equalsIgnoreCase(message);
                        return isMessageDisplayed;
                    } catch (StaleElementReferenceException ex) {
                        return Boolean.FALSE;
                    }
                }
            });
        } catch (TimeoutException te) {
            reporter.info(te.getMessage());
            return;
        }

    }

    public void waitForMessageNotToDisplayInCouponArea(final String message) {
        final FluentWait<String> wait = new FluentWait<String>(message);
        wait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            wait.until(new Predicate<String>() {
                @Override
                public boolean apply(final String message) {
                    boolean isMessageDisplayed = false;
                    try {
                        final WebElement couponArea = getCouponArea();
                        final List<WebElement> noMarketMsgWebElements = couponArea.findElements(messageLocator);
                        if (noMarketMsgWebElements.isEmpty()) {
                            return true;
                        }
                        isMessageDisplayed = noMarketMsgWebElements.get(0).getText().equalsIgnoreCase(message);
                        return !isMessageDisplayed;
                    } catch (StaleElementReferenceException ex) {
                        return false;
                    }
                }
            });
        } catch (TimeoutException te) {
            reporter.info(te.getMessage());
            return;
        }
    }

    public LeftNavEvent waitForLeftNavEventToDisplay(final LeftNavComponents navEventComponent, final String sport,
            final String eventName) {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.withTimeout(maxTimeOut, TimeUnit.SECONDS).pollingEvery(EVENT_WAIT_TIME, TimeUnit.MILLISECONDS);
        LeftNavEvent leftNavEvent = null;
        try {
            leftNavEvent = fWait.until(new Function<LiveBettingPage, LeftNavEvent>() {
                @Override
                public LeftNavEvent apply(final LiveBettingPage page) {
                    final LeftNavEventsComponent eventsComponent = page.getLeftNavEventsComponent(navEventComponent);
                    final LeftNavEvent leftNavEvent = eventsComponent.getLeftNavEventByName(sport, eventName);
                    if(leftNavEvent == null){
                        page.go();
                    }
                    return leftNavEvent;
                }

            });
        } catch (Exception ex) {
            reporter.info(ex.getMessage());
        }
        return leftNavEvent;

    }

    public void waitForLeftNavEventToDisappear(final LeftNavComponents navEventComponent, final String sport,
            final String eventName) {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.withTimeout(maxTimeOut, TimeUnit.SECONDS).pollingEvery(EVENT_WAIT_TIME, TimeUnit.MILLISECONDS);
        try {
            fWait.until(new Predicate<LiveBettingPage>() {
                @Override
                public boolean apply(final LiveBettingPage page) {
                    page.go();
                    final LeftNavEventsComponent eventsComponent = page.getLeftNavEventsComponent(navEventComponent);
                    final LeftNavEvent leftNavEvent = eventsComponent.getLeftNavEventByName(sport, eventName);
                    return (leftNavEvent == null);
                }

            });
        } catch (Exception ex) {
            reporter.info(ex.getMessage());
        }
    }

    public void waitForTextToDisplayInUpcomingEventBottomRow(final LeftNavUpcomingEvent upcomingEvent, final String message) {
        final FluentWait<LeftNavUpcomingEvent> fWait = new FluentWait<LeftNavUpcomingEvent>(upcomingEvent);
        fWait.withTimeout(maxTimeOut, TimeUnit.SECONDS).pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS);
        try {
            fWait.until(new Predicate<LeftNavUpcomingEvent>() {
                @Override
                public boolean apply(final LeftNavUpcomingEvent upEvent) {
                    return (upEvent.isTextDisplayedInBottomRow(message));
                }

            });
        } catch (Exception ex) {
            reporter.info(ex.getMessage());
        }
    }

    public boolean waitForSelectionMessage(final String selection) {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS).ignoring(
                TimeoutException.class);

        try {
            fWait.until(new Predicate<LiveBettingPage>() {

                @Override
                public boolean apply(final LiveBettingPage page) {
                    try {
                        final BetSlip betslip = page.getBetSlip();
                        BetSlipSelection betSelection = betslip.getSelectionByDescription(selection);
                        final String message = betSelection.getMessage();
                        if (message == null || message.isEmpty()) {
                            return Boolean.FALSE;
                        }
                        return Boolean.TRUE;
                    } catch (Exception ex) {
                        return Boolean.FALSE;
                    }
                }
            });
        } catch (TimeoutException ex) {
            reporter.info(ex.getMessage());
            return Boolean.FALSE;
        }
        return Boolean.TRUE;
    }

    public boolean waitForSelectionMessageInBetSlip(final String selection, final String selectionMessage) {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS).ignoring(
                TimeoutException.class);
        try {
            fWait.until(new Predicate<LiveBettingPage>() {
                @Override
                public boolean apply(final LiveBettingPage page) {
                    try {
                        final BetSlip betslip = page.getBetSlip();
                        final BetSlipSelection betSelection = betslip.getSelectionByDescription(selection);
                        final String message = betSelection.getMessage();
                        if (!message.isEmpty() && selectionMessage.equals(message)) {
                            return true;
                        }
                        return false;
                    } catch (Exception ex) {
                        reporter.info(ex.getMessage());
                        return false;
                    }
                }
            });
        } catch (TimeoutException ex) {
            reporter.info(ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean waitForNoEventsMsgToDisplayInEventsComponent(final LeftNavComponents eventsComponent) {
        //final LeftNavEventsComponent navEventsComponent = getLeftNavEventsComponent(eventsComponent);
        final FluentWait<LeftNavComponents> fWait = new FluentWait<LeftNavComponents>(eventsComponent);
        fWait.pollingEvery(2000, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS).ignoring(
                TimeoutException.class);
        try {

            fWait.until(new Predicate<LeftNavComponents>() {

                @Override
                public boolean apply(final LeftNavComponents navEventsComponent) {
                    try {
                            getLiveBettingPage().go();
                            final LeftNavEventsComponent component = getLeftNavEventsComponent(navEventsComponent);
                            final WebElement errorMsgWebElement = (component.getWebElement().findElement(By.xpath("p[contains(@class, 'no-events-msg')]")));
                            reporter.info("p:" + errorMsgWebElement.getText());
                            return (errorMsgWebElement != null);
                    } catch (Exception ex) {
                        reporter.info(ex.getMessage());
                        return false;
                    }
                }
            });
        } catch (TimeoutException ex) {
            reporter.info(ex.getMessage());
            return Boolean.FALSE;
        }
        return Boolean.TRUE;
    }

    public void waitForPriceUpdateInBetslip(final String selection, final String price) {
        final BetSlip betslip = getLiveBettingPage().getBetSlip();
        final FluentWait<String> fWait = new FluentWait<String>(selection);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<String>() {
                @Override
                public boolean apply(final String outcomeDesc) {
                    boolean isPriceChangeDisplayed = Boolean.FALSE;
                    try {
                        final BetSlipSelection betSlipSelection = betslip.getSelectionByDescription(selection);
                        final String priceChange = betSlipSelection.getPrice();
                        isPriceChangeDisplayed = (priceChange.equals(price));
                    } catch (StaleElementReferenceException ex) {
                        return false;
                    }
                    return isPriceChangeDisplayed;
                }
            });
        } catch (TimeoutException ex) {
            return;
        }
    }

    public void waitForPriceChangeArrowToDisplayInBetslip(final String selection) {
        final BetSlip betslip = getLiveBettingPage().getBetSlip();
        final FluentWait<String> fWait = new FluentWait<String>(selection);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<String>() {
                @Override
                public boolean apply(final String outcomeDesc) {
                    boolean isPriceChangeArrowDisplayed = Boolean.FALSE;
                    try {
                        final BetSlipSelection betSlipSelection = betslip.getSelectionByDescription(selection);
                        final String priceChangeArrow = betSlipSelection.getDisplayedArrow();
                        isPriceChangeArrowDisplayed = (priceChangeArrow.equals(GREEN) || priceChangeArrow.equals(RED));
                    } catch (StaleElementReferenceException ex) {
                        return false;
                    }
                    return isPriceChangeArrowDisplayed;
                }
            });
        } catch (TimeoutException ex) {
            return;
        }
    }

    public void waitForDefaultMyBetsMessage(final String message) {
        final BetSlipModeComponent betSlipModeComponent = getLiveBettingPage().getBetSlipModeComponent();
        final FluentWait<String> fWait = new FluentWait<String>(message);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<String>() {
                @Override
                public boolean apply(final String message) {
                    boolean isMessageDisplayed = Boolean.FALSE;
                    try {
                        final MyBets myBets = betSlipModeComponent.getMyBets();
                        isMessageDisplayed = myBets.getMessage().equals(message);
                    } catch (StaleElementReferenceException ex) {
                        return false;
                    }
                    return isMessageDisplayed;
                }
            });
        } catch (TimeoutException ex) {
            return;
        }
    }

    public void waitForWebElementToDisplay(final By by) {
        final FluentWait<By> fWait = new FluentWait<By>(by);
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<By>() {
                @Override
                public boolean apply(final By by) {
                    try {
                          final List<WebElement> webElements = webDriver.findElements(by);
                          if(webElements.size() == 0){
                              return false;
                          }
                          return true;
                    } catch (StaleElementReferenceException ex) {
                        return false;
                    }
                   
                }
            });
        } catch (TimeoutException ex) {
            return;
        }
    }

    public boolean waitForPageLoadIconToDisplay() {
        final FluentWait<LiveBettingPage> fWait = new FluentWait<LiveBettingPage>(getLiveBettingPage());
        fWait.pollingEvery(MILLISECONDS_TIMEOUT, TimeUnit.MILLISECONDS).withTimeout(5, TimeUnit.SECONDS);
        try {
            fWait.until(new Predicate<LiveBettingPage>() {
                @Override
                public boolean apply(final LiveBettingPage page) {
                    try {
                        final List<WebElement> loadIcon = webDriver.findElements(loadIconLocator);
                        return loadIcon.size() > 0;
                    } catch (Exception ex) {
                        return false;
                    }

                }
            });
        } catch (TimeoutException ex) {
            return false;
        }
        return true;
    }
}
