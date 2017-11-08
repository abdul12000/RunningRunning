package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavUpcomingEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavUpcomingEventImpl;
import org.openqa.selenium.WebElement;

/**
 * Created by Harish Renukunta on 07/10/2014.
 */
public class UpcomingEventsComponentImpl extends LeftNavEventsComponentImpl implements UpcomingEventsComponent {

    public UpcomingEventsComponentImpl(final WebElement leftNavUpcomingMenu) {
        setComponent(leftNavUpcomingMenu);
    }

    @Override
    protected Sport newSport(final WebElement sportContainerWE) {
        return new UpcomingEventsSportImpl(sportContainerWE);
    }

    @Override
    public LeftNavUpcomingEventImpl newLeftNavEvent(final WebElement leftNavEventWebElement) {
        return new LeftNavUpcomingEventImpl(leftNavEventWebElement);
    }

    @Override
    public LeftNavUpcomingEvent getUpcomingEventByTitle(String title) {
        final LeftNavEvent coupon = getLeftNavEventByTitle(title);
        if (coupon == null) {
            return null;
        }
        return getUpcomingEvent(getLeftNavEventByTitle(title));

    }

    private LeftNavUpcomingEvent getUpcomingEvent(final LeftNavEvent leftNavEvent) {
        return ((LeftNavUpcomingEvent) leftNavEvent);
    }

}
