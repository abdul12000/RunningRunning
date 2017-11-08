Meta:
@story BGSIR_100
@functionality couponarea

Narrative:
As a player 
I want to be able to expand/collapse markets available in coupon area for a live event 
so that I will be able to expand only the markets in which I am interested in
					 
Scenario:  Default mode will be expanded for all markets
Meta:
@scenarioName BGSIR100_DefaultModeForMarkets
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|
And add extra markets using below details:
|MarketTitle|
|<MarketTitle1>|
|<MarketTitle2>|
When player navigate to a Single Game View page of a Live Event <<GameId>>
Then by default all markets displayed in coupon area are expanded

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<AwayTeam NickName>|<HomeTeam NickName>|<Description>      |<MarketTitle1>  |<MarketTitle2>  |
|     |1001       |Football   |Home_Story     |Away_Story     |5              |In Progress |NickAway           |NickHome           |AUTOTEST-BGSIR-100 |Extra Market 1  |Extra Market 2  |

Scenario:  Default mode will be expanded for all markets
Meta:
@scenarioName BGSIR100_CanCollapseMarket
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|
And add extra markets using below details:
|MarketTitle|
|<MarketTitle1>|
|<MarketTitle2>|
When player navigate to a Single Game View page of a Live Event <<GameId>>
Then by default all markets displayed in coupon area are expanded
When player collapses market '<<MarketTitle1>>'
Then the market '<<MarketTitle1>>' should collapse with all outcomes hidden
And market '<<MarketTitle2>>' shoudl still be in expand mode

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<AwayTeam NickName>|<HomeTeam NickName>|<Description>      |<MarketTitle1>  |<MarketTitle2>  |
|     |1001       |Football   |Home_Story     |Away_Story     |5              |In Progress |NickAway           |NickHome           |AUTOTEST-BGSIR-100 |Extra Market 1  |Extra Market 2  |

Scenario:  Default mode will be expanded for all markets
Meta:
@scenarioName BGSIR100_CanCollapseExpandMarket
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|
And add extra markets using below details:
|MarketTitle|
|<MarketTitle1>|
|<MarketTitle2>|
When player navigate to a Single Game View page of a Live Event <<GameId>>
Then by default all markets displayed in coupon area are expanded
When player collapses market '<<MarketTitle1>>'
Then the market '<<MarketTitle1>>' should collapse with all outcomes hidden
And market '<<MarketTitle2>>' shoudl still be in expand mode
When player expands market '<<MarketTitle1>>'
Then all markets displayed in coupon area should be in expand mode


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<AwayTeam NickName>|<HomeTeam NickName>|<Description>      |<MarketTitle1>  |<MarketTitle2>  |
|     |1001       |Football   |Home_Story     |Away_Story     |5              |In Progress |NickAway           |NickHome           |AUTOTEST-BGSIR-100 |Extra Market 1  |Extra Market 2  |



