package internal.qaauto.inrunning.tom.leftnav;

import internal.qaauto.inrunning.tom.coupons.LeftNavEventImpl;
import internal.qaauto.inrunning.tom.coupons.LeftNavLiveNowEventImpl;
import org.openqa.selenium.WebElement;

/**
 * Created by Harish Renukunta on 16/10/2014.
 */
public class LiveNowEventsSportImpl extends SportImpl {

    public LiveNowEventsSportImpl(final WebElement sportContainerWebElement){
        setComponent(sportContainerWebElement);
    }

    @Override
    public LeftNavEventImpl newLeftNavEvent(final WebElement leftNavEventWebElement) {
        return new LeftNavLiveNowEventImpl(leftNavEventWebElement);
    }


}
