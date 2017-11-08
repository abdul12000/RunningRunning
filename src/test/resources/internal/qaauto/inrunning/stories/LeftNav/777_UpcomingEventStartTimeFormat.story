Meta:
@story BGSIR_777
@functionality leftnav

Narrative:
As a player wants to see start time of upcoming event trimmed of zero if its hour less than 10
					 
Scenario:  Upcoming event start time trimmed of 0 if its hour less than 10
Meta:
@scenarioName BGSIR_777_UpcomingEventStartTimeHrsLessThan10
@testType regression
@author Harish
Given an upcoming event created using below details with current time as start time
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
When player navigate to In-Running page
Then above event should be displayed in Upcoming events component
When change above events start time hour less than 10
Then upcoming event start time should not display 0


Examples:
|<GameId> |<Sport>   |<Home Team>  |<Away Team>            |<League Id>  |<Status>  |<Description>            |
|77701    |Football  |Buffalo Bills|Arizona Cardinals      |5            |Upcoming  |AUTOTEST_Football_Display|
|77702    |Soccer    |Algeria      |Anguilla               |33           |Upcoming  |AUTOTEST_SortSportsGroups|
|77703    |Tennis    |Home_17301   |Away_17301             |325          |Upcoming  |AUTOTEST_BGSIR_Tennis|
|77704    |Hockey    |Boston Bruins|Anaheim Ducks          |50           |Upcoming  |AUTOTEST_BGSIR_Hocker|
|77705    |Basketball|Atlanta Hawks|Denver Nuggets         |2            |Upcoming  |AUTOTEST_BGSIR_Basketball|