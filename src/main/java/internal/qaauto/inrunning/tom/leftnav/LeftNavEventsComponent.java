package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.InRunningComponentInterface;
import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;

import java.util.List;

/**
 * Created by Harish Renukunta on 16/10/2014.
 */

public interface LeftNavEventsComponent extends InRunningComponentInterface {

    List<Sport> getSportGroups();

    Sport getSportByTitle(final String title);

    List<String> getSportsTitles();

    List<LeftNavEvent> getLeftNavEvents();

    LeftNavEvent getLeftNavEventByTitle(final String title);

    LeftNavEvent getLeftNavEventByName(final String sport, final String eventName);

    String getTitle();

    List<LeftNavEvent> getLeftNavEventsBySport(final String sport);
}
