Meta:
@story BGSIR_688
@functionality betslip

Narrative:
As a player 
I want to see the error message in the betslip when I am logged out and try to place a bet 
so that I know why a wager has not been placed 
					 
Scenario:  Not logged in user error message is displayed
Meta:
@scenarioName BGSIR_688_DisplayError_NotloggedIn_PlaceBet
@author Harish
@testType regression
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |AwaTeam NickName    |HomeTeam NickName   |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<Home Team>_<GameId>|<Away Team>_<GameId>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
When player introduce the <risk> amount to the <<Selection>>
And clicks on place bet
Then a error message 'You must be logged in to place a bet.' to be displayed


Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |risk|<Selection>    |
|68801      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-688|Outcome next play   |Extra Market 1    |3   |Pass Completion|
