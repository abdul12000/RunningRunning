package internal.qaauto.inrunning.framework;

import internal.qaauto.framework.ConfigManager;
import internal.qaauto.framework.testCase.webTestsCase.BaseTestCase;
import internal.qaauto.inrunning.tom.EventBuilder;
import internal.qaauto.inrunning.tom.LiveBettingPage;
import internal.qaauto.inrunning.tom.Utils;
import internal.qaauto.inrunning.tom.Utilties.LeftNavComponents;
import internal.qaauto.inrunning.tom.Utilties.LiveBettingPageFactory;
import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.leftnav.LeftNavEventsComponent;
import internal.qaauto.inrunning.tom.leftnav.Sport;
import internal.qaauto.inrunning.tom.markets.Market;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.interfaces.Event;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.interfaces.Line;
import internal.qaauto.sportsbook.webservice.eventpubpxp.tom.EventPubPXPManager;

import org.apache.commons.configuration.ConfigurationException;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * @author rkora on 16/10/2014.
 */
public class InRunningBaseStep extends BaseTestCase {

    private static final String COUPON_AREA_SELECTOR = "div#coupon";
    
    public String getAtmosphereUpdate(){
        String atmosphereUpdate = null;
        try {
            atmosphereUpdate = ConfigManager.getConfig().getString("atmospher.update");
        } catch (ConfigurationException e) {
               reporter.info(e.getMessage());
        }
        return atmosphereUpdate;
    }

    public void sleep(final int milliseconds){
        try {
            Thread.sleep(milliseconds);
        } catch (InterruptedException e) {
           reporter.info(e.getMessage());
        }
    }
    
    public Event getEvent() {
        return getScenarioContext().getEvent();
    }

    public Event getEventByGameId(final String gameId) {
        final List<Event> events = getScenarioContext().getEvents();
        Event matchingEvent = null;
        for (final Event event : events) {
            if (gameId.equals(event.getGameId())) {
                matchingEvent = event;
                break;
            }
        }
        return matchingEvent;
    }

    public ScenarioContext getScenarioContext() {
        return InRunningTestCase.getScenarioContext();
    }

    public ExecutionContext getExecutionContext() {
        return InRunningTestCase.getExecutionContext();
    }

    public EventPubPXPManager getManager() throws ConfigurationException {
        return InRunningTestCase.getExecutionContext().getManager();
    }

    public void closeObsoleteEvents() throws IOException, ConfigurationException {
        getScenarioContext().cleanUpEvents();
    }

    public LiveBettingPage getLiveBettingPage() {
        return LiveBettingPageFactory.getLiveBettingPageImpl();
    }

    public List<Line> getLinesFromEvent() {
        final Event event = getEvent();
        if (event.getLines() == null) {
            return null;
        }
        return event.getLines();
    }

    public List<String> getLineDescriptionsFromEvent() {
        final List<Line> lines = getLinesFromEvent();
        if (lines == null) {
            return null;
        }
        final List<String> lineDescriptions = new LinkedList<String>();
        for (final Line line : lines) {
            lineDescriptions.add(line.getDisplayText());
        }
        return lineDescriptions;
    }

    public Line getLineByDescription(final String lineDisplayText) {
        final List<Line> lines = getLinesFromEvent();
        if (lines == null) {
            return null;
        }

        for (final Line line : lines) {
            if (lineDisplayText.equals(line.getDisplayText())) {
                return line;
            }
        }
        return null;

    }

    public LeftNavEvent getLatestLiveNowEvent() {
        final Event event = getEvent();
        final Utils utils = new Utils();
        final String eventName = utils.getEventName(event);
        final LeftNavEventsComponent eventsComponent = getLeftNavEventsComponent(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT);
        final LeftNavEvent liveNowEvent = eventsComponent.getLeftNavEventByName(event.getSport(), eventName);
        return liveNowEvent;
    }

    public Market getMarketByTitle(final String marketTitle) {
        return getLiveBettingPage().getMarketByTitle(marketTitle);
    }

    public LeftNavEventsComponent getLeftNavEventsComponent(final LeftNavComponents component) {
        return getLiveBettingPage().getLeftNavEventsComponent(component);
    }

    public WebElement getCouponArea() {
        final By couponAreaLocator = new By.ByCssSelector(COUPON_AREA_SELECTOR);
        return getLiveBettingPage().getChildWebElement(couponAreaLocator);
    }

    public String getEventsComponentText(final LeftNavComponents navEventsComponent) {
        final String eventsComponentText;
        if (navEventsComponent.equals(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT)) {
            eventsComponentText = "Live Now Events Component";
        } else {
            eventsComponentText = "Upcoming Events Component";
        }
        return eventsComponentText;
    }

    public LeftNavEvent getLeftNavEventByName(final LeftNavComponents navEventsComponent, final String sport,
            final String eventName) {
        final LeftNavEventsComponent eventsComponent = getLeftNavEventsComponent(navEventsComponent);
        final LeftNavEvent leftNavEvent = eventsComponent.getLeftNavEventByName(sport, eventName);
        return leftNavEvent;
    }

    public List<LeftNavEvent> getLeftNavEvents(final LeftNavComponents navEventsComponent) {
        final LeftNavEventsComponent eventsComponent = getLeftNavEventsComponent(navEventsComponent);
        return eventsComponent.getLeftNavEvents();
    }

    public List<Sport> getSportsFromEventsComponent(final LeftNavComponents navEventsComponent) {
        final LeftNavEventsComponent eventsComponent = getLeftNavEventsComponent(navEventsComponent);
        if (eventsComponent == null) {
            return null;
        }
        return eventsComponent.getSportGroups();
    }
    
    public boolean checkIfEventAlreadyCreated(final Map<String, String> eventParams){
        return(getExecutionContext().getEventByGameID(eventParams.get(EventBuilder.GAME_ID))!= null);
    }

}
