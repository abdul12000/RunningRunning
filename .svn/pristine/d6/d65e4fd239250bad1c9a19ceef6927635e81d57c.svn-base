Meta:
@story BGSIR_400
@author Harish
@functionality markets

Narrative:
As a player
I want coupons to display up-to-date information
so that I can place my wagers according to the information in the coupon


Scenario:  Market suspension is automatically updated
Meta:
@scenarioName BGSIR400_MarketSuspensionAutoUpdates
@testType regression

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|MarketTitle    |MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When user navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area
When market '<<MarketTitle>>' is suspended
Then market '<<MarketTitle>>' in coupon area should appear suspended automatically

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle>     |
|     |4001       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |4002       |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |4003       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |4004       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |4005       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |


Scenario:  Market suspension is automatically updated after login
Meta:
@scenarioName BGSIR400_MarketSuspensionAutoUpdatesAfterLogin
@testType regression
@author rkora

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description  |MarketTitle|MarketNameToCreate    |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
Then market <<MarketTitle>> should be displayed in coupon area
When market '<<MarketTitle>>' is suspended
Then market '<<MarketTitle>>' in coupon area should appear suspended automatically

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle>     |
|     |40011      |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40022      |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40033      |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40044      |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40055      |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |


Scenario:  Market unsuspension is automatically updated
Meta:
@scenarioName BGSIR400_MarketUnSuspension_AutoUpdates
@testType regression

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When user navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area
When market '<<MarketTitle>>' is suspended
Then market '<<MarketTitle>>' in coupon area should appear suspended automatically
When market '<<MarketTitle>>' is un suspended
Then market '<<MarketTitle>>' should be un suspended automatically


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle>     |
|     |40016      |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40027      |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40038      |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40049      |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40050      |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |

Scenario:  Market unsuspension is automatically updated after login
Meta:
@scenarioName BGSIR400_MarketUnSuspension_AutoUpdatesAfterLogin
@testType regression
@author rkora

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
Then market <<MarketTitle>> should be displayed in coupon area
When market '<<MarketTitle>>' is suspended
Then market '<<MarketTitle>>' in coupon area should appear suspended automatically
When market '<<MarketTitle>>' is un suspended
Then market '<<MarketTitle>>' should be un suspended automatically


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle>     |
|     |40051       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40052       |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40053       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40054       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40055       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
		
Scenario:  Market closure is automatically updated
Meta:
@scenarioName BGSIR400_MarketClosure_AutoUpdate
@testType regression

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName |Description   |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When user navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area
When market '<<MarketTitle>>' is closed
Then market '<<MarketTitle>>' should disappear from coupon area automatically

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle>     |
|     |40061       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40062       |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40063       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40064       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40065       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |

Scenario:  Market closure is automatically updated after login
Meta:
@scenarioName BGSIR400_MarketClosure_AutoUpdateAfterLogin
@testType regression
@author rkora

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName |Description   |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
Then market <<MarketTitle>> should be displayed in coupon area
When market '<<MarketTitle>>' is closed
Then market '<<MarketTitle>>' should disappear from coupon area automatically

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle>     |
|     |40071       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40072       |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40073       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40074       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |
|     |40075       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |

Scenario:  Open Market is automatically updated on in running page
Meta:
@scenarioName BGSIR400_OpenNewMarket_AutoUpdate
@testType regression

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName    |HomeTeam NickName   |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>  |<HomeTeam NickName> |<Description>|<MarketTitle>|<MarketNameToCreate>|
When user navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area
When market '<<MarketTitle>>' is closed
Then market '<<MarketTitle>>' should disappear from coupon area automatically
When add a new market '<<MarketTitle1>>'
Then market '<<MarketTitle1>>' should be displayed in coupon area automatically

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>              |<MarketNameToCreate>|<MarketTitle>     |<MarketTitle1>|
|     |40081       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick          |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |
|     |40082       |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick     |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |
|     |40083       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick    |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |
|     |40084       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick     |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |
|     |40085       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |

Scenario:  Open Market is automatically updated on in running page after login
Meta:
@scenarioName BGSIR400_OpenNewMarket_AutoUpdateAfterLogin
@testType regression
@author rkora

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName    |HomeTeam NickName   |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>  |<HomeTeam NickName> |<Description>|<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
Then market <<MarketTitle>> should be displayed in coupon area
When market '<<MarketTitle>>' is closed
Then market '<<MarketTitle>>' should disappear from coupon area automatically
When add a new market '<<MarketTitle1>>'
Then market '<<MarketTitle1>>' should be displayed in coupon area automatically

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>              |<MarketNameToCreate>|<MarketTitle>     |<MarketTitle1>|
|     |40091       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick          |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |
|     |40092       |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick     |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |
|     |40093       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick    |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |
|     |40094       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick     |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |
|     |40095       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Extra Market4 |

Scenario:  Open Outcome is automatically updated on in running page
Meta:
@scenarioName BGSIR400_OpenCloseOutcome_AutoUpdate
@testType regression

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When user navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area
When selection '<<OutcomeDescriptionToClose>>' of market with title '<<MarketTitle>>' is closed in backend
Then selection '<<OutcomeDescriptionToClose>>' of market with title '<<MarketTitle>>' should no longer be available for selection
When selection '<<OutcomeDescriptionToClose>>' of market with title '<<MarketTitle>>' is opened back in backend
Then selection '<<OutcomeDescriptionToClose>>' of market with title '<<MarketTitle>>' should be available for selection

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle>     |<OutcomeDescriptionToClose>|
|     |40020       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Pass Completion            |
|     |40021       |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Rush                       |
|     |40022       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Turnover                   |
|     |40023       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Pass Incomplete            |
|     |40024       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Turnover                   |


Scenario:  Open Outcome is automatically updated on in running page after login
Meta:
@scenarioName BGSIR400_OpenCloseOutcome_AutoUpdateAfterLogin
@testType regression
@author rkora

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
Then market <<MarketTitle>> should be displayed in coupon area
When selection '<<OutcomeDescriptionToClose>>' of market with title '<<MarketTitle>>' is closed in backend
Then selection '<<OutcomeDescriptionToClose>>' of market with title '<<MarketTitle>>' should no longer be available for selection
When selection '<<OutcomeDescriptionToClose>>' of market with title '<<MarketTitle>>' is opened back in backend
Then selection '<<OutcomeDescriptionToClose>>' of market with title '<<MarketTitle>>' should be available for selection

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle>     |<OutcomeDescriptionToClose>|
|     |40025       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Pass Completion            |
|     |40026       |Soccer     |Algeria        |Anguilla          |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Rush                       |
|     |40027       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Turnover                   |
|     |40028       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Pass Incomplete            |
|     |40029       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR400_AutoUpdates|Outcome next play   |Extra Market 1    |Turnover                   |