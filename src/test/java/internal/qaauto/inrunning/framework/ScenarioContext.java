package internal.qaauto.inrunning.framework;

import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.UtilsPXP;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.interfaces.Event;
import internal.qaauto.sportsbook.webservice.eventpubpxp.tom.EventPubPXPManager;
import org.apache.commons.configuration.ConfigurationException;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author rkora on 16/10/2014.
 */
public class ScenarioContext {

    protected List<Event> eventList;

    private Map<String, String> tempStorage = new HashMap<String, String>();

    public Event getEvent() {
        if (eventList == null || eventList.size() == 0) {
            return null;
        }
        return eventList.get(0);
    }

    public void setEvent(Event event) {
        if (eventList == null) {
            initializeEventsList();
        }
        eventList.add(event);
    }

    public List<Event> getEvents() {
        if (eventList == null || eventList.size() == 0) {
            return null;
        }
        return eventList;
    }

    private void initializeEventsList() {
        eventList = new ArrayList<Event>();
    }

    public void cleanUpEvents() throws IOException, ConfigurationException {
        if (eventList != null && eventList.size() != 0) {
            closeAllEvents();
            initializeEventsList();
        }
    }

    private void closeAllEvents() throws ConfigurationException, IOException {
        for (Event event : eventList) {
            event.setGameStatusToClose();
            getManager().update(UtilsPXP.marshallEventToUpdate(event));
        }

    }

    private EventPubPXPManager getManager() throws ConfigurationException {
        return InRunningTestCase.getExecutionContext().getManager();
    }

    public Map<String, String> getTempStorage() {
        return tempStorage;
    }

}
