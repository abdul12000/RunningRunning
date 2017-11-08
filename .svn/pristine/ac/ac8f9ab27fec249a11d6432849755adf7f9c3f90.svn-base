package internal.qaauto.inrunning.StepCandidatesHelperMethods;

import internal.qaauto.framework.Assert;
import internal.qaauto.inrunning.framework.InRunningBaseStep;
import internal.qaauto.inrunning.tom.EventBuilder;
import internal.qaauto.inrunning.tom.EventStatus;
import internal.qaauto.inrunning.tom.Utils;
import internal.qaauto.inrunning.tom.Utilties.LeftNavComponents;
import internal.qaauto.inrunning.tom.coupons.LeftNavEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavLiveNowEvent;
import internal.qaauto.inrunning.tom.coupons.LeftNavUpcomingEvent;
import internal.qaauto.inrunning.tom.leftnav.LeftNavEventsComponent;
import internal.qaauto.inrunning.tom.leftnav.LiveNowEventsComponent;
import internal.qaauto.inrunning.tom.leftnav.Sport;
import internal.qaauto.inrunning.tom.leftnav.UpcomingEventsComponent;
import internal.qaauto.inrunning.utils.WaitUtils;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.UtilsPXP;
import internal.qaauto.sportsbook.webservice.eventpubpxp.entities.interfaces.Event;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.lang.StringUtils;
import org.jbehave.core.model.ExamplesTable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;

/**
 * Created by Harish Renukunta on 22/10/2014.
 */
public class LeftNavEventStepsHelperMethods extends InRunningBaseStep {

    private static final String EVENT_FOUND = "Event with title %s found in %s component";

    private static final String EVENT_NOT_FOUND = "Event with title %s not found in %s component";

    private static final String SPORT_GROUP_COLLAPSED = "Sport group %s in %s collapsed";

    private static final String SPORT_GROUP_EXPANDED = "Sport group %s in %s expanded";

    private static final String ALL_SPORTS_EXPANDED = "All sports are expanded";

    private static final String ALL_SPORTS_NOT_EXPANDED = "Some or all sports are not expanded:%s";

    private static final String SPORT_GROUP_FOUND = "Sport %s found in %s";

    private static final String SPORT_GROUP_NOT_FOUND = "Sport %s not found in %s";

    private static final String EVENTS_RETRIEVED_PASS = "Events successfully retrieved";

    private static final String EVENTS_RETRIEVAL_FAIL = "Failed to retrieve events from api call";

    private static final String NO_UPCOMING_EVENTS_MSG = "Apologies, no upcoming events available. Please check back later";

    private static final String NO_LIVE_NOW_EVENTS_MSG = "Unfortunately, no live events available. Please check back later";
                                                          

    private static final String NO_EVENTS_MESSAGE_FOUND = "No Events message found";

    private static final String NO_EVENTS_MESSAGE_NOT_FOUND = "No Events message not found";

    private static final String NO_EVENTS_MESSAGE_DISPLAYS = "Message '%s' seen";

    private static final String NO_EVENTS_MESSAGE_NO_DISPLAY = "Message not displayed. Expected:'%s' , Shown:'%s'";

    private static final String EVENTS_RESOURCE_URI = "/live/api/event/events/under/P/next";

    private static final String EVENT_COUNT_DISPLAYED = "Event count displayed";

    private static final String EVENT_COUNT_NOT_DISPLAYED = "Event count not displayed";

    private static final String EVENT_COUNT_MATCH = "Event count match. Event count %s";

    private static final String EVENT_COUNT_MISMATCH = "Event count match. Header:%s Actual count:%s";

    private static final String EVENT_COUNT_UPDATED = "Event count updated. Inital : %s Updated:%s";

    private static final String EVENT_COUNT_NOT_UPDATED = "Event count not updated. Initial:%s Updated:%s";

    private static final String ELLIPSIS_CSS_PROPERTY = "text-overflow";

    private static final String ELLIPSIS_PROPERTY_VALUE = "ellipsis";

    private static final String ELLIPSIS_DISPLAYED = "CSS will render ellipsis when text overflows for team %s";

    private static final String ELLIPSIS_NOT_DISPLAYED = "Ellipsis will not be rendered when text overflows for team %s";

    private static final String TEAM_SELECTOR = "span";

    private static final String SPORT_GROUP_CORRECT_POSITION = "Sports Group %s seen and in correct position";

    private static final String SPORT_GROUP_INCORRECT_POSITION = "%s not in correct position";

    private static final String SPORT_HEADER_LABEL = "Sport";

    private static final String AWAY_TEAM_NICK_NAME = "AwayTeam NickName";

    private static final String HOME_TEAM_NICK_NAME = "HomeTeam NickName";

    private static final String ALL_EVENTS_FOUND_IN_COMPONENT = "All events found in events component";

    private static final String EVENTS_NOT_IN_COMPONENT = "Events not found in events component : %s";

    private static final String[] UPCOMING_EVENT_CODE = { "U" };

    private static final String[] LIVE_NOW_EVENT_CODE = { "O", "H", "C" };

    private static final String SPORTS_NO_EVENT_COUNT = "Sports %s have no event count displayed in %s";

    private static final String ALL_SPORTS_DISPLAY_EVENT_COUNT = "Event count displayed for all sports in %s";

    private static final String NUMBER_OF_MARKETS = "Number of Markets";

    private static final String MESSAGE_DISPLAYED_IN_EVENT_LINK = "'%s' text is displayed in the Event Link(%s) bottom row";

    private static final String MESSAGE_NOT_DISPLAYED_IN_EVENT_LINK =
            "'%s' text is not displayed in the Event Link(%s) bottom row";

    private static int NO_EVENTS_MSG_WAIT_TIME = 25;
    
    final EventStepsHelperMethods eventStepsHelper = HelperFactory.getEventStepsHelper();

    private UpcomingEventsComponent getUpcomingEventsComponent() {
        return getLiveBettingPage().getUpcomingEventsComponent();
    }

    private LiveNowEventsComponent getLiveNowCouponsComponent() {
        return getLiveBettingPage().getLiveNowCouponsComponent();
    }

    public LeftNavLiveNowEvent getLeftNavLiveNowEventByGameID(final String gameID) {
        LiveNowEventsComponent liveNowCouponsComponent = getLiveNowCouponsComponent();
        LeftNavLiveNowEvent liveNowCoupon = (LeftNavLiveNowEvent) liveNowCouponsComponent.getCouponByGameID(gameID);
        return liveNowCoupon;
    }

    public LeftNavUpcomingEvent getLeftNavUpcomingEventByTitle(final String title) {
        UpcomingEventsComponent upcomingCouponsComponent = getUpcomingEventsComponent();
        return upcomingCouponsComponent.getUpcomingEventByTitle(title);
    }

    private Sport getSportByTitle(final String sport) {
        final LeftNavEventsComponent eventsComponent = getLiveBettingPage().getUpcomingEventsComponent();
        return eventsComponent.getSportByTitle(sport);
    }

    public LeftNavEvent verifyLeftNavEventExist(final LeftNavComponents navEventComponent, final String sport,
          final String eventName){
        final WaitUtils waitUtils = new WaitUtils();
        waitUtils.setTimeOut(getAtmosphereUpdate());
        final LeftNavEvent leftNavEvent = waitUtils.waitForLeftNavEventToDisplay(navEventComponent, sport, eventName);
        final String eventsComponentText = getEventsComponentText(navEventComponent);
        Assert.assertNotNull(leftNavEvent, String.format(EVENT_FOUND, eventName, eventsComponentText),
                String.format(EVENT_NOT_FOUND, eventName, eventsComponentText));
        return leftNavEvent;
    }
    
    public LeftNavEvent verifyLeftNavEventExistUsingPageRefresh(final LeftNavComponents navEventsComponent, final String sport, final String eventName){
        LeftNavEvent leftNavEvent = null;
        for(int iterations = 0; iterations < 3; iterations++){
            leftNavEvent = getLeftNavEventByName(navEventsComponent, sport, eventName);
            if(leftNavEvent == null){
                sleep(5000);
            }else{
                break;
            }
        }
        final String eventsComponentText = getEventsComponentText(navEventsComponent);
        Assert.assertTrue(leftNavEvent != null, String.format(EVENT_NOT_FOUND, eventName, eventsComponentText),
                String.format(EVENT_FOUND, eventName, eventsComponentText));
        return leftNavEvent;
    }

    public LeftNavEvent verifyLeftNavEventExist(final LeftNavComponents navEventComponent, final Event event){
        final String sport = event.getSport();
        final Utils utils = new Utils();
        final String eventName = utils.getEventName(event);
        return verifyLeftNavEventExist(navEventComponent, sport, eventName);
    }
    
    public void verifyLeftNavEventExistUsingPageRefresh(final LeftNavComponents navEventComponent, final Event event){
        final String sport = event.getSport();
        final Utils utils = new Utils();
        final String eventName = utils.getEventName(event);
        verifyLeftNavEventExistUsingPageRefresh(navEventComponent, sport, eventName);
    }

    public void verifyLeftNavEventNotExist(final LeftNavComponents navEventComponent, final String sport,
            final String eventName) {
        final WaitUtils waitUtils = new WaitUtils();
        waitUtils.setTimeOut(60);
        waitUtils.waitForLeftNavEventToDisappear(navEventComponent, sport, eventName);
        final String eventsComponentText = getEventsComponentText(navEventComponent);
        final LeftNavEvent leftNavEvent = getLeftNavEventByName(navEventComponent, sport, eventName);
        Assert.assertTrue(leftNavEvent == null, String.format(EVENT_NOT_FOUND, eventName, eventsComponentText),
                String.format(EVENT_FOUND, eventName, eventsComponentText));

    }

    public void verifyLeftNavEventNotExist(final LeftNavComponents navEventComponent, final Event event) {
        final String sport = event.getSport();
        final Utils utils = new Utils();
        final String eventName = utils.getEventName(event);
        verifyLeftNavEventNotExist(navEventComponent, sport, eventName);
    }

    public boolean isSportGroupCollapsed(final Sport sportGroup) {
        return sportGroup.isCollapsed();
    }

    public void verifyAllSportsAreExpanded(final LeftNavComponents navEventsComponent) {
        List<Sport> sports = getSportsFromEventsComponent(navEventsComponent);
        String collapsedSports = StringUtils.EMPTY;
        for (Sport sport : sports) {
            if (sport.isCollapsed()) {
                collapsedSports += sport.getTitle();
            }
        }
        Assert.assertTrue(StringUtils.isEmpty(collapsedSports), ALL_SPORTS_EXPANDED,
                String.format(ALL_SPORTS_NOT_EXPANDED, collapsedSports));
    }

    public void verifyEventCountNotDisplayedForAllSports(final LeftNavComponents navEventsComponent) {
        List<Sport> sports = getSportsFromEventsComponent(navEventsComponent);
        String sportsWithEventCount = StringUtils.EMPTY;
        for (Sport sport : sports) {
            if (sport.getEventsCountFromHeader() != -1) {
                sportsWithEventCount += sport.getTitle();
            }
        }
        Assert.assertTrue(StringUtils.isEmpty(sportsWithEventCount), "Event count not displayed for all sports",
                String.format("Event count displayed for sports:%s", sportsWithEventCount));
    }

    public void verifySportGroupInLiveNowCollapsed(final String sport) {
        final Sport sportContainer = verifySportGroupExist(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT, sport);
        final String menuComponent = LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT.getLabel();
        Assert.assertTrue(isSportGroupCollapsed(sportContainer), String.format(SPORT_GROUP_COLLAPSED, sport, menuComponent),
                String.format(SPORT_GROUP_EXPANDED, sport, menuComponent));
    }

    public void verifySportGroupExist(final LeftNavComponents navEventsComponent, final Sport sportContainer,
            final String sport) {
        final String eventsComponentLabel = navEventsComponent.getLabel();
        Assert.assertNotNull(sportContainer, String.format(SPORT_GROUP_FOUND, sport, eventsComponentLabel),
                String.format(SPORT_GROUP_NOT_FOUND, sport, eventsComponentLabel));
    }
    
    public Sport verifySportGroupExist(final LeftNavComponents navEventsComponent,final String sport){
        final WaitUtils waitUtils = new WaitUtils();
        waitUtils.setTimeOut(getAtmosphereUpdate());
        Sport sportContainer = waitUtils.waitForSportToDisplay(navEventsComponent, sport);
        verifySportGroupExist(navEventsComponent, sportContainer, sport);
        return sportContainer;
    }

    public void verifySportGroupInLiveNowExpanded(final String sport) {
        final Sport sportContainer = verifySportGroupExist(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT, sport);
        final String menuComponent = LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT.getLabel();
        Assert.assertTrue(!isSportGroupCollapsed(sportContainer), String.format(SPORT_GROUP_EXPANDED, sport, menuComponent),
                String.format(SPORT_GROUP_COLLAPSED, sport, menuComponent));
    }

    public void collapseSportGroupInUpcomingEventsComponent(final String sport) {
        final Sport sportGroup = verifySportGroupExist(LeftNavComponents.UPCOMING_EVENTS_COMPONENT, sport);
        sportGroup.collapse();
    }

    public void expandSport(final LeftNavComponents navEventComponent, final String sport) {
        Sport sportGroup = verifySportGroupExist(navEventComponent, sport);
        sportGroup.expand();
    }
    
    
    public void verifySportIsCollapsed(final LeftNavComponents navEventsComponent, final String sport) {
        final Sport sportGroup = verifySportGroupExist(navEventsComponent, sport);
        final String eventsComponentLabel = navEventsComponent.getLabel();
        Assert.assertTrue(sportGroup.isCollapsed(), String.format(SPORT_GROUP_COLLAPSED, sport, eventsComponentLabel),
                String.format(SPORT_GROUP_EXPANDED, sport, eventsComponentLabel));
    }
    
    

    public void verifySportIsExpanded(final LeftNavComponents navEventsComponent, final String sport) {
        final Sport sportGroup = verifySportGroupExist(navEventsComponent, sport);
        final String eventsComponentLabel = navEventsComponent.getLabel();
        Assert.assertTrue(!sportGroup.isCollapsed(), String.format(SPORT_GROUP_EXPANDED, sport, eventsComponentLabel),
                String.format(SPORT_GROUP_COLLAPSED, sport, eventsComponentLabel));
    }

    public void verifySportGroupsInUpcomingEventsComponentOtherThanSpecifiedAreCollapsed(final String sport) {
        final LeftNavEventsComponent eventsComponent = getLiveBettingPage().getUpcomingEventsComponent();
        final List<Sport> sportGroups = eventsComponent.getSportGroups();
        for (Sport sportGroup : sportGroups) {
            if (!sportGroup.getTitle().equals(sport)) {
                verifySportIsCollapsed(LeftNavComponents.UPCOMING_EVENTS_COMPONENT, sportGroup.getTitle());
            }
        }
    }

    public void updateAPIEventsStatus(final LeftNavComponents navEventsComponent, final EventStatus statusToChange)
            throws JSONException, IOException,
            ConfigurationException {
        final String apiResponse = getEventsInfoFromAPI();
        System.out.println("Entity:" + apiResponse);
        final JSONObject eventsJSONObject = new JSONObject(apiResponse);
        final List<Map<String, String>> apiEvents;
        if (navEventsComponent.equals(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT)) {
            apiEvents = getParamsOfEventWithStatus(LIVE_NOW_EVENT_CODE, eventsJSONObject);
        } else {
            apiEvents = getParamsOfEventWithStatus(UPCOMING_EVENT_CODE, eventsJSONObject);
        }
        for (final Map<String, String> apiEvent : apiEvents) {
            apiEvent.put(EventBuilder.STATUS, statusToChange.getStatus());
            final Event event = EventBuilder.buildEvent(apiEvent);
            getManager().update(UtilsPXP.marshallEventToUpdate(event));
        }
    }

    public List<Event> getEventsWithStatusFromAPI(final String[] eventStatuses) throws JSONException, ParseException {
        final String apiResponse = getEventsInfoFromAPI();
        System.out.println("Entity:" + apiResponse);
        final JSONObject eventsJSONObject = new JSONObject(apiResponse);
        final List<Map<String, String>> eventsParams = getParamsOfEventWithStatus(eventStatuses, eventsJSONObject);
        final List<Event> events = new LinkedList<Event>();
        for (final Map<String, String> eventParam : eventsParams) {
            final Event event = eventStepsHelper.createEvent(eventParam);
            events.add(event);
        }
        return events;
    }

    public String getEventsInfoFromAPI() {
        final Client client = ClientBuilder.newClient();
        final String apiURL = getLiveBettingPage().getPageURL() + EVENTS_RESOURCE_URI;
        reporter.info("API URL:" + apiURL);
        final Multimap<String, String> urlParameters = ArrayListMultimap.create();
        urlParameters.put("status", "U");
        urlParameters.put("status", "H");
        urlParameters.put("status", "O");
        urlParameters.put("status", "C");
        urlParameters.put("maxHours", "24");
        final WebTarget baseTarget = client.target(UriBuilder.fromPath(apiURL).build());
        final WebTarget eventTarget = client.target(baseTarget.getUriBuilder().buildFromMap(urlParameters.asMap()));
        final Invocation.Builder invocationBuilder = eventTarget.request();
        invocationBuilder.accept(MediaType.APPLICATION_JSON_TYPE);
        Response response = invocationBuilder.get();
        Assert.assertTrue(response.getStatus() == 200, EVENTS_RETRIEVED_PASS, EVENTS_RETRIEVAL_FAIL);
        return (response.readEntity(String.class));
    }

    public List<Map<String, String>> getParamsOfEventWithStatus(final String[] eventStatuses, final JSONObject eventsJSONObject)
            throws JSONException {
        final List<Map<String, String>> eventsWithStatus = new LinkedList<Map<String, String>>();
        final JSONArray eventsArray = eventsJSONObject.getJSONArray("items");
        for (int i = 0; i < eventsArray.length(); i++) {
            final JSONObject eventObject = eventsArray.getJSONObject(i);
            if (isOfMatchingCode(eventStatuses, eventObject.get("status").toString())) {
                final Map<String, String> eventParams = getEventParamsFromJSON(eventObject);
                eventsWithStatus.add(eventParams);
            }
        }
        return eventsWithStatus;
    }

    private boolean isOfMatchingCode(final String[] eventStatuses, final String eventCode) {
        boolean eventCodeFound = false;
        for (String eventStatus : eventStatuses) {
            if (eventStatus.equals(eventCode)) {
                eventCodeFound = true;
                break;
            }
        }
        return eventCodeFound;
    }

    private Map<String, String> getEventParamsFromJSON(final JSONObject eventObject) throws JSONException {
        final Map<String, String> eventParams = new HashMap<String, String>();
        eventParams.put(EventBuilder.GAME_ID, eventObject.get("id").toString());
        eventParams.put(EventBuilder.SPORT, getSportName(eventObject.get("sport").toString()));
        eventParams.put(EventBuilder.LEAGUE_NAME, eventObject.get("type").toString());
        eventParams.put(HOME_TEAM_NICK_NAME, getTeamNameFromJSON(eventObject, "HOME"));
        eventParams.put(AWAY_TEAM_NICK_NAME, getTeamNameFromJSON(eventObject, "AWAY"));
        eventParams.put(EventBuilder.DISPLAY_AWAY_TEAM_FIRST, getEventFlagsFromJSON(eventObject, "awayTeamFirst"));
        eventParams.put(NUMBER_OF_MARKETS, eventObject.get("numMarkets").toString());
        return eventParams;
    }

    private String getEventFlagsFromJSON(final JSONObject eventObject, final String flagName) throws JSONException {
        final JSONArray flags = eventObject.getJSONArray("flags");
        String flagValue = StringUtils.EMPTY;
        for (int k = 0; k < flags.length(); k++) {
            final JSONObject flagElements = flags.getJSONObject(k);
            if (flagName.equals(flagElements.get("name"))) {
                flagValue = flagElements.getString("value");
                break;
            }
        }
        return flagValue;
    }

    private String getTeamNameFromJSON(final JSONObject eventObject, final String team) throws JSONException {
        final JSONArray competitors = eventObject.getJSONArray("competitors");
        String teamShortName = StringUtils.EMPTY;
        for (int i = 0; i < competitors.length(); i++) {
            final JSONObject competitor = (JSONObject) competitors.get(i);
            final JSONArray competitorFlags = competitor.getJSONArray("flags");
            for (int k = 0; k < competitorFlags.length(); k++) {
                JSONObject competitorFlagsElement = competitorFlags.getJSONObject(k);
                if (competitor.get("type").equals(team)) {
                    if (competitorFlagsElement.get("name").equals("shortName")) {
                        teamShortName = competitorFlagsElement.get("value").toString();
                        break;
                    }
                }

            }

        }
        return teamShortName;
    }

    private String getSportName(final String sportCode) {
        final String[] code = { "BASK", "SOCC", "HCKY", "FOOT", "TENN", "BASE" };
        final String[] sportName = { "Basketball", "Soccer", "Hockey", "Football", "Tennis", "Baseball" };
        final Map<String, String> sportMap = new HashMap<String, String>();
        for (int index = 0; index < code.length; index++) {
            sportMap.put(code[index], sportName[index]);
        }
        return sportMap.get(sportCode);
    }

    public Map<String, List<String>> getEventNamesGroupedBySport(final LeftNavComponents eventsComponent) {
        final LeftNavEventsComponent navEventsComponent = getLeftNavEventsComponent(eventsComponent);
        List<Sport> sports = navEventsComponent.getSportGroups();
        if (sports == null) {
            return null;
        }
        final Map<String, List<String>> eventsGroupedBySport = new HashMap<String, List<String>>();
        for (final Sport sport : sports) {
            sport.expand();
            final List<LeftNavEvent> leftNavEvents = sport.getEvents();
            if (leftNavEvents != null) {
                eventsGroupedBySport.put(sport.getTitle(), getEventNames(leftNavEvents));
            }
        }
        return eventsGroupedBySport;

    }

    public List<String> getEventNames(final List<LeftNavEvent> leftNavEvents) {
        final List<String> eventNames = new LinkedList<String>();
        for (final LeftNavEvent leftNavEvent : leftNavEvents) {
            eventNames.add(leftNavEvent.getName());
        }
        return eventNames;
    }

    public void verifyNoEventsMessageInEventsComponent(final LeftNavComponents component) {
        final WaitUtils waitUtils = new WaitUtils();
        waitUtils.setTimeOut(NO_EVENTS_MSG_WAIT_TIME);
        waitUtils.waitForNoEventsMsgToDisplayInEventsComponent(component);
        final LeftNavEventsComponent eventsComponent = getLeftNavEventsComponent(component);
        final WebElement errorMsgWebElement = (eventsComponent.getWebElement().findElement(By.tagName("p")));
        Assert.assertNotNull(errorMsgWebElement, NO_EVENTS_MESSAGE_FOUND, NO_EVENTS_MESSAGE_NOT_FOUND);
        if (component.equals(LeftNavComponents.UPCOMING_EVENTS_COMPONENT)) {
            verifyNoEventsAvailableInUpcomingComponent(errorMsgWebElement);
        } else if (component.equals(LeftNavComponents.LIVE_NOW_EVENTS_COMPONENT)) {
            verifyNoEventsAvailableInLiveNowComponent(errorMsgWebElement);
        }

    }

    private void verifyNoEventsAvailableInUpcomingComponent(final WebElement errorMsgWebElement) {
        final String actualErrorText = errorMsgWebElement.getText();
        Assert.assertEquals(actualErrorText, NO_UPCOMING_EVENTS_MSG,
                String.format(NO_EVENTS_MESSAGE_DISPLAYS, actualErrorText),
                String.format(NO_EVENTS_MESSAGE_NO_DISPLAY, NO_UPCOMING_EVENTS_MSG, actualErrorText));

    }

    private void verifyNoEventsAvailableInLiveNowComponent(final WebElement errorMsgWebElement) {
        final String actualErrorText = errorMsgWebElement.getText();
        Assert.assertEquals(actualErrorText, NO_LIVE_NOW_EVENTS_MSG,
                String.format(NO_EVENTS_MESSAGE_DISPLAYS, actualErrorText),
                String.format(NO_EVENTS_MESSAGE_NO_DISPLAY, NO_LIVE_NOW_EVENTS_MSG, actualErrorText));

    }

    public void verifySportsGroup(final LeftNavComponents eventsComponent, final Sport sportContainer, final String sport) {
        Assert.assertNotNull(sportContainer, String.format(SPORT_GROUP_FOUND, sport, eventsComponent.getLabel()),
                String.format(SPORT_GROUP_NOT_FOUND, sport, eventsComponent.getLabel()));
    }

    public void collapseSport(final LeftNavComponents eventsComponent, final String sport) {
        final Sport sportContainer = (new WaitUtils()).waitForSportToDisplay(eventsComponent, sport);
        verifySportsGroup(eventsComponent, sportContainer, sport);
        sportContainer.collapse();
    }

    public void verifyEventsCountInSportHeader(final String sport, final LeftNavComponents eventsComponent) {
        final LeftNavEventsComponent navEventsComponent = getLeftNavEventsComponent(eventsComponent);
        final Sport sportContainer = navEventsComponent.getSportByTitle(sport);
        final int eventCountInHeader = sportContainer.getEventsCountFromHeader();
        getScenarioContext().getTempStorage().put("initialEventCount", String.valueOf(eventCountInHeader));

        Assert.assertTrue(eventCountInHeader != -1, EVENT_COUNT_DISPLAYED, EVENT_COUNT_NOT_DISPLAYED);
        sportContainer.expand();
        final List<LeftNavEvent> events = sportContainer.getEvents();
        final int actualEventCount = events.size();
        Assert.assertEquals(eventCountInHeader, actualEventCount, String.format(EVENT_COUNT_MATCH, eventCountInHeader),
                String.format(EVENT_COUNT_MISMATCH, eventCountInHeader, actualEventCount));

    }

    public void verifyTeamNamesTruncated(final LeftNavComponents navEventsComponent) {
        final LeftNavEvent leftNavEvent = verifyLeftNavEventExist(navEventsComponent, getEvent());
        final By teamSelector = new By.ByCssSelector(TEAM_SELECTOR);
        final List<WebElement> teams = leftNavEvent.getWebElement().findElements(teamSelector);
        for (final WebElement team : teams) {
            Assert.assertTrue(team.getCssValue(ELLIPSIS_CSS_PROPERTY).equals(ELLIPSIS_PROPERTY_VALUE),
                    String.format(ELLIPSIS_DISPLAYED, team.getText()), String.format(ELLIPSIS_NOT_DISPLAYED, team.getText()));
        }

    }

    public void verifySportsSortOrder(final LeftNavComponents eventsComponent, final ExamplesTable dataTableSportsGroups) {
        final LeftNavEventsComponent navEventsComponent = getLeftNavEventsComponent(eventsComponent);
        final List<String> sportsContainersTitles = navEventsComponent.getSportsTitles();
        final Utils utils = new Utils();
        final List<String> expectedSportsGroups =
                utils.getColumnValuesFromExampleTable(dataTableSportsGroups, SPORT_HEADER_LABEL);
        final List<String> toBeVerifiedSportsGroupsList = new LinkedList<String>();
        for (String sportContainerTitle : sportsContainersTitles) {
            if (expectedSportsGroups.contains(sportContainerTitle)) {
                toBeVerifiedSportsGroupsList.add(sportContainerTitle);
            }
        }
        for (int index = 0; index < expectedSportsGroups.size(); index++) {
            Assert.assertEquals(expectedSportsGroups.get(index), toBeVerifiedSportsGroupsList.get(index),
                    String.format(SPORT_GROUP_CORRECT_POSITION, toBeVerifiedSportsGroupsList.get(index)),
                    String.format(SPORT_GROUP_INCORRECT_POSITION, toBeVerifiedSportsGroupsList.get(index)));
        }

    }

    public String getEventsNotInEventsComponent(final List<Event> events,
            final Map<String, List<String>> leftNavEventsGroupedBySport) {
        String eventsNotInEventsComponent = StringUtils.EMPTY;
        final Utils utils = new Utils();
        for (final Event event : events) {
            final String eventName = utils.getEventName(event);
            final String sport = event.getSport();
            final List<String> leftNavEventNames = leftNavEventsGroupedBySport.get(sport);
            if (!leftNavEventNames.contains(eventName)) {
                eventsNotInEventsComponent = eventsNotInEventsComponent + "," + sport + ":" + eventName;
            }
        }
        return eventsNotInEventsComponent;
    }

    public void verifyAllAPIEventsAppearInLeftNav(final List<Event> events,
            final Map<String, List<String>> leftNavEventsGroupedBySport) {
        final String eventsNotInEventsComponent = getEventsNotInEventsComponent(events, leftNavEventsGroupedBySport);
        Assert.assertTrue(StringUtils.isEmpty(eventsNotInEventsComponent), ALL_EVENTS_FOUND_IN_COMPONENT,
                String.format(EVENTS_NOT_IN_COMPONENT, eventsNotInEventsComponent));
    }

    public void verifyLeftNavEventsWithEventsInAPIResponse(final LeftNavComponents navEventsComponents) throws JSONException,
            ParseException {
        final String[] eventCode;
        if (LeftNavComponents.UPCOMING_EVENTS_COMPONENT.equals(navEventsComponents)) {
            eventCode = UPCOMING_EVENT_CODE;
        } else {
            eventCode = LIVE_NOW_EVENT_CODE;
        }
        final List<Event> upcomingEvents = getEventsWithStatusFromAPI(eventCode);
        final Map<String, List<String>> leftNavEventsBySport = getEventNamesGroupedBySport(navEventsComponents);
        verifyAllAPIEventsAppearInLeftNav(upcomingEvents, leftNavEventsBySport);

    }

    public void verifyTextDisplayed(final LeftNavComponents navEventsComponent, final Event event, String message){
        final LeftNavEvent leftNavEvent = verifyLeftNavEventExist(navEventsComponent, event);
        final String messageRegex = "[01]?[0-9]:[0-5][0-9][pa] " + message;
        final Pattern messagePattern = Pattern.compile(messageRegex);
        final String eventTimeDesc = leftNavEvent.getTime();
        final Matcher messageMatcher = messagePattern.matcher(eventTimeDesc);
        boolean messageDisplayed = Boolean.FALSE;
        if (messageMatcher.find()) {
            messageDisplayed = Boolean.TRUE;
        }
        Assert.assertTrue(messageDisplayed,
                String.format(MESSAGE_DISPLAYED_IN_EVENT_LINK, message, eventTimeDesc),
                String.format(MESSAGE_NOT_DISPLAYED_IN_EVENT_LINK, message, eventTimeDesc));
    }

    public void verifyAllSportsInEventsComponentHaveEventCount(final LeftNavComponents navEventsComponent) {
        final LeftNavEventsComponent eventsComponent = getLiveBettingPage().getLeftNavEventsComponent(navEventsComponent);
        final List<Sport> sports = eventsComponent.getSportGroups();
        String noEventCountSports = StringUtils.EMPTY;
        for (final Sport sport : sports) {
            if (sport.getEventsCountFromHeader() == -1) {
                noEventCountSports += sport.getTitle();
            }
        }
        final String eventComponentLabel = navEventsComponent.getLabel();
        Assert.assertTrue(StringUtils.isEmpty(noEventCountSports),
                String.format(ALL_SPORTS_DISPLAY_EVENT_COUNT, eventComponentLabel),
                String.format(SPORTS_NO_EVENT_COUNT, noEventCountSports, eventComponentLabel));

    }

    public void verifyEventsCountNotDisplayed(final LeftNavComponents navEventsComponent, final String sportTitle) {
        final Sport sport = getLiveBettingPage().getLeftNavEventsComponent(navEventsComponent).getSportByTitle(sportTitle);
        verifySportGroupExist(navEventsComponent, sport, sportTitle);
        Assert.assertTrue(sport.getEventsCountFromHeader() == -1, EVENT_COUNT_NOT_DISPLAYED, EVENT_COUNT_DISPLAYED);
    }

    public void verifyUpdatedEventCount(final LeftNavComponents navEventsComponent, final String sportTitle,
            final int differenceCount) {
        final int updatedEventCount = getEventCountFromSport(navEventsComponent, sportTitle);
        final int initialEventCount = Integer.parseInt(getScenarioContext().getTempStorage().get("initialEventCount"));
        final boolean outcome;
        if(differenceCount > 0){
            outcome = updatedEventCount > initialEventCount;
        }else{
            outcome = updatedEventCount < initialEventCount;
        }
        Assert.assertTrue(outcome,
                String.format(EVENT_COUNT_UPDATED, initialEventCount, updatedEventCount),
                String.format(EVENT_COUNT_NOT_UPDATED, initialEventCount, updatedEventCount));
    }

    public int getEventCountFromSport(LeftNavComponents navEventsComponent, final String sportTitle) {
        final WaitUtils waitUtils = new WaitUtils();
        waitUtils.setTimeOut(getAtmosphereUpdate());
        final Sport sport = waitUtils.waitForSportToDisplay(navEventsComponent, sportTitle);
        if(sport == null){
            return 0;
        }
        sport.collapse();
        return sport.getEventsCountFromHeader();
    }

    public void selectLeftNavEvent(final LeftNavComponents navEventsComponent, final Event event){
        final LeftNavEvent leftNavEvent = verifyLeftNavEventExist(navEventsComponent, event);
        leftNavEvent.select();
    }

    public boolean isTopEventInLeftNavHighlighted(LeftNavComponents eventComponent) {
        LeftNavEventsComponent eventsComponent = getLeftNavEventsComponent(eventComponent);
        List<Sport> sports = eventsComponent.getSportGroups();
        Sport requiredSport = sports.get(0);
        LeftNavEvent leftNavEvent = requiredSport.getEvents().get(0);
        return leftNavEvent.isHighlighted();
    }

    public String getFirstUpcomingEventGameIdWhichHasMarkets() throws JSONException {
        final String apiResponse = getEventsInfoFromAPI();
        System.out.println("Entity:" + apiResponse);
        final JSONObject eventsJSONObject = new JSONObject(apiResponse);
        final List<Map<String, String>> upcomingEvents = getParamsOfEventWithStatus(UPCOMING_EVENT_CODE, eventsJSONObject);
        for (final Map<String, String> upcomingEvent : upcomingEvents) {
            final int noOfMarkets = Integer.parseInt(upcomingEvent.get(NUMBER_OF_MARKETS));
            if (noOfMarkets != 0) {
                return upcomingEvent.get(EventBuilder.GAME_ID);
            }
        }
        return StringUtils.EMPTY;
    }

    public void verifyHomePageRedirectedTopLiveEvent() throws JSONException, ParseException {
        final List<Event> liveNowEvents = getEventsWithStatusFromAPI(LIVE_NOW_EVENT_CODE);
        if (liveNowEvents.size() == 0) {
            Assert.fail("No live events retrieved found in api response");
        }
        final String gameIdOfFirstLiveEvent = liveNowEvents.get(0).getGameId();
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        final String currentUrl = getLiveBettingPage().getCurrentURL();
        Assert.assertTrue(currentUrl.endsWith(gameIdOfFirstLiveEvent), String.format("Navigated to event by id %s",
                gameIdOfFirstLiveEvent), String.format(
                "Navigated to incorrect event. Expected : %s but navigated to event with url :%s", gameIdOfFirstLiveEvent,
                currentUrl));
    }

    public void verifyUpcomingEventTimeShouldNotHaveZero(final Event event){
        LeftNavEvent leftNavEvent = verifyLeftNavEventExist(LeftNavComponents.UPCOMING_EVENTS_COMPONENT, event);
        final String eventTime = leftNavEvent.getTime();
        Assert.assertTrue(!eventTime.startsWith("0"),
                String.format("0 not displayed in upcoming event time. Event Time:%s", eventTime),
                String.format("Event time displays 0. Event Time:%s", eventTime));

    }

    public void closeEventsInEventsComponent(final LeftNavComponents navEventsComponent)
            throws JSONException, IOException, ConfigurationException {
        final LeftNavEventsComponent eventsComponent =
                getLeftNavEventsComponent(navEventsComponent);
        final List<Sport> sportGroups = eventsComponent.getSportGroups();
        if (sportGroups != null && sportGroups.size() > 0) {
            updateAPIEventsStatus(navEventsComponent, EventStatus.CLOSED);
            getLiveBettingPage().go();
        }

    }
}
