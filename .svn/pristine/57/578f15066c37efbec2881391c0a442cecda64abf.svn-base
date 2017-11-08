Meta:
@author rkora
@story BGSIR_637
@functionality betslip
@testType regression

Narrative:
As a player
I want Bet slip allows me to place wager
so that I can place wagers in Live events

Scenario: Placing message is displayed while the wager is being placed
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketTitle|MarketNameToCreate      |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
When Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
And player introduce the <risk> amount to the <<Selection>>
And clicks on place bet
Then betslip should display wager placing message <Placing Message>

Examples:
| <GameId> | <Sport>  | <Selection>     | risk |  Placing Message | <Description>      | <MarketNameToCreate> | <MarketTitle>  | <Home Team> | <Away Team> | <League Id> | <Status>    |
| 63701    | Football | Pass Completion | 2    |  Placing bets... | AUTOTEST-BGSIR_488 | Outcome next play    | Extra Market 1 | Home_story  | Away_story  | 5           | In Progress |


