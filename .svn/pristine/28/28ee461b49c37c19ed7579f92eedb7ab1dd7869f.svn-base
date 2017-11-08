Meta:
@story BGSIR_5460
@functionality couponarea

Narrative:
As a player 
I want an informative message to be displayed in the coupon area in single game page view 
so that I am aware the event has finished 
					 
Scenario:  Informative Message is displayed when for a finished live event
Meta:
@scenarioName BGSIR_546_DisplayNoMarketsAvailableMessage_SingleMarket
@author Harish
@testType regression
Given an event is created using below data:
|GameId     |Sport  |MarketNameToCreate  |MarketTitle  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<MarketNameToCreate>|<MarketTitle>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
When player navigates to above event
Then an Informative message '<Message>' is displayed saying markets are not available in coupon area



Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>      |<MarketNameToCreate>|<MarketTitle1>  |Message|
|     |54601      |Football   |Home_Story     |Away_Story     |5              |Closed      |AUTOTEST-BGSIR-546 |Outcome next play   |Extra Market 1  |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|				 
|     |54602      |Soccer     |Algeria        |Anguilla       |33             |Closed      |AUTOTEST-BGSIR-546 |Outcome next play   |Extra Market 1  |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|
|     |54603      |Tennis     |Home_17301     |Away_17301     |325            |Closed      |AUTOTEST-BGSIR-546 |Outcome next play   |Extra Market 1  |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|
|     |54604      |Hockey     |Boston Bruins  |Anaheim Ducks  |50             |Closed      |AUTOTEST-BGSIR-546 |Outcome next play   |Extra Market 1  |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|
|     |54605      |Basketball |Atlanta Hawks  |Denver Nuggets |2              |Closed      |AUTOTEST-BGSIR-546 |Outcome next play   |Extra Market 1  |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|

Scenario:  Informative Message is displayed when for a finished live event with multiple markets
Meta:
@scenarioName BGSIR_546_DisplayNoMarketsAvailableMessage_MultipleMarkets
@testType regression
@author Harish
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
And add markets with below details:
|MarketName    |MarketTitle|
|<MarketName1> |<MarketTitle1>| 
|<MarketName2> |<MarketTitle2>|
When player navigates to above event
Then an Informative message '<Message>' is displayed saying markets are not available in coupon area


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>      |<MarketName1>     |<MarketTitle1>  |<MarketName2>|<MarketTitle2>      |Message|
|     |54601      |Football   |Home_Story     |Away_Story     |5              |Closed      |AUTOTEST-BGSIR-546 |Total             |Total           |Point Spread |Point Spread        |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|				 
|     |54602      |Soccer     |Algeria        |Anguilla       |33             |Closed      |AUTOTEST-BGSIR-546 |Total             |Total           |Point Spread |Point Spread        |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|
|     |54603      |Tennis     |Home_17301     |Away_17301     |325            |Closed      |AUTOTEST-BGSIR-546 |Outcome next play |Extra Market 1  |Match Result |Match Result Winner |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|
|     |54604      |Hockey     |Boston Bruins  |Anaheim Ducks  |50             |Closed      |AUTOTEST-BGSIR-546 |Total             |Total           |Point Spread |Point Spread        |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|
|     |54605      |Basketball |Atlanta Hawks  |Denver Nuggets |2              |Closed      |AUTOTEST-BGSIR-546 |Total             |Total           |Point Spread |Point Spread        |NO MARKETS AVAILABLE... BETTING HAS FINISHED FOR THIS EVENT|