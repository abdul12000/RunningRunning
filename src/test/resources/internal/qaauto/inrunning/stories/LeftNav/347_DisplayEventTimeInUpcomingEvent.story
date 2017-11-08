Meta:
@story BGSIR_347
@functionality leftnav

Narrative:
As a player
I want event link in the upcoming event component will include information
so that I have the required information about upcoming events

Scenario: Event start time to be displayed in 12h clock and time until event starts in hours and minutes(Starts in HHh:MMm)
Meta:
@scenarioName BGSIR_347_UpcomingEvent_12hClock
@author Harish
@testType regression

Given an upcoming event created using below data:
|GameId   |Sport   |Home Team    |Away Team              |League Id    |Status       |AwayTeam NickName    |HomeTeam NickName    |Description|
|<GameId> |<Sport> |<Home Team>  |<Away Team>            |<League Id>  |<Status>     |<Away Team>_<GameId> |<Home Team>_<GameId> |<Description>|
When player navigate to any In-Running page
Then above created upcoming event displays time in 12h clock and time to start in hours and minutes(Starts in HHh MMm)


Examples:
|<GameId> |<Sport>   |<Home Team>  |<Away Team>            |<League Id>  |<Status>  |<Description>            |
|34701    |Football  |Buffalo Bills|Arizona Cardinals      |5            |Upcoming  |AUTOTEST_Football_Display|
|34702    |Soccer    |Algeria      |Anguilla               |33           |Upcoming  |AUTOTEST_SortSportsGroups|
|34703    |Tennis    |Home_17301   |Away_17301             |325          |Upcoming  |AUTOTEST_BGSIR347_Tennis|
|34704    |Hockey    |Boston Bruins|Anaheim Ducks          |50           |Upcoming  |AUTOTEST_BGSIR347_Hocker|
|34705    |Basketball|Atlanta Hawks|Denver Nuggets         |2            |Upcoming  |AUTOTEST_BGSIR347_Basketball|

