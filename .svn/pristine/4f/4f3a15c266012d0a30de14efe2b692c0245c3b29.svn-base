package internal.qaauto.inrunning.tom.leftnav;

import com.google.common.base.Function;
import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.FluentWait;

import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Created by Harish Renukunta on 16/10/2014.
 */
public abstract class LeftNavEventsComponentImpl extends LeftNavMenuComponentImpl implements LeftNavEventsComponent {

    private static final String H1_TAG = "h1";

    private static final String TITLE_SELECTOR = H1_TAG;

    private By titleLocator = new By.ByCssSelector(TITLE_SELECTOR);

    //private static final String SPORT_CONTAINER_SELECTOR = ":scope>ul>li";
    private static final String SPORT_CONTAINER_SELECTOR = "ul/li";

    private By sportContainerLocator = new By.ByXPath(SPORT_CONTAINER_SELECTOR);

    @Override
    public List<Sport> getSportGroups() {
        final WebElement component = getWebElement();
        final List<WebElement> sportsContainersWebElements = component.findElements(sportContainerLocator);
        if (sportsContainersWebElements == null || sportsContainersWebElements.size() == 0) {
            return null;
        }

        final List<Sport> sportsContainers = new LinkedList<Sport>();
        for (WebElement sportContainerWE : sportsContainersWebElements) {
            sportsContainers.add(newSport(sportContainerWE));
        }
        return sportsContainers;
    }

    @Override
    public Sport getSportByTitle(final String title) {
        List<Sport> sportContainers = getSportGroups();
        if (sportContainers == null) {
            return null;
        }
        for (Sport sportContainer : sportContainers) {
            if (sportContainer.getTitle().contains(title)) {
                return sportContainer;
            }
        }
        return null;
    }

    @Override
    public List<String> getSportsTitles() {
        List<Sport> sportsContainers = getSportGroups();
        if (sportsContainers == null) {
            return null;
        }
        List<String> sportsContainersTitles = new LinkedList<String>();
        for (Sport sportContainer : sportsContainers) {
            sportsContainersTitles.add(sportContainer.getTitle());
        }
        return sportsContainersTitles;
    }

    protected abstract Sport newSport(WebElement sportContainerWE);

    @Override
    public String getTitle() {
        final WebElement couponComponent = getWebElement();
        final WebElement titleWebElement = couponComponent.findElement(titleLocator);
        if (titleWebElement == null) {
            return null;
        }
        return titleWebElement.getText();
    }

    @Override
    public List<LeftNavEvent> getLeftNavEvents() {
        final FluentWait<LeftNavEventsComponent> fWait = new FluentWait<LeftNavEventsComponent>(this);
        fWait.pollingEvery(500, TimeUnit.MILLISECONDS)
                .withTimeout(5, TimeUnit.SECONDS);
        List<LeftNavEvent> leftNavEvents;
        try {
            leftNavEvents = fWait.until(new Function<LeftNavEventsComponent, List<LeftNavEvent>>() {
                @Override
                public List<LeftNavEvent> apply(LeftNavEventsComponent leftNavEventsComponent) {
                    final List<Sport> sports = getSportGroups();
                    if (sports == null) {
                        return null;
                    }
                    final List<LeftNavEvent> leftNavEvents = new LinkedList<LeftNavEvent>();
                    for (Sport sport : sports) {
                        leftNavEvents.addAll(sport.getEvents());
                    }
                    return leftNavEvents;
                }

            });
        } catch (Exception ex) {
            leftNavEvents = null;
        }
        return leftNavEvents;

    }

    public abstract LeftNavEvent newLeftNavEvent(final WebElement couponWebElement);

    @Override
    public LeftNavEvent getLeftNavEventByTitle(final String title) {
        List<LeftNavEvent> leftNavEvents = getLeftNavEvents();
        for (LeftNavEvent leftNavEvent : leftNavEvents) {
            if (title.equals(leftNavEvent.getName())) {
                return leftNavEvent;
            }
        }
        return null;
    }

    @Override
    public List<LeftNavEvent> getLeftNavEventsBySport(String sport) {
        final Sport sportContainer = getSportByTitle(sport);
        if (sportContainer == null) {
            return null;
        }
        return (sportContainer.getEvents());
    }

    @Override
    public LeftNavEvent getLeftNavEventByName(final String sport, final String eventName) {
        final FluentWait<LeftNavEventsComponent> fwait = new FluentWait<LeftNavEventsComponent>(this);
        fwait.pollingEvery(500, TimeUnit.MILLISECONDS);
        fwait.withTimeout(10, TimeUnit.SECONDS);
        LeftNavEvent navEvent = null;
        try {
            navEvent = fwait.until(new Function<LeftNavEventsComponent, LeftNavEvent>() {
                @Override
                public LeftNavEvent apply(LeftNavEventsComponent eventsComponent) {
                    final Sport sportContainer = getSportByTitle(sport);
                    if (sportContainer == null) {
                        return null;
                    }
                    final LeftNavEvent leftNavEvent = sportContainer.getLeftNavEventByName(eventName);
                    if (leftNavEvent == null) {
                        return null;
                    }
                    return leftNavEvent;

                }

            });
        } catch (Exception ex) {
            return null;
        }
        return navEvent;
    }
}
