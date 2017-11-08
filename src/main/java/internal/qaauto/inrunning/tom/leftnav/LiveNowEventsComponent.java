package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavLiveNowEvent;

import java.util.List;

/**
 * Created by Harish Renukunta on 07/10/2014.
 */
public interface LiveNowEventsComponent extends LeftNavEventsComponent {

    public LeftNavEvent getCouponByGameID(final String gameID);

    List<LeftNavLiveNowEvent> getLiveNowEvents();
}
