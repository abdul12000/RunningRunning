Meta:
@story BGSIR_1034
@functionality couponarea

Narrative:
As a BA I want player to see only 1 status of a selection at any point of time
so that there is no ambiguity regarding at what price bet is being placed
					 
Scenario:  Placement confirmation disappears when selection price auto update is received
Meta:
@scenarioName BGSIR_1034_PlacementConfirmationDisappearance
@testType regression
@author Harish
Given an event is created using below data:
| GameId   | Sport   | Home Team   | Away Team   | League Id   | Status   | AwayTeam NickName    | HomeTeam NickName    | Description   |
| <GameId> | <Sport> | <Home Team> | <Away Team> | <League Id> | <Status> | <Away Team>_<GameId> | <Home Team>_<GameId> | <Description> |
And add the markets to the Event: 
|MarketTitle|
|<MarketTitle>|
When a player loggedIn and navigate to above event
And QBM is activated
Then market <<MarketTitle>> should be displayed in coupon area
When player selects outcome <<Selection>> from market <<MarketTitle>>
Then rejected class is applied to the selection <<Selection>> of market <<MarketTitle>>
When price is updated for one of the selection <<Selection>> with Win <WinValue> and risk <RiskValue>
Then bet button for the outcome '<<Selection>>' displays a <ExpectedPriceChangeArrow> arrow indicating the direction of the change
And rejected class is removed from selection <<Selection>> of market <<MarketTitle>>

Examples:
| <GameId> | <Sport>  | <Home Team> | <Away Team> | <League Id> | <League Id1> | <Status>    | <MarketTitle>  | <Selection> | WinValue | RiskValue | ExpectedPriceChangeArrow | <Description>       |
| 103401   | Football | Home_Story  | Away_Story  | 5           | 2            | In Progress | Extra Market 1 | Turnover    | +40      | +20       | green                    | AUTOTEST-BGSIR-1034 |

