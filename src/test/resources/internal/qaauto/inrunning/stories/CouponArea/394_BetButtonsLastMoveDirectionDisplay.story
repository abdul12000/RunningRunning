Meta:
@author rkora
@story BGSIR_394
@functionality couponarea
@testType regression

Narrative:
As a player
I want bet buttons to display an indicator that shows the last price move direction
so that I am aware of the direction in the last price change for selections of markets in Live Coupons

Scenario: verify Live Coupon Prices Information to be automatically updated

Given user created the event with the  below data
|GameId     |Sport      |MarketNameToCreate  |MarketTitle   |League Id  |Status      |
|<GameId>   |<Sport>    |<MarketNameToCreate>|<MarketTitle> |<League Id>|<Status>    |
When player navigates to above event
And price is updated for one of the outcome <OutcomeDesc> with Win <WinValue> and risk <RiskValue>
When other market added:
|MarketName   |
|<MarketName1>|
Then bet button for the outcome<OutcomeDesc> displays a <ExpectedPriceChangeArrow> arrow indicating the direction of the change

Examples:
| <GameId> | <Sport>    | ExpectedPriceChangeArrow | <MarketNameToCreate> | <MarketTitle>              | OutcomeDesc | WinValue | RiskValue | Price | <League Id> | <Status>    | <MarketName1>     |
| 39401    | Football   | green                    | Total                | EXTRA MARKET Total         | Over        | 24       | 20        | +120  | 5           | In Progress | Outcome next play |
| 39402    | Football   | red                      | Moneyline            | EXTRA MARKET Moneyline     | HOME        | 20       | 24        | -120  | 5           | In Progress | Point Spread      |
| 39403    | Hockey     | red                      | Point Spread         | EXTRA MARKET               | Stars       | 20       | 24        | -120  | 50          | In Progress | Total             |
| 39404    | Hockey     | green                    | Total                | EXTRA MARKET               | Under       | 24       | 20        | +120  | 50          | In Progress | Outcome next play |
| 39405    | Tennis     | red                      | Point Spread         | EXTRA MARKET Total         | Federer     | 20       | 24        | -120  | 325         | In Progress | Point Spread      |
| 39406    | Tennis     | green                    | Match Result         | EXTRA MARKET Match Result  | Rafa        | 24       | 20        | +120  | 325         | In Progress | Outcome next play |
| 39407    | Basketball | red                      | Moneyline            | EXTRA MARKET Points Spread | HOME        | 20       | 24        | -120  | 2           | In Progress | Outcome next play |
| 39408    | Basketball | green                    | Total                | EXTRA MARKET Total         | Over        | 24       | 20        | +120  | 2           | In Progress | Moneyline         |
| 39409    | Soccer     | red                      | Outcome next play    | EXTRA MARKET               | Rush        | 20       | 24        | -120  | 33          | In Progress | Outcome next play |
| 39410    | Soccer     | green                    | Total                | EXTRA MARKET Total         | Over        | 24       | 20        | +120  | 33          | In Progress | Point Spread      |


Scenario: verify Live Coupon Prices Information to be automatically updated after login

Given user created the event with the  below data
|GameId     |Sport      |MarketNameToCreate  |MarketTitle   |League Id  |Status      |
|<GameId>   |<Sport>    |<MarketNameToCreate>|<MarketTitle> |<League Id>|<Status>    |
And player loggedIn and navigate to the above event
When price is updated for one of the outcome <OutcomeDesc> with Win <WinValue> and risk <RiskValue>
And other market added:
|MarketName   |
|<MarketName1>|
Then bet button for the outcome<OutcomeDesc> displays a <ExpectedPriceChangeArrow> arrow indicating the direction of the change

Examples:
| <GameId> | <Sport>    | ExpectedPriceChangeArrow | <MarketNameToCreate> | <MarketTitle>              | OutcomeDesc | WinValue | RiskValue | Price | <League Id> | <Status>    | <MarketName1>     |
| 39401    | Football   | green                    | Total                | EXTRA MARKET Total         | Over        | 24       | 20        | +120  | 5           | In Progress | Outcome next play |
| 39402    | Football   | red                      | Moneyline            | EXTRA MARKET Moneyline     | HOME        | 20       | 24        | -120  | 5           | In Progress | Point Spread      |
| 39403    | Hockey     | red                      | Point Spread         | EXTRA MARKET               | Stars       | 20       | 24        | -120  | 50          | In Progress | Total             |
| 39404    | Hockey     | green                    | Total                | EXTRA MARKET               | Under       | 24       | 20        | +120  | 50          | In Progress | Outcome next play |
| 39405    | Tennis     | red                      | Point Spread         | EXTRA MARKET Total         | Federer     | 20       | 24        | -120  | 325         | In Progress | Point Spread      |
| 39406    | Tennis     | green                    | Match Result         | EXTRA MARKET Match Result  | Rafa        | 24       | 20        | +120  | 325         | In Progress | Outcome next play |
| 39407    | Basketball | red                      | Moneyline            | EXTRA MARKET Points Spread | HOME        | 20       | 24        | -120  | 2           | In Progress | Outcome next play |
| 39408    | Basketball | green                    | Total                | EXTRA MARKET Total         | Over        | 24       | 20        | +120  | 2           | In Progress | Moneyline         |
| 39409    | Soccer     | red                      | Outcome next play    | EXTRA MARKET               | Rush        | 20       | 24        | -120  | 33          | In Progress | Outcome next play |
| 39410    | Soccer     | green                    | Total                | EXTRA MARKET Total         | Over        | 24       | 20        | +120  | 33          | In Progress | Point Spread      |

