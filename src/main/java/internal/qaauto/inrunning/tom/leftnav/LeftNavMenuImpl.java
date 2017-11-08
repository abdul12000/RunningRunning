package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.betslip.BetSlipModeComponent;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

/**
 * Created by Harish Renukunta on 06/10/2014.
 */
public class LeftNavMenuImpl implements LeftNavMenu {

    private static final String LIVE_NOW_COUPONS_COMPONENT_SELECTOR = "#live-now-events";

    private By liveNowComponentLocator = new By.ByCssSelector(LIVE_NOW_COUPONS_COMPONENT_SELECTOR);

    private static final String UPCOMING_COUPONS_COMPONENT_SELECTOR = "#upcoming-events";

    private By upcomingCouponsComponentLocator = new By.ByCssSelector(UPCOMING_COUPONS_COMPONENT_SELECTOR);

    private WebElement leftNav;

    public LeftNavMenuImpl(final WebElement leftNav) {
        this.leftNav = leftNav;
    }

    @Override
    public WebElement getWebElement() {
        return leftNav;
    }

    @Override
    public LiveNowEventsComponent getLiveNowCouponsComponent() {
        return new LiveNowEventsComponentImpl(leftNav.findElement(liveNowComponentLocator));
    }

    @Override
    public UpcomingEventsComponent getUpcomingCouponsComponent() {
        return new UpcomingEventsComponentImpl(leftNav.findElement(upcomingCouponsComponentLocator));
    }

    @Override
    public BetSlipModeComponent getBetSlipModeComponent() {
        return null;
    }

    @Override
    public WebElement getChildWebElement(By childWebElementByObject) {
        return null;
    }
}
