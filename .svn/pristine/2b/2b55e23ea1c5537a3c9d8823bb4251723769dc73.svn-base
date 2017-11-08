Meta:
@author rkora
@story BGSIR_101
@functionality markets
@testType regression

Narrative:
As a player
I want live coupon to indicate with a visual display when markets are suspended
so that I will know in which market I can place wagers

Scenario: Suspended markets
Meta:
@scenarioName BGSIR101_marketColumnLayoutsWhenMarketsSuspended
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
And suspend the market <<MarketNameToCreate>>
When player navigates to above event
Then there will be no betting available on the <<MarketTitle>>
And buttons of <<MarketTitle>> should not be visible

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |<MarketNameToCreate>|<MarketTitle>     |
|10105      |Football   |Home_story     |Away_story     |5              |In Progress |AUTOTEST-story    |Outcome next play   |Extra Market 1    |
|10106      |Soccer     |Home_story     |Away_story     |33             |In Progress |AUTOTEST-story    |Outcome next play   |Extra Market 1    |
|10107      |Tennis     |Home_story     |Away_story     |325            |In Progress |AUTOTEST-story    |Outcome next play   |Extra Market 1    |
|10108      |Hockey     |Home_story     |Away_story     |50             |In Progress |AUTOTEST-story    |Outcome next play   |Extra Market 1    |
|10109      |Basketball |Home_story     |Away_story     |2              |In Progress |AUTOTEST-story    |Outcome next play   |Extra Market 1    |
