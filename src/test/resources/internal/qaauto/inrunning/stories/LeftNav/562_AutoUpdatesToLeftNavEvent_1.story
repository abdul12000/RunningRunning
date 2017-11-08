Meta:
@story BGSIR_562_1
@functionality leftnav

Narrative:
As a player 
I want the information in Live Now to be automatically updated 
so that I am aware of all the updates in Live events
				 
Scenario: Live now event should be automatically displayed
Meta:
@scenarioName BGSIR_562_AutoDisplayLiveNowEvent
@testType regression
@author Harish

Given player is at live betting page
Then Live Now component is displayed
And Live Coupon page is displayed
When player create the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
Then event <<GameId>> should appear in Live Now Events component within 1 minute
When player create another event with below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName    |HomeTeam NickName    |Description  |
|<GameId1>  |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId1>|<Home Team>_<GameId1>|<Description>|
And add extra markets using below details:
|MarketTitle|
|Extra Market 1|
|Extra Market 2|
Then event <<GameId1>> should appear in Live Now Events component within 1 minute

Examples:
|Meta:|<GameId>   |<GameId1>|<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<Description>    |
|     |5620101    |56201    |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AUTOTEST_BGSIR562|

Scenario: Live now event should be automatically displayed in livebetting page when player logged in
Meta:
@scenarioName BGSIR_562_AutoDisplayLiveNowEvent_Login
@testType regression
@author Harish

Given a player loggedIn and navigate to live betting page
Then Live Now component is displayed
And Live Coupon page is displayed
When player create the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
Then event <<GameId>> should appear in Live Now Events component within 1 minute
When player create another event with below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName    |HomeTeam NickName    |Description  |
|<GameId1>  |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId1>|<Home Team>_<GameId1>|<Description>|
And add extra markets using below details:
|MarketTitle|
|Extra Market 1|
|Extra Market 2|
Then event <<GameId1>> should appear in Live Now Events component within 1 minute

Examples:
|Meta:|<GameId>   |<GameId1>|<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<Description>    |
|     |5620201    |5620202  |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AUTOTEST_BGSIR562|

Scenario: Event status should reflect automatically when its status changed from 'In Progress' to 'Pregame'
Meta:
@scenarioName BGSIR_562_AutoUpdateEventStatusFromLiveNowToUpcoming
@testType regression
@author Harish

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
And add the markets to the Event:
|MarketTitle|
|Extra Market 1|
|Extra Market 2|
When player navigate to a Single Game View page of a Live Event <<GameId>>
Then the list of markets of the selected event are displayed in the coupon area
When above event status is changed to Pregame
Then above event should disappear from Live Now Events Component
And should display in Upcoming Events Component


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>  |
|     |5620301    |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-562|

Scenario: Event status should reflect automatically when its status changed from 'In Progress' to 'Pregame' after user login
Meta:
@scenarioName BGSIR_562_AutoUpdateEventStatusFromLiveNowToUpcoming_UserLoggedIn
@testType regression
@author Harish

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
And add the markets to the Event:
|MarketTitle|
|Extra Market 1|
|Extra Market 2|
When a player loggedIn and navigate to above event
Then the list of markets of the selected event are displayed in the coupon area
When above event status is changed to Pregame
Then above event should disappear from Live Now Events Component
And should display in Upcoming Events Component


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>  |
|     |5620401    |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-562|


Scenario: Upcoming event created when at live betting page appears automatically in left nav
Meta:
@scenarioName BGSIR_562_DisplayUpcomingEvent
@testType regression
@author Harish

Given player is at live betting page
When an upcoming event created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
Then above event should appear in Upcoming events component within 1 minute

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>  |
|     |5620501    |Football   |HomeUp         |AwayUp         |5              |Upcoming   |AUTOTEST-BGSIR-562|
