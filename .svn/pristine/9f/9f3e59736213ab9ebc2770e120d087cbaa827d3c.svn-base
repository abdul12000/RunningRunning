Meta:
@author rkora
@story BGSIR_686
@functionality betslip
@testType regression

Narrative:
As a player
I want the price changes message to be displayed on the betslip
so that I get information about price changes in my bets

Scenario: price change message is displayed for a selection
Meta:
@scenarioName priceChangeMessageForSingleSelection
Given user created the event with the  below data
| GameId   | Sport   | League Id   | Status   | MarketTitle   | MarketNameToCreate   |
| <GameId> | <Sport> | <League Id> | <Status> | <MarketTitle> | <MarketNameToCreate> |
And price is set for the below selections
| MarketTitle    | Selection   | WinValue    | RiskValue    |
| <MarketTitle> | <Selection> | <WinValue1> | <RiskValue1> |
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
When price is updated for the below selections in the betslip
| MarketTitle   | Selection   | WinValue    | RiskValue    |
| <MarketTitle> | <Selection> | <WinValue2> | <RiskValue2> |
Then the updated prices should be automatically updated in the Bet slip for the below selections
| Selection    | Price    |
| <Selection>  | <AfterPrice>   |
And the price change message should be displayed for the below selections
| Selection   | BeforePrice   | Price       | Change   |
| <Selection> | <BeforePrice> | <AfterPrice> | <Change> |

Examples:
| <GameId> | <Sport>    | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>      | <Selection> | <WinValue1> | <RiskValue1> | <BeforePrice> | <WinValue2> | <RiskValue2> | <AfterPrice> | <Change>  |
| 68601    | Football   | 5           | In Progress | Moneyline            | Extra Market ML    | AWAY        | 20          | 24           | -120          | 24          | 20           | +120         | increased |
| 68602    | Soccer     | 33          | In Progress | Point Spread         | Extra Market PS    | HOME        | 24          | 20           | +120          | 20          | 24           | -120         | decreased |
| 68603    | Basketball | 2           | Upcoming    | Total                | Extra Market Total | Under       | 20          | 24           | -120          | 24          | 20           | +120         | increased |
| 68604    | Tennis     | 325         | Upcoming    | Outcome next play    | Extra Market 1     | Rush        | 24          | 20           | +120          | 20          | 24           | -120         | decreased |

Scenario: price change message is displayed for selections
Meta:
@scenarioName priceChangeMessageForMultipleSelections
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |
 |<GameId>   |<Sport>|<League Id>|<Status>   |
And add extra markets using below details:
| MarketName    | MarketTitle    |
| <MarketName1> | <MarketTitle1> |
| <MarketName2> | <MarketTitle2> |
And price is set for the below selections
| MarketTitle    | Selection    | WinValue          | RiskValue          |
| <MarketTitle1> | <Selection1> | <BeforeWinValue1> | <BeforeRiskValue1> |
| <MarketTitle2> | <Selection2> | <BeforeWinValue2> | <BeforeRiskValue2> |
When player navigates to above event
And add below selections to the betslip from the markets listed below:
| MarketTitle    | Selection    |
| <MarketTitle1> | <Selection1> |
| <MarketTitle2> | <Selection2> |
When price is updated for the below selections in the betslip
| MarketTitle    | Selection    | WinValue         | RiskValue         |
| <MarketTitle1> | <Selection1> | <AfterWinValue1> | <AfterRiskValue1> |
| <MarketTitle2> | <Selection2> | <AfterWinValue2> | <AfterRiskValue2> |
Then the updated prices should be automatically updated in the Bet slip for the below selections
| Selection    | Price         |
| <Selection1> | <AfterPrice1> |
| <Selection2> | <AfterPrice2> |
And the price change message should be displayed for the below selections
| Selection    | BeforePrice    | Price         | Change    |
| <Selection1> | <BeforePrice1> | <AfterPrice1> | <Change1> |
| <Selection2> | <BeforePrice2> | <AfterPrice2> | <Change2> |

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketName1>     | <MarketName2> | <MarketTitle1>     | <MarketTitle2>     | <Selection1> | <Selection2> | <BeforeWinValue1> | <BeforeRiskValue1> | <BeforePrice1> | <BeforePrice2> | <BeforeWinValue2> | <BeforeRiskValue2> | <AfterWinValue1> | <AfterRiskValue1> | <AfterPrice1> | <AfterPrice2> | <AfterWinValue2> | <AfterRiskValue2> | <Change1> | <Change2> |
| 68611    | Football | 5           | In Progress | Total             | Point Spread  | Extra Market Total | Extra Market PS    | Over         | AWAY         | 20                | 24                 | -120           | -120           | 20                | 24                 | 24               | 20                | +120          | +120          | 24               | 20                | increased | increased |
| 68612    | Tennis   | 325         | In Progress | Outcome next play | Total         | Extra Market 1     | Extra Market Total | Turnover     | Over         | 24                | 20                 | +120           | +120           | 24                | 20                 | 20               | 24                | -120          | -120          | 20               | 24                | decreased | decreased |
| 68613    | Hockey   | 50          | In Progress | Outcome next play | Total         | Extra Market 1     | Extra Market Total | Rush         | Under        | 24                | 20                 | +120           | -120           | 20                | 24                 | 20               | 24                | -120          | +120          | 24               | 20                | decreased | increased |
| 68614    | Soccer   | 33          | In Progress | Total             | Point Spread  | Extra Market Total | Extra Market PS    | Over         | AWAY         | 20                | 24                 | -120           | +120           | 24                | 20                 | 24               | 20                | +120          | -120          | 20               | 24                | increased | decreased |
| 68615    | Football | 5           | Upcoming    | Total             | Point Spread  | Extra Market Total | Extra Market PS    | Over         | AWAY         | 20                | 24                 | -120           | -120           | 20                | 24                 | 24               | 20                | +120          | +120          | 24               | 20                | increased | increased |
| 68616    | Tennis   | 325         | In Progress | Outcome next play | Total         | Extra Market 1     | Extra Market Total | Turnover     | Over         | 24                | 20                 | +120           | +120           | 24                | 20                 | 20               | 24                | -120          | -120          | 20               | 24                | decreased | decreased |
| 68617    | Hockey   | 50          | Upcoming    | Outcome next play | Total         | Extra Market 1     | Extra Market Total | Rush         | Under        | 24                | 20                 | +120           | -120           | 20                | 24                 | 20               | 24                | -120          | +120          | 24               | 20                | decreased | increased |
| 68618    | Soccer   | 33          | Upcoming    | Total             | Point Spread  | Extra Market Total | Extra Market PS    | Over         | AWAY         | 20                | 24                 | -120           | +120           | 24                | 20                 | 24               | 20                | +120          | -120          | 20               | 24                | increased | decreased |


Scenario: price change message is displayed for a selection after login
Meta:
@scenarioName priceChangeMessageForSingleSelection_LoggedInUser
Given user created the event with the  below data
| GameId   | Sport   | League Id   | Status   | MarketTitle   | MarketNameToCreate   |
| <GameId> | <Sport> | <League Id> | <Status> | <MarketTitle> | <MarketNameToCreate> |
And price is set for the below selections
| MarketTitle    | Selection   | WinValue    | RiskValue    |
| <MarketTitle> | <Selection> | <WinValue1> | <RiskValue1> |
And player loggedIn and navigate to the above event
When Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
When price is updated for the below selections in the betslip
| MarketTitle   | Selection   | WinValue    | RiskValue    |
| <MarketTitle> | <Selection> | <WinValue2> | <RiskValue2> |
Then the updated prices should be automatically updated in the Bet slip for the below selections
| Selection    | Price    |
| <Selection>  | <AfterPrice>   |
And the price change message should be displayed for the below selections
| Selection   | BeforePrice   | Price       | Change   |
| <Selection> | <BeforePrice> | <AfterPrice> | <Change> |

Examples:
| <GameId> | <Sport>    | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>      | <Selection> | <WinValue1> | <RiskValue1> | <BeforePrice> | <WinValue2> | <RiskValue2> | <AfterPrice> | <Change>  |
| 68601    | Football   | 5           | In Progress | Moneyline            | Extra Market ML    | AWAY        | 20          | 24           | -120          | 24          | 20           | +120         | increased |
| 68602    | Soccer     | 33          | In Progress | Point Spread         | Extra Market PS    | HOME        | 24          | 20           | +120          | 20          | 24           | -120         | decreased |
| 68603    | Basketball | 2           | Upcoming    | Total                | Extra Market Total | Under       | 20          | 24           | -120          | 24          | 20           | +120         | increased |
| 68604    | Tennis     | 325         | Upcoming    | Outcome next play    | Extra Market 1     | Rush        | 24          | 20           | +120          | 20          | 24           | -120         | decreased |

Scenario: price change message is displayed for selections afterLogin
Meta:
@scenarioName priceChangeMessageForMultipleSelections_LoggedInUser
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |
 |<GameId>   |<Sport>|<League Id>|<Status>   |
And add extra markets using below details:
| MarketName    | MarketTitle    |
| <MarketName1> | <MarketTitle1> |
| <MarketName2> | <MarketTitle2> |
And price is set for the below selections
| MarketTitle    | Selection    | WinValue          | RiskValue          |
| <MarketTitle1> | <Selection1> | <BeforeWinValue1> | <BeforeRiskValue1> |
| <MarketTitle2> | <Selection2> | <BeforeWinValue2> | <BeforeRiskValue2> |
And player loggedIn and navigate to the above event
When Bet slip mode is activated
And add below selections to the betslip from the markets listed below:
| MarketTitle    | Selection    |
| <MarketTitle1> | <Selection1> |
| <MarketTitle2> | <Selection2> |
When price is updated for the below selections in the betslip
| MarketTitle    | Selection    | WinValue         | RiskValue         |
| <MarketTitle1> | <Selection1> | <AfterWinValue1> | <AfterRiskValue1> |
| <MarketTitle2> | <Selection2> | <AfterWinValue2> | <AfterRiskValue2> |
Then the updated prices should be automatically updated in the Bet slip for the below selections
| Selection    | Price         |
| <Selection1> | <AfterPrice1> |
| <Selection2> | <AfterPrice2> |
And the price change message should be displayed for the below selections
| Selection    | BeforePrice    | Price         | Change    |
| <Selection1> | <BeforePrice1> | <AfterPrice1> | <Change1> |
| <Selection2> | <BeforePrice2> | <AfterPrice2> | <Change2> |

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketName1>     | <MarketName2> | <MarketTitle1>     | <MarketTitle2>     | <Selection1> | <Selection2> | <BeforeWinValue1> | <BeforeRiskValue1> | <BeforePrice1> | <BeforePrice2> | <BeforeWinValue2> | <BeforeRiskValue2> | <AfterWinValue1> | <AfterRiskValue1> | <AfterPrice1> | <AfterPrice2> | <AfterWinValue2> | <AfterRiskValue2> | <Change1> | <Change2> |
| 68611    | Football | 5           | In Progress | Total             | Point Spread  | Extra Market Total | Extra Market PS    | Over         | AWAY         | 20                | 24                 | -120           | -120           | 20                | 24                 | 24               | 20                | +120          | +120          | 24               | 20                | increased | increased |
| 68612    | Tennis   | 325         | In Progress | Outcome next play | Total         | Extra Market 1     | Extra Market Total | Turnover     | Over         | 24                | 20                 | +120           | +120           | 24                | 20                 | 20               | 24                | -120          | -120          | 20               | 24                | decreased | decreased |
| 68613    | Hockey   | 50          | In Progress | Outcome next play | Total         | Extra Market 1     | Extra Market Total | Rush         | Under        | 24                | 20                 | +120           | -120           | 20                | 24                 | 20               | 24                | -120          | +120          | 24               | 20                | decreased | increased |
| 68614    | Soccer   | 33          | In Progress | Total             | Point Spread  | Extra Market Total | Extra Market PS    | Over         | AWAY         | 20                | 24                 | -120           | +120           | 24                | 20                 | 24               | 20                | +120          | -120          | 20               | 24                | increased | decreased |
| 68615    | Football | 5           | Upcoming    | Total             | Point Spread  | Extra Market Total | Extra Market PS    | Over         | AWAY         | 20                | 24                 | -120           | -120           | 20                | 24                 | 24               | 20                | +120          | +120          | 24               | 20                | increased | increased |
| 68612    | Tennis   | 325         | In Progress | Outcome next play | Total         | Extra Market 1     | Extra Market Total | Turnover     | Over         | 24                | 20                 | +120           | +120           | 24                | 20                 | 20               | 24                | -120          | -120          | 20               | 24                | decreased | decreased |
| 68617    | Hockey   | 50          | Upcoming    | Outcome next play | Total         | Extra Market 1     | Extra Market Total | Rush         | Under        | 24                | 20                 | +120           | -120           | 20                | 24                 | 20               | 24                | -120          | +120          | 24               | 20                | decreased | increased |
| 68618    | Soccer   | 33          | Upcoming    | Total             | Point Spread  | Extra Market Total | Extra Market PS    | Over         | AWAY         | 20                | 24                 | -120           | +120           | 24                | 20                 | 24               | 20                | +120          | -120          | 20               | 24                | increased | decreased |
