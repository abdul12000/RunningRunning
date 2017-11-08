Meta:
@story BGSIR_117
@author Harish
@functionality qbm
@testType regression

Narrative:
As a player
I want HTML Live client to allow wager placement in QBM
so that I will be able to place wagers quickly by using Quick mode instead of the Bet Slip


Scenario:  Pending Wager
Meta:
@scenarioName BGSIR_117_PendingWager
@testType regression
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
And QBM is activated
When player add a <<Selection>> from <<MarketTitle>> to the betslip
Then pending class is applied to the selection <<Selection>> of market <<MarketTitle>> that has been placed

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle> |<Selection>    |Username    |Password |
|     |1171       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick_117        |HT_Nick_117        |AUTOTEST_BGSIR117_Wager      |Outcome next play   |Extra Market 1|Pass Completion|2393086     |testing  |

Scenario:  Placing a wager on invalid outcome
Meta:
@scenarioName BGSIR_117_UnSuccessfulWager
@testType regression
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
And QBM is activated
When selection '<<Selection>>' of market with title '<<MarketTitle>>' is closed in backend
When player add a <<Selection>> from <<MarketTitle>> to the betslip
Then rejected class is applied to the selection <<Selection>> of market <<MarketTitle>>

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                |<MarketNameToCreate>|<MarketTitle> |<Selection>    |Username    |Password |
|     |1172       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick_117        |HT_Nick_117        |AUTOTEST_BGSIR117_Wager      |Outcome next play   |Extra Market 1|Pass Completion|2393086     |testing  |