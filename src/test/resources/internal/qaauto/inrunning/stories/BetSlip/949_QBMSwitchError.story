Meta:
@story BGSIR_949
@functionality betslip

Narrative:
As a BA
I want player to have betslip displayed when bets in betslip
so that he doesn't looses out the selections made when not logged in
					 
Scenario:  Betslip displayed when it has bets even after login
Meta:
@scenarioName BGSIR_949_DisplayBetslip_Login
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |AwayTeam NickName   |HomeTeam NickName   |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<Away Team>_<GameId>|<Home Team>_<GameId>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
When a player loggedIn and navigate to above event
Then Betslip mode is activated and Betslip is displayed in the right nav
And <<Selection>> of <<MarketTitle>> should be displayed in the betslip


Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|94901      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-949|Outcome next play   |Extra Market 1    |Pass Completion|
