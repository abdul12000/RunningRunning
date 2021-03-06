Meta:
@author rkora
@story BGSIR_690
@functionality betslip
@testType regression

Narrative:
As a player
I want to see the error messages on the betslip when the status of the outcome is suspended
so that I know why a wager has not been placed

Scenario:Message for the selection(s) suspended ie by suspending the relevant outcome
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
And suspend outcome <Outcome Description> in backend
Then <SuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>
When suspended outcome <Outcome Description> is unsuspended in backend
Then <UnSuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | <Selection>     | SuspendedMsg           | UnSuspendedMsg             | Outcome Description |
| 69001    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Selection is suspended | Selection is now available | Pass Completion     |


Scenario:Message when mulitiple selection(s) unsuspended ie by unsuspending the relevant outcomes
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
And a new browser is opened
When player navigates to above event
And Bet slip mode is activated
And player add <Selection>,<Selection2> of <<MarketTitle>> to the betslip
And suspend outcome <Outcome Description> in backend
And suspend selection <Selection2> in backend
Then <SelectionMsg> message is displayed for all the selections in the Bet Slip
When market '<<MarketTitle>>' is un suspended
Then <UnSuspendedMsg> message is displayed for all the selections in the Bet Slip

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | Selection       | Selection2 | SelectionMsg           | UnSuspendedMsg             |Outcome Description |
| 69002    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Rush       | Selection is suspended | Selection is now available |Pass Completion     |

Scenario:Message for the selection(s) suspended ie by suspending the relevant outcome after login
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
And a new browser is opened
And player loggedIn and navigate to the above event
When Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
And suspend outcome <Outcome Description> in backend
Then <SuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>
When suspended outcome <Outcome Description> is unsuspended in backend
Then <UnSuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | <Selection>     | SuspendedMsg           | UnSuspendedMsg             | Outcome Description |
| 69003    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Selection is suspended | Selection is now available | Pass Completion     |


Scenario:Message when mulitiple selection(s) unsuspended ie by unsuspending the relevant market after login
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
And a new browser is opened
And player loggedIn and navigate to the above event
When Bet slip mode is activated
And player add <Selection>,<Selection2> of <<MarketTitle>> to the betslip
And suspend outcome <Outcome Description> in backend
And suspend selection <Selection2> in backend
Then <SelectionMsg> message is displayed for all the selections in the Bet Slip
When market '<<MarketTitle>>' is un suspended
Then <UnSuspendedMsg> message is displayed for all the selections in the Bet Slip

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | Selection       | Selection2 | SelectionMsg           | UnSuspendedMsg             |Outcome Description |
| 69004    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Rush       | Selection is suspended | Selection is now available |Pass Completion     |
