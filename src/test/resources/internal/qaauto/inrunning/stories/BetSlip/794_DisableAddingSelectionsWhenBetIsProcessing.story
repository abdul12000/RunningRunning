Meta:
@author rkora
@story BGSIR_794
@functionality betslip
@testType smoke

Narrative:
As a player
I want selections cannot be added to betslip while bet(s) are processing
so that I cannot add bet(s) to betslip


Scenario: Quick bet mode switch to be disabled when bet placement is being processed
Given user created the event with the  below data
|GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate      |
|<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
When a player loggedIn and navigate to above event
And Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
When player introduce the <risk> amount to the <<Selection>>
And clicks on place bet
Then betslip should display wager placing message <Placing Message>
When player add one more selection <<Selection2>> from <<MarketTitle>> to the betslip
Then the number of selections <<Selection count>> displayed in the Bet slip

Examples:
| <GameId> | <Sport>  | <Selection>     | <Selection2> | <Selection count> | risk | Username | Password | <MarketNameToCreate> | <MarketTitle>  | <League Id> | <Status>    | Placing Message |
| 79401    | Football | Pass Completion | Rush         | 1                 | 2    | 2393086  | testing  | Outcome next play    | Extra Market 1 | 5           | In Progress | Placing bets... |

