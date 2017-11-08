package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.coupons.LeftNavUpcomingEvent;

/**
 * Created by Harish Renukunta on 07/10/2014.
 */
public interface UpcomingEventsComponent extends LeftNavEventsComponent {

    public LeftNavUpcomingEvent getUpcomingEventByTitle(final String title);

}
