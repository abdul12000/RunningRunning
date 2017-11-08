Meta:
@story BGSIR_938
@functionality betslip

Narrative:
As a player
I want to see 'Quick Bet Mode' in capitals in message
so that it is consistent with other messages displayed in application in various scenarios 
					 
Scenario:  A scenario is a collection of executable steps of different type
Meta:
@scenarioName BGSIR_938_CapitalizeQBM
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |HomeTeam Nickname   |AwayTeam Nickname   |Status     |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Home Team>_<GameId>|<Away Team>_<GameId>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> is displayed in the betslip
When QBM is activated
Then an error message 'Please place or remove your bets to switch to Quick Bet Mode.' is displayed in betslip

Examples:
|<GameId>   |<Sport>    |<Selection>     |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |
|93801      |Football   |Pass Completion|Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-938|Outcome next play   |Extra Market 1    |