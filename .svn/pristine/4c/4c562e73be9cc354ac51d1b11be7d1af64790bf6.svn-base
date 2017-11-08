Meta:
@author rkora
@story BGSIR_959
@functionality qbm
@testType regression

Narrative:
As a player
I want QBM button to be disabled when bet is placing
so that I cannot activate the betlsip mode

Scenario: QBM button should be disabled whille placing the bet through QBM
Meta:
@scenarioname singleSelection
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
When a player loggedIn and navigate to above event
And QBM is activated
And player place a <<Selection>> from <<MarketTitle>> to the betslip
Then pending class is applied to the selection <<Selection>> of market <<MarketTitle>> that has been placed
Then QBM should be in disabled state


Examples:
|<GameId>   |<Sport>    |<League Id>    |<Status>    |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|95901      |Football   |5              |In Progress |Outcome next play   |Extra Market 1    |Pass Completion|