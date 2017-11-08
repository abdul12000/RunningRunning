Meta:
@author rkora
@story BGSIR_437
@functionality betslip

Narrative:
As a player
I want Total Stake to be displayed on the bottom of the Betslip
so that I am aware of the money that I am risking in total

Scenario: Total Stake to be displayed as 1 bet in the Betslip
Meta:
@testType regression
@scenarioName TotalStake for a single bet
Given user created the event with the  below data
 |GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
And player navigate to a Single Game View page of a Live Event <<GameId>>
When player add a <<Selection>> from <<MarketTitle>> to the betslip
And player introduce the <risk> amount to the <<Selection>>
Then Total <Stake> will be displayed in the bottom of the betslip

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |risk       |Stake|
|43701      |Football   |Home_story     |Away_story     |5              |In Progress |AUTOTEST-story    |Outcome next play   |Extra Market 1    |Pass Completion|2.00       |2.00 |

Scenario: Total Stake to be displayed for More than one bet in the Betslip

Meta:
@testType smoke
@scenarioName TotalStake for mulitble bets

Given user created the event with the  below data
 |GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
 |<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
And player navigate to a Single Game View page of a Live Event <<GameId>>
When player add <Selection>,<Selection2> of <<MarketTitle>> to the betslip
And enter the risk <Amount> to <Selection>,<Selection2>
Then Total <Stake> will be displayed in the bottom of the betslip

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle> |Selection      |Selection2|Amount|Stake|
|43702      |Football   |Home_story     |Away_story     |5              |In Progress |AUTOTEST-story|Outcome next play   |Extra Market 1    |Pass Completion|Rush      |2.00  |4.00|
