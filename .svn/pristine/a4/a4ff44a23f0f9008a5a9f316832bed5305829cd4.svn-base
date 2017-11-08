Meta:
@story BGSIR_118
@functionality qbm

Narrative:
As a player 
I want QBM toggle to be disabled when there are wagers in the Bet slip 
so that I will not be able to change the betting mode
					 
Scenario: QBM is disabled when there are wagers in the Bet slip
Meta:
@scenarioName BGSIR_118_QBMDisabledWhenWagersExist
@author Harish
@testType regression

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
When QBM is activated
Then QBM should be in disabled state
And Betslip should still be displayed


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |11801      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-118|Outcome next play   |Extra Market 1    |Pass Completion|

Scenario: QBM should get enabled when after removing bet selections from betslip
Meta:
@scenarioName BGSIR_118_QBMEnabledWhenAfterRemovingBetSelections
@author Harish
@testType regression

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
When QBM is activated
Then QBM should still be in disabled state
And Betslip should still be displayed
When player removes all bet selections
Then QBM should get enabled


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |11801      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-118|Outcome next play   |Extra Market 1    |Pass Incomplete|

Scenario: QBM should be in enabled status by default
Meta:
@scenarioName BGSIR_118_QBMByDefaultEnabled
@author Harish
@testType regression

Given a new browser is opened
And user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
Then QBM should be enabled by default


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |11801      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-118|Outcome next play   |Extra Market 1    |Pass Completion|

