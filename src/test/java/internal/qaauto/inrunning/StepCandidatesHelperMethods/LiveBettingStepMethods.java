package internal.qaauto.inrunning.StepCandidatesHelperMethods;

import internal.qaauto.framework.Assert;
import internal.qaauto.inrunning.framework.InRunningBaseStep;
import internal.qaauto.inrunning.tom.EventComponentInterface;
import internal.qaauto.inrunning.tom.Utilties.LeftNavComponents;
import internal.qaauto.inrunning.tom.betslip.BetSlip;
import internal.qaauto.inrunning.tom.betslip.BetSlipModeComponent;
import internal.qaauto.inrunning.tom.leftnav.LiveNowEventsComponent;
import internal.qaauto.inrunning.tom.leftnav.UpcomingEventsComponent;
import internal.qaauto.inrunning.tom.markets.Market;
import internal.qaauto.inrunning.utils.InRunningComponents;
import org.openqa.selenium.WebElement;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Harish Renukunta on 17/10/2014.
 */
public class LiveBettingStepMethods extends InRunningBaseStep {

    private static final String COMPONENT_DISPLAYED = "%s displayed";

    private static final String COMPONENT_NOT_DISPLAYED = "%s not displayed";

    private EventStepsHelperMethods eventStepsHelperMethods = HelperFactory.getEventStepsHelper();

    private List<String> getMarketsList() {
        final List<Market> markets = getLiveBettingPage().getMarkets();
        final List<String> marketsTitles = new LinkedList<>();
        for (Market market : markets) {
            marketsTitles.add(market.getMarketTitle());
        }
        return marketsTitles;
    }

    public void verifyBetSlipComponent() {
        final String component = InRunningComponents.BETSLIP_COMPONENT.getLabel();
        final BetSlip betSlip = getLiveBettingPage().getBetSlip();
        final WebElement betSlipWebElement = betSlip.getWebElement();
        Assert.assertTrue(betSlipWebElement.isDisplayed(), String.format(COMPONENT_DISPLAYED, component),
                String.format(COMPONENT_NOT_DISPLAYED, component));
    }

    public void verifyLiveNowComponent() {
        final String component = LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT.getLabel();
        final LiveNowEventsComponent liveNowCouponsComponent = getLiveBettingPage().getLiveNowCouponsComponent();
        final WebElement liveNowCouponsComponentWebElement = liveNowCouponsComponent.getWebElement();
        Assert.assertTrue(liveNowCouponsComponentWebElement.isDisplayed(), String.format(COMPONENT_DISPLAYED, component),
                String.format(COMPONENT_NOT_DISPLAYED, component));
    }

    public void verifyUpcomingCouponsComponent() {
        final String component = LeftNavComponents.UPCOMING_EVENTS_COMPONENT.getLabel();
        final UpcomingEventsComponent upcomingCouponsComponent = getLiveBettingPage().getUpcomingEventsComponent();
        final WebElement upcomingCouponsComponentWebElement = upcomingCouponsComponent.getWebElement();
        Assert.assertTrue(upcomingCouponsComponentWebElement.isDisplayed(), String.format(COMPONENT_DISPLAYED, component),
                String.format(COMPONENT_NOT_DISPLAYED, component));
    }

    public void verifyBetSlipModeComponent() {
        final String component = LeftNavComponents.BETSLIP_MODE_COMPONENT.getLabel();
        final BetSlipModeComponent betSlipModeComponent = getLiveBettingPage().getBetSlipModeComponent();
        final WebElement betSlipModeComponentWebElement = betSlipModeComponent.getWebElement();
        Assert.assertTrue(betSlipModeComponentWebElement.isDisplayed(), String.format(COMPONENT_DISPLAYED, component),
                String.format(COMPONENT_NOT_DISPLAYED, component));
    }

    public void verifyCouponComponent() {
        final String component = InRunningComponents.COUPON_AREA_COMPONENT.getLabel();
        final EventComponentInterface couponsComponent = getLiveBettingPage().getEventsComponent();
        Assert.assertNotNull(couponsComponent, String.format(COMPONENT_DISPLAYED, component),
                String.format(COMPONENT_NOT_DISPLAYED, component));
    }

    public boolean verifyMarketTitles() {
        final List<String> Lines = eventStepsHelperMethods.getMarketsTitleFromEvent(getEvent());
        final List<String> marketsTitlesText = getMarketsList();
        boolean marketNotFound = Boolean.FALSE;
        for (String line : Lines) {
            if (!marketsTitlesText.contains(line.toUpperCase())) {
                reporter.info(line + " :market is not displayed");
                marketNotFound = Boolean.TRUE;
                break;
            }
        }
        return marketNotFound;
    }

}
