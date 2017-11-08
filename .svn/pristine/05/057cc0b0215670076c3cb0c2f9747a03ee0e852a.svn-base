Meta:
@story BGSIR_973
@functionality leftnav

Narrative:
In order to communicate effectively to the business some functionality
As a development team
I want to use Behaviour-Driven Development
					 
Scenario:  Collapsed sport in live now remains collapsed even after auto update
Meta:
@scenarioName BGSIR_973_CollapseSportAfterAutoUpdate
@author Harish
@testType regression
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
When player navigate to In-Running page
Then above created event should be displayed under sport <<Sport>> in Live Now component
When player collapses <<Sport>> sport in live now component
Then sport <<Sport>> group in live now component should be collapsed and all events under it should be hidden
When player create the event with the  below data
|GameId     |Sport   |Home Team  |Away Team  |League Id   |Status     |AwayTeam NickName  |HomeTeam NickName   |Description  |
|<GameId1>  |<Sport1>|<Home Team>|<Away Team>|<League Id1>|<Status>  |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
Then event <<GameId1>> should appear in Live Now Events component within 1 minute
And sport <<Sport>> should still be collapsed

Examples:
|<GameId>  |<GameId1>|<Sport>    |<Sport1>  |<Home Team>    |<Away Team>    |<League Id>    |<League Id1>|<Status>    |<Description>                          |
|97328     |97329    |Football   |Basketball|Home_Story     |Away_Story     |5              |2           |In Progress |AUTOTEST-BGSIR-973|
|97326     |97327    |Hockey     |Soccer    |Boston Bruins  |Anaheim Ducks  |50             |33          |In Progress |AUTOTEST-BGSIR-973|


Scenario:  Expanded sport in live now remains expanded even after auto update
Meta:
@scenarioName BGSIR_973_ExpandSportAfterAutoUpdate
@author Harish
@testType regression
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
When player navigate to In-Running page
Then above created event should be displayed under sport <<Sport>> in Live Now component
When player expands <<Sport>> sport in live now component
Then sport <<Sport>> group in live now component should be expanded and events should be shown
When player create the event with the  below data
|GameId     |Sport   |Home Team  |Away Team  |League Id   |Status     |AwayTeam NickName  |HomeTeam NickName   |Description  |
|<GameId1>  |<Sport1>|<Home Team>|<Away Team>|<League Id1>|<Status>  |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
Then event <<GameId1>> should appear in Live Now Events component within 1 minute
And sport <<Sport>> should still be expanded

Examples:
|<GameId>  |<GameId1>|<Sport>    |<Sport1>  |<Home Team>    |<Away Team>    |<League Id>|<League Id1>|<Status>    |<Description>     |
|97311     |97312    |Football   |Basketball|Home_Story     |Away_Story     |5          |2           |In Progress |AUTOTEST-BGSIR-973|
|97313     |97314    |Hockey     |Soccer    |Home_Story     |Away_Story     |50         |33          |In Progress |AUTOTEST-BGSIR-973|

