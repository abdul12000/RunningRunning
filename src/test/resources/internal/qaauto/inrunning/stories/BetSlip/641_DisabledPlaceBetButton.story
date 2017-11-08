Meta:
@author rkora
@story BGSIR_641
@functionality betslip

Narrative:
As a player
I want Place Bets button to be disabled when risk/to win amounts are not introduced in the selections in the Bet Slip
so that I will know when I am allowed to proceed placing wagers

Scenario: place button is in disabled state when either risk or win amount is not introduced
Meta:
@scenarioname singleSelection
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
And place bet button should be in disabled state

Examples:
|<GameId>   |<Sport>    |<League Id>    |<Status>    |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|64101      |Football   |5              |In Progress |Outcome next play   |Extra Market 1    |Pass Completion|

Scenario: place button is in disabled state when either risk or win amount is not introduced
Meta:
@scenarioname multipleSelections
@testType smoke
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |
 |<GameId>   |<Sport>|<League Id>|<Status>   |
When add markets with below details:
|MarketName|MarketTitle|
|<MarketName1>|<MarketTitle1>|
|<MarketName2>|<MarketTitle2>|
When player navigates to above event
And add below selections to the betslip from the markets listed below:
| MarketTitle    | Selection    |
| <MarketTitle1> | <Selection1> |
| <MarketTitle2> | <Selection2> |
Then below selections should be displayed in the betslip
| Selection    |
| <Selection1> |
| <Selection2> |
Then place bet button should be in disabled state


Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketName1> | <MarketName2>     | <MarketTitle1>     | <MarketTitle2> | <Selection1> | <Selection2> | <Amount> |
| 64102    | Football | 5           | In Progress | Total         | Outcome next play | Extra Market Total | Extra Market 1 | Under        | Rush         | 5        |


Scenario: place button is in disabled state when one of the selection risk amount is introduced
Meta:
@scenarioname multipleSelections_RiskAmount
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |
 |<GameId>   |<Sport>|<League Id>|<Status>   |
When add markets with below details:
|MarketName|MarketTitle|
|<MarketName1>|<MarketTitle1>|
|<MarketName2>|<MarketTitle2>|
When player navigates to above event
And add below selections to the betslip from the markets listed below:
| MarketTitle    | Selection    |
| <MarketTitle1> | <Selection1> |
| <MarketTitle2> | <Selection2> |
Then below selections should be displayed in the betslip
| Selection    |
| <Selection1> |
| <Selection2> |
When player introduce the risk amount for the below selections
| Selection    | Amount   |
| <Selection1> | <Amount> |
Then place bet button should be in disabled state


Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketName1> | <MarketName2>     | <MarketTitle1>     | <MarketTitle2> | <Selection1> | <Selection2> | <Amount> |
| 64103    | Football | 5           | In Progress | Total         | Outcome next play | Extra Market Total | Extra Market 1 | Under        | Rush         | 5        |

Scenario: place button is in disabled state when one of the selection To win amount is introduced
Meta:
@scenarioname multipleSelections_ToWinAmount
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |
 |<GameId>   |<Sport>|<League Id>|<Status>   |
When add markets with below details:
|MarketName|MarketTitle|
|<MarketName1>|<MarketTitle1>|
|<MarketName2>|<MarketTitle2>|
When player navigates to above event
And add below selections to the betslip from the markets listed below:
| MarketTitle    | Selection    |
| <MarketTitle1> | <Selection1> |
| <MarketTitle2> | <Selection2> |
Then below selections should be displayed in the betslip
| Selection    |
| <Selection1> |
| <Selection2> |
When player introduced the To Win amount for the below selections
| Selection    | Amount   |
| <Selection2> | <Amount> |
Then place bet button should be in disabled state


Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketName1> | <MarketName2>     | <MarketTitle1>     | <MarketTitle2> | <Selection1> | <Selection2> | <Amount> |
| 64104    | Football | 5           | In Progress | Point Spread  | Outcome next play | Extra Market Total | Extra Market 1 | HOME         | Turnover     | 2        |


Scenario: place button is in disabled state when either risk or win amount is not introduced after login
Meta:
@scenarioname singleSelection_afterLogin
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
When a player loggedIn and navigate to above event
And Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
And place bet button should be in disabled state

Examples:
|<GameId>   |<Sport>    |<League Id>    |<Status>    |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|64105      |Football   |5              |In Progress |Outcome next play   |Extra Market 1    |Pass Completion|

Scenario: place button is in disabled state when either risk or win amount is not introduced after login
Meta:
@scenarioname multipleSelections_afterLogin
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |
 |<GameId>   |<Sport>|<League Id>|<Status>   |
When add markets with below details:
|MarketName|MarketTitle|
|<MarketName1>|<MarketTitle1>|
|<MarketName2>|<MarketTitle2>|
When a player loggedIn and navigate to above event
And Bet slip mode is activated
And add below selections to the betslip from the markets listed below:
| MarketTitle    | Selection    |
| <MarketTitle1> | <Selection1> |
| <MarketTitle2> | <Selection2> |
Then below selections should be displayed in the betslip
| Selection    |
| <Selection1> |
| <Selection2> |
Then place bet button should be in disabled state


Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketName1> | <MarketName2>     | <MarketTitle1>     | <MarketTitle2> | <Selection1> | <Selection2> | <Amount> |
| 64106    | Football | 5           | In Progress | Total         | Outcome next play | Extra Market Total | Extra Market 1 | Under        | Rush         | 5        |


Scenario: place button is in disabled state when one of the selection risk amount is introduced after login
Meta:
@scenarioname multipleSelections_RiskAmount_afterLogin
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |
 |<GameId>   |<Sport>|<League Id>|<Status>   |
When add markets with below details:
|MarketName|MarketTitle|
|<MarketName1>|<MarketTitle1>|
|<MarketName2>|<MarketTitle2>|
When a player loggedIn and navigate to above event
And Bet slip mode is activated
And add below selections to the betslip from the markets listed below:
| MarketTitle    | Selection    |
| <MarketTitle1> | <Selection1> |
| <MarketTitle2> | <Selection2> |
Then below selections should be displayed in the betslip
| Selection    |
| <Selection1> |
| <Selection2> |
When player introduce the risk amount for the below selections
| Selection    | Amount   |
| <Selection1> | <Amount> |
Then place bet button should be in disabled state


Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketName1> | <MarketName2>     | <MarketTitle1>     | <MarketTitle2> | <Selection1> | <Selection2> | <Amount> |
| 64107    | Football | 5           | In Progress | Total         | Outcome next play | Extra Market Total | Extra Market 1 | Under        | Rush         | 5        |

Scenario: place button is in disabled state when one of the selection To win amount is introduced after login
Meta:
@scenarioname multipleSelections_ToWinAmount_afterLogin
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |
 |<GameId>   |<Sport>|<League Id>|<Status>   |
When add markets with below details:
|MarketName|MarketTitle|
|<MarketName1>|<MarketTitle1>|
|<MarketName2>|<MarketTitle2>|
And a player loggedIn and navigate to above event
And Bet slip mode is activated
And add below selections to the betslip from the markets listed below:
| MarketTitle    | Selection    |
| <MarketTitle1> | <Selection1> |
| <MarketTitle2> | <Selection2> |
Then below selections should be displayed in the betslip
| Selection    |
| <Selection1> |
| <Selection2> |
When player introduced the To Win amount for the below selections
| Selection    | Amount   |
| <Selection2> | <Amount> |
Then place bet button should be in disabled state


Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketName1> | <MarketName2>     | <MarketTitle1>     | <MarketTitle2> | <Selection1> | <Selection2> | <Amount> |
| 64108    | Football | 5           | In Progress | Point Spread  | Outcome next play | Extra Market Total | Extra Market 1 | HOME         | Turnover     | 2        |