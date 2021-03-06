Meta:
@author rkora
@story BGSIR_908
@functionality couponarea
@testType regression


Narrative:
As a player
I want bet buttons to display elipsis if selection description is too long to fit
so that I am aware of selection is displayed properly in the bet button

Scenario: verify elipsis has applied for the se

Given user created the event with the  below data
|GameId     |Sport      |MarketNameToCreate  |MarketTitle   |League Id  |Status      |Outcome Description|
|<GameId>   |<Sport>    |<MarketNameToCreate>|<MarketTitle> |<League Id>|<Status>    |<Outcome Description>|
When player navigates to above event
Then bet buttons of the market which has <<MarketTitle>> should display the <<Outcome Description>> with elipses


Examples:
| <GameId> | <Sport>  | <MarketNameToCreate> | <MarketTitle>  | <League Id> | <Status>    | <Outcome Description>                         |
| 90801    | Football | Outcome next play    | EXTRA MARKET 1 | 5           | In Progress | Pass Completion Long Name Test Long Name Test |
