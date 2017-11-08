Meta:
@story BGSIR_562_2
@functionality leftnav

Narrative:
As a player 
I want the information in Live Now to be automatically updated 
so that I am aware of all the updates in Live events
				 
Scenario: Upcoming event created when player is at live betting page appears automatically in left nav
Meta:
@scenarioName BGSIR_562_DisplayUpcomingEvent_Login
@testType regression
@author Harish

Given a player loggedIn and navigate to live betting page
When an upcoming event created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
Then above event should appear in Upcoming events component within 1 minute

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>  |
|     |5621101    |Football   |HomeUp         |AwayUp         |5              |Upcoming   |AUTOTEST-BGSIR-562|


Scenario: Auto update of appropriate messagesB for Upcoming event
Meta:
@scenarioName BGSIR_562_AutoUpdateMessages
@testType regression
@author Harish

Given an upcoming event created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
When player navigate to In-Running page
Then above event should be displayed in Upcoming events component
When add extra markets using below details:
|MarketTitle|
|Extra Market 1|
|Extra Market 2|
Then text 'BET NOW' should be displayed in the event link bottom row replacing Starts in information within 1 minute
When all markets are removed in backend
Then text 'Starts in' should be displayed in the event link bottom row replacing Starts in information within 1 minute
When an event start time is set in the past
Then text 'Starting Now' should be displayed in the event link bottom row replacing Starts in information within 1 minute


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>     |Minutes|
|     |5620601    |Football   |HomeUp         |AwayUp         |5              |Upcoming   |AUTOTEST-BGSIR-562|-10|

Scenario: Auto update of appropriate messagesB for Upcoming event after user logs in
Meta:
@scenarioName BGSIR_562_AutoUpdateMessages_Login
@testType regression
@author Harish

Given an upcoming event created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
When a player loggedIn and navigate to above event
Then above event should be displayed in Upcoming events component
When add extra markets using below details:
|MarketTitle|
|Extra Market 1|
|Extra Market 2|
Then text 'BET NOW' should be displayed in the event link bottom row replacing Starts in information within 1 minute
When all markets are removed in backend
Then text 'Starts in' should be displayed in the event link bottom row replacing Starts in information within 1 minute
When an event start time is set in the past
Then text 'Starting Now' should be displayed in the event link bottom row replacing Starts in information within 1 minute


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>     |Minutes|
|     |5620901    |Football   |HomeUp         |AwayUp         |5              |Upcoming   |AUTOTEST-BGSIR-562|-10|


Scenario: Auto update event status from upcoming to live now
Meta:
@scenarioName BGSIR_562_AutoUpdateEventFromUpcomingToLiveNow
@testType regression
@author Harish

Given an upcoming event created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
When player navigate to In-Running page
Then above event should be displayed in Upcoming events component
When above event status is changed to In Progress
Then above event should disappear from Upcoming Events Component
And should display in Live Now Events Component


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>     |
|     |5620701    |Football   |HomeUp         |AwayUp         |5              |Upcoming   |AUTOTEST-BGSIR-562|

Scenario: Auto update event status from upcoming to live now after login
Meta:
@scenarioName BGSIR_562_AutoUpdateEventFromUpcomingToLiveNow_Login
@testType regression
@author Harish

Given an upcoming event created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
When a player loggedIn and navigate to above event
Then above event should be displayed in Upcoming events component
When above event status is changed to In Progress
Then above event should disappear from Upcoming Events Component
And should display in Live Now Events Component


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>     |
|     |5620801    |Football   |HomeUp         |AwayUp         |5              |Upcoming   |AUTOTEST-BGSIR-562|

