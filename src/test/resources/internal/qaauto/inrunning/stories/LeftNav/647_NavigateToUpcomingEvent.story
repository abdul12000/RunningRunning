Meta:
@author rkora
@story BGSIR_647
@functionality leftnav
@testType regression

Narrative:
As a player
I want Upcoming events component to give the ability to navigate to the coupon of an upcoming event with open markets
so that I will be able to place wagers in markets that are open prior the game starts

Scenario: upcoming event link in the left nav with open markets allows the user to navigate to the coupon page
Meta:
@scenarioName BGSIR_647_NavigateToCouponPage
Given an upcoming event created using below data:
|GameId   |Sport   |League Id    |Status  |Away Team  |Home Team  |AwayTeam NickName    |HomeTeam NickName    |
|<GameId> |<Sport> |<League Id>  |<Status>|<Away Team>|<Home Team>|<Away Team>_<GameId> |<Home Team>_<GameId> |
And add markets with below details:
|MarketName   |
|<MarketName1>|
|<MarketName2>|
When player navigate to any In-Running page
And click on above upcoming event
Then above markets should be displayed in coupon area

Examples:
| <GameId> | <Sport>    | <League Id> | <Status> | <Away Team>         | <Home Team>         |<MarketName1> | <MarketName2> |
| 64701    | Football   | 5           | Upcoming | FA_story            | FH_story            | Total         | Point Spread  |
| 64702    | Football   | 5           | Upcoming | FH_story            | FA_story            | Total         | Point Spread  |
| 64703    | Hockey     | 50          | Upcoming | HA_story            | HH_story            | Total         | Point Spread  |
| 64704    | Hockey     | 50          | Upcoming | HH_story            | HA_story            | Total         | Point Spread  |
| 64705    | Tennis     | 325         | Upcoming | TA_story            | TH_story            | Total         | Point Spread  |
| 64706    | Tennis     | 325         | Upcoming | TH_story            | TA_story            | Total         | Point Spread  |
| 64707    | Basketball | 2           | Upcoming | BA_story            | BH_story            | Total         | Point Spread  |                  
| 64708    | Basketball | 2           | Upcoming | BH_story            | BA_story            | Total         | Point Spread  |
| 64709    | Soccer     | 33          | Upcoming | SA_story            | SH_story            | Total         | Point Spread  |
| 64710    | Soccer     | 33          | Upcoming | SH_story            | SA_story            | Total         | Point Spread  |

Scenario: upcoming event link in the left nav with open and suspended markets allows the user to navigate to the live coupon
Meta:
@scenarioName BGSIR_647_NavigateToCoupon_SuspendedMarkets
Given an upcoming event created using below data:
|GameId   |Sport   |League Id    |Status  |Away Team  |Home Team  |AwayTeam NickName    |HomeTeam NickName    |DisplayAwayTeamFirst  |
|<GameId> |<Sport> |<League Id>  |<Status>|<Away Team>|<Home Team>|<Away Team>_<GameId> |<Home Team>_<GameId> |<DisplayAwayTeamFirst>|
And add markets with below details:
|MarketName   |
|<MarketName1>|
|<MarketName2>|
When one of the market <MarketName2> is suspended
And player navigate to any In-Running page
And click on above upcoming event
Then above markets should be displayed in coupon area

Examples:
| <GameId> | <Sport>    | <League Id> | <Status> | <Away Team>         | <Home Team>         | <DisplayAwayTeamFirst> | <MarketName1>     | <MarketName2> |
| 64711    | Football   | 5           | Upcoming | FA_story            | FH_story            | false                  | Total             | Point Spread  |
| 64712    | Football   | 5           | Upcoming | FH_story            | FA_story            | true                   | Total             | Point Spread  |
| 64713    | Hockey     | 50          | Upcoming | HA_story            | HH_story            | false                  | Total             | Point Spread  |
| 64714    | Hockey     | 50          | Upcoming | HHH_story           | HHA_story           | true                   | Outcome next play | Point Spread  |
| 64715    | Tennis     | 325         | Upcoming | TA_story            | TH_story            | false                  | Total             | Point Spread  |
| 64716    | Tennis     | 325         | Upcoming | TH_story            | TA_story            | false                  | Total             | Point Spread  |
| 64717    | Basketball | 2           | Upcoming | BA_story            | BH_story            | false                  | Total             | Point Spread  |
| 64718    | Basketball | 2           | Upcoming | BH_story            | BA_story            | true                   | Total             | Point Spread  |
| 64719    | Soccer     | 33          | Upcoming | SA_story            | SH_story            | true                   | Total             | Point Spread  |
| 64720    | Soccer     | 33          | Upcoming | SH_story            | SA_story            | false                  | Total             | Point Spread  |


Scenario: upcoming event link in the left nav with suspended markets allows the user to navigate to the coupon page
Meta:
@scenarioName BGSIR_647_NavigateToCoupon_AllSuspended
Given an upcoming event created using below data:
|GameId   |Sport   |League Id    |Status  |Away Team  |Home Team  |AwayTeam NickName    |HomeTeam NickName    |DisplayAwayTeamFirst  |
|<GameId> |<Sport> |<League Id>  |<Status>|<Away Team>|<Home Team>|<Away Team>_<GameId> |<Home Team>_<GameId> |<DisplayAwayTeamFirst>|
And add markets with below details:
|MarketName   |
|<MarketName1>|
|<MarketName2>|
When the below markets are suspended:
|MarketName   |
|<MarketName1>|
|<MarketName2>|
And player navigate to any In-Running page
And click on above upcoming event
Then above markets should be displayed in coupon area

Examples:
| <GameId> | <Sport>    | <League Id> | <Status> | <Away Team>         | <Home Team>         |<MarketName1> | <MarketName2>     |
| 64721    | Football   | 5           | Upcoming | FA_story            | FH_story            | Total         | Point Spread      |
| 64722    | Football   | 5           | Upcoming | FH_story            | FA_story            | Total         | Point Spread      |
| 64723    | Hockey     | 50          | Upcoming | HA_story            | HH_story            | Total         | Point Spread      |
| 64724    | Hockey     | 50          | Upcoming | HH_story            | HA_story            | Total         | Point Spread      |
| 64725    | Tennis     | 325         | Upcoming | TA_story            | TH_story            | Total         | Point Spread      |
| 64726    | Tennis     | 325         | Upcoming | TH_story            | TA_story            | Total         | Outcome next play |
| 64727    | Basketball | 2           | Upcoming | BA_story            | BH_story            | Total         | Point Spread      |
| 64728    | Basketball | 2           | Upcoming | BH_story            | BA_story            | Total         | Point Spread      |
| 64729    | Soccer     | 33          | Upcoming | SA_story            | SH_story            | Total         | Point Spread      |
| 64730    | Soccer     | 33          | Upcoming | SH_story            | SA_story            | Total         | Point Spread      |

Scenario: upcoming event in the left nav with suspended markets should not allow the user to navigate to relevant coupon page
Meta:
@scenarioName BGSIR_647_NavigateToCoupon_NoMarkets
Given an upcoming event created using below data:
|GameId   |Sport   |League Id    |Status  |Away Team  |Home Team  |AwayTeam NickName    |HomeTeam NickName    |DisplayAwayTeamFirst  |
|<GameId> |<Sport> |<League Id>  |<Status>|<Away Team>|<Home Team>|<Away Team>_<GameId> |<Home Team>_<GameId> |<DisplayAwayTeamFirst>|
When player navigate to any In-Running page
And click on above upcoming event
Then single game page view is not displayed for the selected event

Examples:
| <GameId> | <Sport>    | <League Id> | <Status> | <Away Team>         | <Home Team>         | 
| 64731    | Football   | 5           | Upcoming | FA_story            | FH_story            | 
| 64732    | Football   | 5           | Upcoming | FH_story            | FA_story            | 
| 64733    | Hockey     | 50          | Upcoming | HA_story            | HH_story            | 
| 64734    | Hockey     | 50          | Upcoming | HH_story            | HA_story            | 
| 64735    | Tennis     | 325         | Upcoming | TA_story            | TH_story            | 
| 64736    | Tennis     | 325         | Upcoming | TH_story            | TA_story            | 
| 64737    | Basketball | 2           | Upcoming | BA_story            | BH_story            | 
| 64738    | Basketball | 2           | Upcoming | BH_story            | BA_story            | 
| 64739    | Soccer     | 33          | Upcoming | SA_story            | SH_story            | 
| 64740    | Soccer     | 33          | Upcoming | SH_story            | SA_story            | 
