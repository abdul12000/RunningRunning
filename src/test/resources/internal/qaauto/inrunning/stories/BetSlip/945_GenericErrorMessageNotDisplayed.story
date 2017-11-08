Meta:
@story BGSIR_945
@functionality betslip

Narrative:
As a player
I want error message to be displayed when selection in betslip is either suspended or closed
so that player is clear that Betslip has errors in it

					 
Scenario:  Generic error message to display when selection of betslip is either suspended
Meta:
@scenarioName BGSIR_945_GenericErrorMessage_SuspendSelection
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |AwaTeam NickName    |HomeTeam NickName   |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<Away Team>_<GameId>|<Home Team>_<GameId>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
When suspend outcome <<Selection>> in backend
Then a error message 'Bet Slip contains errors.' to be displayed

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|94501      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-945|Outcome next play   |Extra Market 1    |Pass Completion|

Scenario:  Generic error message to display when selection of betslip is either suspended
Meta:
@scenarioName BGSIR_945_GenericErrorMessage_closeMarket
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |AwaTeam NickName    |HomeTeam NickName   |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<Away Team>_<GameId>|<Home Team>_<GameId>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
When market '<<MarketTitle>>' is closed
Then a error message 'Bet Slip contains errors.' to be displayed

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|94501      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-945|Outcome next play   |Extra Market 1    |Pass Completion|