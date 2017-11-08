package internal.qaauto.inrunning.tom.Utilties;

import com.google.common.base.Predicate;
import internal.qaauto.inrunning.tom.leftnav.LeftNavEventsComponent;
import internal.qaauto.inrunning.tom.leftnav.Sport;
import org.openqa.selenium.By;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;

import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Created by Harish Renukunta on 12/11/2014.
 */
public class WaitUtils {

    private static final String NO_EVENTS_MSG = "no-events-msg";

    private final By noEventsMsgLocator = new By.ByClassName(NO_EVENTS_MSG);

    private int maxTimeOut = 10;

    public int getTimeOut() {
        return maxTimeOut;
    }

    public void setTimeOut(final int seconds) {
        maxTimeOut = seconds;
    }

    public void waitForEventsComponentToRender(final LeftNavComponents eventsComponent) {
        final FluentWait<LeftNavComponents> fWait = new FluentWait<LeftNavComponents>(eventsComponent);
        fWait.pollingEvery(500, TimeUnit.MILLISECONDS).withTimeout(maxTimeOut, TimeUnit.SECONDS);
        fWait.until(new Predicate<LeftNavComponents>() {
            @Override
            public boolean apply(final LeftNavComponents eventsComponent) {
                try {
                    final LeftNavEventsComponent navEventsComponent =
                            LiveBettingPageFactory.getLiveBettingPageImpl().getLeftNavEventsComponent(eventsComponent);
                    final List<Sport> sports = navEventsComponent.getSportGroups();
                    if (sports == null) {
                        final List<WebElement> noEventsMessage = navEventsComponent.getWebElement().findElements(
                                noEventsMsgLocator);
                        if (noEventsMessage != null && !noEventsMessage.isEmpty()) {
                            return noEventsMessage.get(0).isDisplayed();
                        } else {
                            return false;
                        }
                    }
                    for (final Sport sport : sports) {
                        if (!sport.getWebElement().isDisplayed()) {
                            if (eventsComponent.equals(LeftNavComponents.UPCOMING_EVENTS_COMPONENT) && !sport.isCollapsed()) {
                                return false;
                            }
                            return false;
                        }
                    }
                } catch (final StaleElementReferenceException | NullPointerException ex) {
                    return false;
                }
                return true;

            }
        });

    }

}
