Meta:
@author rkora
@story BGSIR_436
@functionality betslip
@testType smoke

Narrative:
As a player
I want To Win field in Betslip to be auto-populated with the corresponding winning value
so that I am aware of the amount that I will win if I place and win the wager

Scenario: To Win field is auto-populated when Stake is introduced
Given user created the event with the  below data
 |GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketTitle|MarketNameToCreate      |Win Extra  |Risk Extra  |
 |<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|<Win Extra>|<Risk Extra>|
And player navigate to a Single Game View page of a Live Event <<GameId>>
When player add a <<Selection>> from <<MarketTitle>> to the betslip
And player introduce the <ToWin> amount to the $Selection
Then <ToWin> amount is displayed based on price and the stake value of <Selection>


Examples:
| <GameId> | <Sport>  | <MarketNameToCreate> | <MarketTitle>  | <Selection>     | risk  | ToWin | <Win Extra> | <Risk Extra> | <Home Team> | <Away Team> | <League Id> | <Status>    | <Description>  |
| 43601    | Football | Outcome next play    | Extra Market 1 | Pass Completion | 2. 00 | 3.52  | 44          | 25           | Home_story  | Away_story  | 5           | In Progress | AUTOTEST-story |
| 43602    | Soccer   | Outcome next play    | Extra Market 1 | Pass Incomplete | 1.25  | 2.20  | 44          | 25           | Home_story  | Away_story  | 33          | In Progress | AUTOTEST-story |