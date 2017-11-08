Meta:
@story BGSIR_102
@functionality markets

Narrative:
As a player
I want that live coupon not display closed markets
so that I will see only the open/suspended markets in the coupon


Scenario: If a market is closed in the backend, the market should not be visible in the coupon area
Meta:
@scenarioName ClosedMarketNoDisplay
@author Harish
@testType regression

Given user created an event with below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|
And add an extra market using below details:
|MarketTitle    |
|<MarketTitle>  |
When player navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area
When above market is closed
And player refreshes page
Then market <<MarketTitle>> should not be visible in coupon area

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<AwayTeam NickName>|<HomeTeam NickName>|<Description>      |<MarketTitle>         |
|10201      |Football   |Home_Story     |Away_Story     |5              |In Progress |NickAway           |NickHome           |AUTOTEST-BGSIR-102 |Market to be closed  |


Scenario: Markets that were displayed bellow the closed market has to move up inside the coupon area
Meta:
@scenarioName DisplayRemainingMarketsAfterMarketClosure
@author Harish
@testType regression

Given user created an event with below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|
And add extra markets using below details:
|MarketTitle     |
|<MarketTitle1>  |
|<MarketTitle2>  |
When player navigates to above event
Then above markets should be displayed in coupon area
When market <<MarketTitle1>> is closed
And player refreshes page
Then market <<MarketTitle1>> should not be visible in coupon area
And market <<MarketTitle2>> should still be displayed in coupon Area

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<AwayTeam NickName>|<HomeTeam NickName>|<Description>      |<MarketTitle1>         |<MarketTitle2>       |
|10202      |Football   |Home_Story     |Away_Story     |5              |In Progress |NickAway           |NickHome           |AUTOTEST-BGSIR-102 |Market to be closed1  |Market to be closed2|
