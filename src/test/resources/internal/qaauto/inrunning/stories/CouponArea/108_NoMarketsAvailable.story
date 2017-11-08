Meta:
@story BGSIR_108
@functionality couponarea

Narrative:
As a player 
I want Live Coupon to display a message when there are not available markets in the selected event 
so that I am informed why there are not markets to place wagers
					 
Scenario:   Informative message is displayed in Live Coupon area when navigated to an event directly
Meta:
@scenarioName BGSIR108_NoMarketsAvailable_NavigateToEvent
@author Harish
@testType smoke
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|
When player navigates to above event
Then an Informative message '<Message>' is displayed saying markets are not available in coupon area

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>|<Status>    |<AwayTeam NickName>          |<HomeTeam NickName>        |<Description>      |Message|
|     |10801      |Football   |Home_story     |Away_story     |5          |In Progress |NickAway_<GameId>            |NickHome_<GameId>          |AUTOTEST-BGSIR-108 |This Live event has no lines currently available	|
|     |10802      |Soccer     |Algeria        |Anguilla       |33         |In Progress |Anguilla_Nick_<GameId>       |Algeria_Nick_<GameId>      |AUTOTEST_BGSIR-108 |This Live event has no lines currently available	|
|     |10803      |Tennis     |Home_17301     |Away_17301     |325        |In Progress |HM_17301_Nick_<GameId>       |AW_17301_Nick_<GameId>     |AUTOTEST_BGSIR-108 |This Live event has no lines currently available	|
|     |10804      |Hockey     |Boston Bruins  |Anaheim Ducks  |50         |In Progress |BostonBruins_Nick_<GameId>   |Anaheim_Nick_<GameId>      |AUTOTEST_BGSIR-108 |This Live event has no lines currently available	|
|     |10805      |Basketball |Atlanta Hawks  |Denver Nuggets |2          |In Progress |Atlanta_Nick_Atlanta_<GameId>|Denver_Nick_Denver_<GameId>|AUTOTEST_BGSIR-108 |This Live event has no lines currently available	|

Scenario:   Informative message is displayed in Live Coupon area when select an event
Meta:
@scenarioName BGSIR108_NoMarketsAvailable_SelectEvent
@author Harish
@testType regression
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|
When player navigate to In-Running page
And select above live now event
Then an Informative message '<Message>' is displayed saying markets are not available in coupon area

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>|<Status>    |<AwayTeam NickName>          |<HomeTeam NickName>        |<Description>      |Message|
|     |10801      |Football   |Home_story     |Away_story     |5          |In Progress |NickAway_<GameId>            |NickHome_<GameId>          |AUTOTEST-BGSIR-108 |This Live event has no lines currently available	|
|     |10802      |Soccer     |Algeria        |Anguilla       |33         |In Progress |Anguilla_Nick_<GameId>       |Algeria_Nick_<GameId>      |AUTOTEST_BGSIR-108 |This Live event has no lines currently available	|
|     |10803      |Tennis     |Home_17301     |Away_17301     |325        |In Progress |HM_17301_Nick_<GameId>       |AW_17301_Nick_<GameId>     |AUTOTEST_BGSIR-108 |This Live event has no lines currently available	|
|     |10804      |Hockey     |Boston Bruins  |Anaheim Ducks  |50         |In Progress |BostonBruins_Nick_<GameId>   |Anaheim_Nick_<GameId>      |AUTOTEST_BGSIR-108 |This Live event has no lines currently available	|
|     |10805      |Basketball |Atlanta Hawks  |Denver Nuggets |2          |In Progress |Atlanta_Nick_Atlanta_<GameId>|Denver_Nick_Denver_<GameId>|AUTOTEST_BGSIR-108 |This Live event has no lines currently available	|
