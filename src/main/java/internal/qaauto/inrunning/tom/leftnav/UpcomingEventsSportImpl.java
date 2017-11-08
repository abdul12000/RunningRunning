package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.coupons.LeftNavUpcomingEventImpl;
import org.openqa.selenium.WebElement;

/**
 * Created by Harish Renukunta on 16/10/2014.
 */

public class UpcomingEventsSportImpl extends SportImpl {

    public UpcomingEventsSportImpl(WebElement sportContainerWebElement) {
        setComponent(sportContainerWebElement);
    }

    @Override
    public LeftNavUpcomingEventImpl newLeftNavEvent(final WebElement leftNavEventWebElement) {
        return new LeftNavUpcomingEventImpl(leftNavEventWebElement);
    }
}
