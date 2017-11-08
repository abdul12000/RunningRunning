package internal.qaauto.inrunning.framework;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.UtilsPXP;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.interfaces.Event;
import internal.qaauto.sportsbook.webservice.eventpubpxp.tom.EventPubPXPManager;

import org.apache.commons.configuration.ConfigurationException;

/**
 * @author rkora on 16/10/2014.
 */
public class ExecutionContext {
    protected EventPubPXPManager manager;
    
    protected List<Event> events;
    
    public ExecutionContext(){
        events = new ArrayList<Event>();
    }

    public EventPubPXPManager getManager() throws ConfigurationException {
        if(manager==null){
            manager=new EventPubPXPManager();
        }
        return manager;
    }
    public void setManager(EventPubPXPManager manager){
        this.manager=manager;
    }
    
    public void setEvent(final Event event){
        events.add(event);
    }
    
    public Event getEventByGameID(final String gameId){
        if(events.size() == 0){
            return null;
        }
        for(Event event : events){
            if(gameId.equals(event.getGameId())){
                return event;
            }
        }
        return null;
    }
    
    public List<Event> getEvents(){
        return events;
    }
    
    public void cleanUp() throws ConfigurationException, IOException{
        if(events.size() != 0){
            for(Event event : events){
                event.setGameStatusToClose();
                getManager().update(UtilsPXP.marshallEventToUpdate(event));
            }
        }
    }
}
