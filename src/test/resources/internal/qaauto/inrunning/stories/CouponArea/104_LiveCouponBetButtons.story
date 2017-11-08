Meta:
@author rkora
@story BGSIR_104
@functionality couponarea
@testType regression

Narrative:
As a player
I want that live coupon will contain buttons to make bet selections
so that I can place wagers easily

Scenario: verify the outcome information(selection,Price,handicap) contained on the bet button for extra market
Meta:
@scenarioName BGSIR104_VerifyOutcomeInformation
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketNameToCreate|MarketTitle|Handicap|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketNameToCreate>|<MarketTitle>|<Handicap>|
When player navigates to above event
Then the bet buttons of the market which has <<MarketTitle>> should display selection, price and <ExpectedHandicap>

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |<Handicap>    |ExpectedHandicap|
|10405      |Football   |Home_story     |Away_story     |5              |In Progress |AUTOTEST-BGSIR-104|Outcome next play   |Extra Market 1    |              |                |
|10406      |Football   |Home_story     |Away_story     |5              |In Progress |AUTOTEST-BGSIR-104|Total               |Extra Market 2    |   4.75       |4¾              |
|10407      |Football   |Home_story     |Away_story     |5              |In Progress |AUTOTEST-BGSIR-104|Point Spread        |Extra Market 3    |   3.50       |3½              |
|10408      |Football   |Home_story     |Away_story     |5              |In Progress |AUTOTEST-BGSIR-104|Total               |Extra Market 4    |   2.25       |2¼              |



