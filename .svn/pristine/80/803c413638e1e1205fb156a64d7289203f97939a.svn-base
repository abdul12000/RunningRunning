Meta:
@story BGSIR_276_3
@functionality leftnav
@run false

Narrative:
As a player 
I want to know the number of upcoming events when sport group is collapsed in the left nav 
so that I am aware of the number of events that will start shortly

Scenario: Event count is updated in sport when upcoming event is suspended
Meta:
@scenarioName BGSIR276_UpdateEventCountWhenEventSuspended
@author Harish
@testType regression
Given events are created using below data:
|GameId |Sport   |Home Team      |Away Team              |League Id  |Status     |
|27601  |Football  |Buffalo Bills|Arizona Cardinals      |5          |Upcoming   |
|27602  |Soccer    |Algeria      |Anguilla               |33         |Upcoming   |
|27603  |Tennis    |Home_17301   |Away_17301             |325        |Upcoming   |
|27604  |Hockey    |Boston Bruins|Anaheim Ducks          |50         |Upcoming   |
|27605  |Basketball|Atlanta Hawks|Denver Nuggets         |2          |Upcoming   |
And player is at live betting page
And by default all sports in upcoming events component are collapsed
When an another event is created using below data:
|GameId   |Sport   |Home Team    |Away Team              |League Id    |Status       |AwayTeam NickName    |HomeTeam NickName    |
|<GameId> |<Sport> |<Home Team>  |<Away Team>            |<League Id>  |<Status>     |<Away Team>_<GameId> |<Home Team>_<GameId> |
Then event <<GameId>> should be displayed in Upcoming events component
Then page refresh should update event count of sport <<Sport>> in Upcoming events component and increase it by 1
When suspend upcoming event <<GameId>>
Then event <<GameId>> should disappear from Upcoming events component
And page refresh should update event count of sport <Sport> in Upcoming events component and decrease it by 1

Examples:
|<GameId> |<Sport>   |<Home Team>    |<Away Team>            |<League Id>|<Status>   |
|2760101  |Football  |Buffalo Bills  |Arizona Cardinals      |5          |Upcoming   |
|2760201  |Soccer    |Algeria        |Anguilla               |33         |Upcoming   |
|2760301  |Tennis    |Home_17301     |Away_17301             |325        |Upcoming   |
|2760401  |Hockey    |Boston Bruins  |Anaheim Ducks          |50         |Upcoming   |
|2760501  |Basketball|Atlanta Hawks  |Denver Nuggets         |2          |Upcoming   |





