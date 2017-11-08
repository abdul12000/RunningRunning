Meta:
@story BGSIR_682
@functionality leftnav
@run false

Narrative:
As a player 
I want to be redirected to an active live event in case I try to navigate directly to the url of a non existing event 
so that I can place wagers on a live event 
					 
Scenario:  User is redirected to the top Live Now event after trying to navigate to the url of a non existing event
Meta:
@scenarioName BGSIR_682_NavigateToInvalidEventId
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
When player navigate to an invalid event in domain <Domain>
Then player should be redirected to the first live event in api response


Examples:
|Meta:|<GameId>   |<Sport>   |<Home Team>  |<Away Team>         |<League Id> |<Status>    |Domain|<Description>|
|     |6820101    |Football  |Buffalo Bills|Arizona Cardinals   |5           |In Progress |eu    |AUTOTEST_Football_Display|
|     |6820102    |Football  |Buffalo Bills|Arizona Cardinals   |5           |In Progress |lv    |AUTOTEST_Football_Display|

Scenario: User is redirected to the first upcoming event in api response with markets when there are no live events
Meta:
@scenarioName BGSIR_682_NavigateToInvalidEventId_NoLiveEvents
@testType regression
@author Harish
Given change all the Live now events to upcoming if there are any
And an upcoming event created using below data:
|GameId   |Sport   |League Id    |Status  |MarketNameToCreate  |
|<GameId> |<Sport> |<League Id>  |<Status>|<MarketNameToCreate>|
And set above event start time to current time
And suspend the market <<MarketNameToCreate>>
When player navigate to an invalid event in domain <Domain>
Then message should be displayed informing that there are no live events available
And player redirected to first upcoming event in api response

Examples:
|Domain|<GameId> |<Sport>   |<League Id>  |<Status>  |<MarketNameToCreate>|
|eu    |68205    |Football  |5            |Upcoming  |Outcome next play   |
|lv    |68206    |Football  |5            |Upcoming  |Outcome next play   |



