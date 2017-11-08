Meta:
@author rkora
@story BGSIR_683
@functionality betslip


Narrative:
As a player
I want to see the error messages on the betslip when the status of the market is suspended
so that I know why a wager has not been placed

Scenario:Message for the selection(s) suspended ie by suspending the relevant market
Meta:
@testType smoke
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
And market '<<MarketTitle>>' is suspended
Then <SuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | <Selection>     | SuspendedMsg           |
| 68301    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Selection is suspended |

Scenario:Message when mulitiple selection(s) unsuspended ie by unsuspending the relevant market
Meta:
@scenario multipleSelections1
@testType smoke
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And Bet slip mode is activated
And player add <Selection>,<Selection2> of <<MarketTitle>> to the betslip
And market '<<MarketTitle>>' is suspended
Then <SelectionMsg> message is displayed for all the selections in the Bet Slip
When market '<<MarketTitle>>' is un suspended
Then <UnSuspendedMsg> message is displayed for all the selections in the Bet Slip


Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | Selection       | Selection2 | SelectionMsg           | UnSuspendedMsg             |
| 68302    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Rush       | Selection is suspended | Selection is now available |

Scenario: Message when selection(s) unsuspended i.e by unsuspending the relevant market
Meta:
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
And market '<<MarketTitle>>' is suspended
Then <SuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>
When market '<<MarketTitle>>' is un suspended
Then <UnSuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | <Selection>     | Outcome Description | SuspendedMsg           |UnSuspendedMsg|
| 68303    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Pass Completion     | Selection is suspended |Selection is now available|


Scenario:Message when multiple selection(s) suspended ie by suspending the relevant market(s)
Meta:
@scenario multipleSelections
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And Bet slip mode is activated
And player add <Selection>,<Selection2> of <<MarketTitle>> to the betslip
And market '<<MarketTitle>>' is suspended
Then <SelectionMsg> message is displayed for all the selections in the Bet Slip

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | Selection       | Selection2 | SelectionMsg           |
| 68304    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Rush       | Selection is suspended |

Scenario:Message for the selection(s) suspended ie by suspending the relevant market after login
Meta:
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
When Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
And market '<<MarketTitle>>' is suspended
Then <SuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | <Selection>     | SuspendedMsg           |
| 68305    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Selection is suspended |

Scenario:Message when mulitiple selection(s) unsuspended ie by unsuspending the relevant market after login
Meta:
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
When Bet slip mode is activated
And player add <Selection>,<Selection2> of <<MarketTitle>> to the betslip
And market '<<MarketTitle>>' is suspended
Then <SelectionMsg> message is displayed for all the selections in the Bet Slip
When market '<<MarketTitle>>' is un suspended
Then <UnSuspendedMsg> message is displayed for all the selections in the Bet Slip


Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | Selection       | Selection2 | SelectionMsg           | UnSuspendedMsg             |
| 68306    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Rush       | Selection is suspended | Selection is now available |

Scenario: Message when selection(s) unsuspended i.e by unsuspending the relevant market after login
Meta:
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
When Bet slip mode is activated
And player add a <<Selection>> from <<MarketTitle>> to the betslip
And market '<<MarketTitle>>' is suspended
Then <SuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>
When market '<<MarketTitle>>' is un suspended
Then <UnSuspendedMsg> message is displayed in the Bet Slip for suspended selection <<Selection>>

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | <Selection>     | Outcome Description | SuspendedMsg           |UnSuspendedMsg|
| 68307    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Pass Completion     | Selection is suspended |Selection is now available|


Scenario:Message when multiple selection(s) suspended ie by suspending the relevant market(s) after login
Meta:
@scenario multipleSelections1
@testType regression
Given user created the event with the  below data
 |GameId     |Sport  |League Id  |Status     |MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<League Id>|<Status>   |<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
When Bet slip mode is activated
And player add <Selection>,<Selection2> of <<MarketTitle>> to the betslip
And market '<<MarketTitle>>' is suspended
Then <SelectionMsg> message is displayed for all the selections in the Bet Slip

Examples:
| <GameId> | <Sport>  | <League Id> | <Status>    | <MarketNameToCreate> | <MarketTitle>  | Selection       | Selection2 | SelectionMsg           |
| 68308    | Football | 5           | In Progress | Outcome next play    | Extra Market 1 | Pass Completion | Rush       | Selection is suspended |