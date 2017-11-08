package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.betslip.BetSlipModeComponent;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

/**
 * Created by Harish Renukunta on 06/10/2014.
 */
public interface LeftNavMenu {

    public WebElement getWebElement();

    public LiveNowEventsComponent getLiveNowCouponsComponent();

    public UpcomingEventsComponent getUpcomingCouponsComponent();

    public BetSlipModeComponent getBetSlipModeComponent();

    public WebElement getChildWebElement(By childWebElementByObject);

}
