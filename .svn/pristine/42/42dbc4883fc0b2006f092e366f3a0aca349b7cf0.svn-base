Meta:
@story BGSIR_544
@functionality couponarea

Narrative:
As a player 
I want bet button to be highlighted when I added a selection to the bet slip 
so that I know with a simple glance the bets that were added to the betslip
					 
Scenario: Bet Button to be highlighted when selection is added to Betslip
Meta:
@scenarioName BGSIR_544_BetHighlightedWhenAddedToBetSlip
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description  |MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
And selection <<Selection>> of market <<MarketTitle>> should be highlighted

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>         |<League Id>    |<Status>    |<Description>      |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |54404      |Football   |Buffalo Bills  |Arizona Cardinals   |5              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Completion|
|     |54405      |Basketball |Atlanta Hawks  |Denver Nuggets      |2              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Incomplete|


Scenario: Bet Button to be highlighted when selection is added to Betslip and player is logged in
Meta:
@scenarioName BGSIR_544_BetHighlightedWhenAddedToBetSlip_Login
@testType smoke
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description  |MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When a player loggedIn and navigate to above event
And Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
And selection <<Selection>> of market <<MarketTitle>> should be highlighted

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>         |<League Id>    |<Status>    |<Description>      |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |54410      |Football   |Buffalo Bills  |Arizona Cardinals   |5              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Completion|
|     |54411      |Basketball |Atlanta Hawks  |Denver Nuggets      |2              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Incomplete|


Scenario: Bet Button not to be highlighted when selection is removed from Betslip
Meta:
@scenarioName BGSIR_544_BetNotHighlightedWhenRemovedFromBetSlip
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description  |MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
And selection <<Selection>> of market <<MarketTitle>> should be highlighted
When player remove selection '<<Selection>>' from betslip
Then selection '<<Selection>>' of market '<<MarketTitle>>' should not be highlighted

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>         |<League Id>    |<Status>    |<Description>      |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |54420      |Football   |Buffalo Bills  |Arizona Cardinals   |5              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Completion|
|     |54421      |Basketball |Atlanta Hawks  |Denver Nuggets      |2              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Incomplete|


Scenario: Bet Button not to be highlighted when player logs in and selection is removed from Betslip 
Meta:
@scenarioName BGSIR_544_BetNotHighlightedWhenRemovedFromBetSlip_Login
@testType smoke
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description  |MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When a player loggedIn and navigate to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
And selection <<Selection>> of market <<MarketTitle>> should be highlighted
When player remove selection '<<Selection>>' from betslip
Then selection '<<Selection>>' of market '<<MarketTitle>>' should not be highlighted

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>         |<League Id>    |<Status>    |<Description>      |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |54428      |Football   |Buffalo Bills  |Arizona Cardinals   |5              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Completion|
|     |54429      |Basketball |Atlanta Hawks  |Denver Nuggets      |2              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Incomplete|


Scenario: Bet Button highlighting should be maintained when navigating between coupons
Meta:
@scenarioName BGSIR_544_MaintainBetButtonHighlighting
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description  |MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
|<GameId1>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
And selection <<Selection>> of market <<MarketTitle>> should be highlighted
When player navigate to a Single Game View page of a Live Event <<GameId1>>
Then market <<MarketTitle>> should be displayed in coupon area
When player navigate back to event <<GameId>>
Then selection <<Selection>> of <<MarketTitle>> should still be highlighted in the betslip

Examples:
|Meta:|<GameId>   |<GameId1>|<Sport>    |<Home Team>    |<Away Team>         |<League Id>    |<Status>    |<Description>      |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |54430      |54433    |Football   |Buffalo Bills  |Arizona Cardinals   |5              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Completion|
|     |54431      |54432    |Basketball |Atlanta Hawks  |Denver Nuggets      |2              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Incomplete|

Scenario: Bet Button highlighting should be maintained when player logs in and navigating between coupons
Meta:
@scenarioName BGSIR_544_MaintainBetButtonHighlighting_Login
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description  |MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
|<GameId1>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When a player loggedIn and navigate to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
And selection <<Selection>> of market <<MarketTitle>> should be highlighted
When player navigate to a Single Game View page of a Live Event <<GameId1>>
Then market <<MarketTitle>> should be displayed in coupon area
When player navigate back to event <<GameId>>
Then selection <<Selection>> of <<MarketTitle>> should still be highlighted in the betslip

Examples:
|Meta:|<GameId>   |<GameId1>|<Sport>    |<Home Team>    |<Away Team>         |<League Id>    |<Status>    |<Description>      |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |54430      |54433    |Football   |Buffalo Bills  |Arizona Cardinals   |5              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Completion|
|     |54431      |54432    |Basketball |Atlanta Hawks  |Denver Nuggets      |2              |In Progress |AUTOTEST-BGSIR-544 |Outcome next play   |Extra Market 1    |Pass Incomplete|