package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.InRunningComponentInterface;
import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavLiveNowEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavUpcomingEvent;

import java.util.List;

/**
 * Created by Harish Renukunta on 07/10/2014.
 */
public interface Sport extends InRunningComponentInterface {

    public String getTitle();

    public List<LeftNavEvent> getEvents();

    LeftNavLiveNowEvent getLiveNowEventByName(final String name);

    LeftNavUpcomingEvent getUpcomingEventByName(final String name);

    LeftNavEvent getLeftNavEventByName(final String eventName);

    List<LeftNavLiveNowEvent> getLiveNowEvents();

    List<LeftNavUpcomingEvent> getUpcomingEvents();

    public void collapse();

    public void expand();

    public boolean isCollapsed();

    int getEventsCountFromHeader();
}
