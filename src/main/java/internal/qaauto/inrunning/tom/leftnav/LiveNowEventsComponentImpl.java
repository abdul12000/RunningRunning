package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavLiveNowEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavLiveNowEventImpl;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * Created by Harish Renukunta on 07/10/2014.
 */
public class LiveNowEventsComponentImpl extends LeftNavEventsComponentImpl implements LiveNowEventsComponent {

    public LiveNowEventsComponentImpl(final WebElement liveNowMenu) {
        setComponent(liveNowMenu);
    }

    @Override
    protected Sport newSport(WebElement sportContainerWE) {
        return new LiveNowEventsSportImpl(sportContainerWE);
    }

    @Override
    public LeftNavEvent newLeftNavEvent(WebElement couponWebElement) {
        return new LeftNavLiveNowEventImpl(couponWebElement);
    }

    @Override
    public LeftNavLiveNowEvent getCouponByGameID(final String gameID) {
        final List<LeftNavEvent> coupons = getLeftNavEvents();
        LeftNavLiveNowEvent liveNowCoupon;
        for (LeftNavEvent coupon : coupons) {
            liveNowCoupon = (LeftNavLiveNowEvent) coupon;
            if (gameID.equals(liveNowCoupon.getGameID())) {
                return liveNowCoupon;
            }
        }
        return null;
    }

    @Override
    public List<LeftNavLiveNowEvent> getLiveNowEvents() {
        List<LeftNavEvent> coupons = getLeftNavEvents();
        if (coupons == null) {
            return null;
        }
        List<LeftNavLiveNowEvent> liveNowCoupons = (List<LeftNavLiveNowEvent>) (List<?>) coupons;
        return liveNowCoupons;
    }

}
