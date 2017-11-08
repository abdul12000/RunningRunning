Meta:
@author rkora
@story BGSIR_967
@functionality betslip
@testType regression


Narrative:
As a player
I want bet buttons to display elipsis if selection description is too long to fit
so that I am aware of selection is displayed properly in the bet button

Scenario: verify elipsis has applied for the selection in the betslip
Meta:
@scenarioname displayElipsesForSelection
Given user created the event with the  below data
|GameId     |Sport      |MarketNameToCreate  |MarketTitle   |League Id  |Status      |Outcome Description|
|<GameId>   |<Sport>    |<MarketNameToCreate>|<MarketTitle> |<League Id>|<Status>    |<Outcome Description>|
When player navigates to above event
And add below selections to the betslip from the markets listed below:
| Selection             | MarketTitle   |
| <Outcome Description> | <MarketTitle> |
Then elipses should be displayed for the selection <Outcome Description>

Examples:
| <GameId> | <Sport>  |  <MarketNameToCreate> | <MarketTitle>  |  <League Id> | <Status>    | <Outcome Description>                         |
| 96701    | Football |  Outcome next play    | EXTRA MARKET 1 |  5           | In Progress | Pass Completion Long Name Test Long Name Test |
