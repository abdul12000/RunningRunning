Meta:
@story BGSIR_646
@functionality couponarea
@run false

Narrative:
As a player I want to see loading icon in coupon area 
so that I am aware markets associated with events are not yet rendered
					 
Scenario:  Loading icon is displayed
Meta:
@scenarioName BGSIR_646_DisplayPageLoadIcon
@author Harish
@testType regression

Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName     |HomeTeam NickName    |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>  |<Home Team>_<GameId> |<Description>|
|<GameId1>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId1>|<Home Team>_<GameId1>|<Description>|
And add the markets to the Event:
|MarketName       |MarketTitle|
|Outcome next play|Extra Market 1|
|Outcome next play|Extra Market 2|
|Outcome next play|Extra Market 3|
|Outcome next play|Extra Market 4|
|Outcome next play|Extra Market 5|
|Outcome next play|Extra Market 6|
|Outcome next play|Extra Market 7|
|Outcome next play|Extra Market 8|
|Outcome next play|Extra Market 9|
|Point Spread     |Point Spread1  |
|Total            |Total1        |
|Outcome next play|Extra Market 12|
|Outcome next play|Extra Market 13|
|Outcome next play|Extra Market 14|
|Outcome next play|Extra Market 15|
|Outcome next play|Extra Market 16|
|Outcome next play|Extra Market 17|
|Outcome next play|Extra Market 18|
|Outcome next play|Extra Market 19|
|Outcome next play|Extra Market 20|
And add the markets to the Event:
|GameId   |MarketTitle|
|<GameId1>|Extra Market 1|
|<GameId1>|Extra Market 2|
|<GameId1>|Extra Market 3|
|<GameId1>|Extra Market 4|
|<GameId1>|Extra Market 5|
|<GameId1>|Extra Market 6|
|<GameId1>|Extra Market 7|
|<GameId1>|Extra Market 8|
|<GameId1>|Extra Market 9|
|<GameId1>|Extra Market 10|
|<GameId1>|Extra Market 11|
|<GameId1>|Extra Market 12|
|<GameId1>|Extra Market 13|
|<GameId1>|Extra Market 14|
|<GameId1>|Extra Market 15|
|<GameId1>|Extra Market 16|
|<GameId1>|Extra Market 17|
|<GameId1>|Extra Market 18|
When player navigates to Live betting home page
And select the event <<GameId>>
Then page loading icon should be displayed until markets are rendered
And markets should be displayed in coupon area
When select the event <<GameId1>>
Then page loading icon should be displayed until markets are rendered
And markets should be displayed in coupon area



Examples:
|Meta:|<GameId>   |<GameId1>|<Sport>    |<Home Team>    |<Away Team>    |<League Id>|<Status>    |<Description>      |Message|
|     |64601      |64602    |Football   |Home_story     |Away_story     |5          |In Progress |AUTOTEST-BGSIR-646 |This live event has no lines currently available|
