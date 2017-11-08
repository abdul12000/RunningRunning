Meta:
@author rkora
@story BGSIR_547
@functionality leftnav
@testType regression

Narrative:
As a player
I want Upcoming events component to display an indication that there are open markets
so that I am aware of the possibility of navigating to the game coupon

Scenario: BET NOW to be displayed for open markets
Meta:
@scenarioName BGSIR_547_BetNow_OpenMarkets
Given an upcoming event created using below data:
|GameId   |Sport   |League Id    |Status  |AwayTeam NickName    |HomeTeam NickName    |Description  |MarketNameToCreate  |DisplayAwayTeamFirst  |
|<GameId> |<Sport> |<League Id>  |<Status>|<Away Team>_<GameId> |<Home Team>_<GameId> |<Description>|<MarketNameToCreate>|<DisplayAwayTeamFirst>|
When player navigate to any In-Running page
Then text 'BET NOW' should be displayed in the event link bottom row replacing Starts in information


Examples:
|<GameId> |<Sport>   |<League Id>  |<Status>  |<Away Team>           |<Home Team>           |<Description>              |<MarketNameToCreate>|<DisplayAwayTeamFirst> |Message|
|54701    |Football  |5            |Upcoming  |FA_story              |FH_story              |AUTOTEST_Football_story    |Total               |false                  |BET NOW|
|54702    |Football  |5            |Upcoming  |FA_story              |FH_story              |AUTOTEST_Football_story    |Point Spread        |true                   |BET NOW|
|54703    |Tennis    |325          |Upcoming  |TA_story              |TH_story              |AUTOTEST_Tennis_story      |Total               |false                  |BET NOW|
|54704    |Tennis    |325          |Upcoming  |TA_story              |TH_story              |AUTOTEST_Tennis_story      |Match Result        |true                   |BET NOW|
|54705    |Hockey    |50           |Upcoming  |HA_story              |HH_story              |AUTOTEST_Hockey_story      |Moneyline           |true                   |BET NOW|
|54706    |Hockey    |50           |Upcoming  |HA_story              |HH_story              |AUTOTEST_Hockey_story      |Point Spread        |false                  |BET NOW|
|54707    |Basketball|2            |Upcoming  |BA_story              |BH_story              |AUTOTEST_Basketball_story  |Moneyline           |true                   |BET NOW|
|54708    |Basketball|2            |Upcoming  |BA_story              |BH_story              |AUTOTEST_Basketball_story  |Outcome next play   |false                  |BET NOW|
|54709    |Soccer    |33           |Upcoming  |SA_story              |SH_story              |AUTOTEST_Basketball_story  |Total               |true                   |BET NOW|
|54710    |Soccer    |33           |Upcoming  |SA_story              |SH_story              |AUTOTEST_Basketball_story  |Outcome next play   |false                  |BET NOW|

Scenario: BET NOW to be displayed for suspend markets
Meta:
@scenarioName BGSIR_547_BetNow_SuspendedMarkets
Given an upcoming event created using below data:
|GameId   |Sport   |League Id    |Status  |AwayTeam NickName    |HomeTeam NickName    |Description  |MarketNameToCreate  |DisplayAwayTeamFirst  |
|<GameId> |<Sport> |<League Id>  |<Status>|<Away Team>_<GameId> |<Home Team>_<GameId> |<Description>|<MarketNameToCreate>|<DisplayAwayTeamFirst>|
And suspend the market <MarketNameToCreate>
When player navigate to any In-Running page
Then text 'BET NOW' should be displayed in the event link bottom row replacing Starts in information


Examples:
|<GameId> |<Sport>   |<League Id>  |<Status>  |<Away Team>           |<Home Team>           |<Description>             |<MarketNameToCreate>|<DisplayAwayTeamFirst> |Message|
|54711    |Football  |5            |Upcoming  |FA_story              |FH_story              |AUTOTEST_Football_story    |Total               |false                  |BET NOW|
|54712    |Football  |5            |Upcoming  |FA_story              |FH_story              |AUTOTEST_Football_story    |Point Spread        |true                   |BET NOW|
|54713    |Tennis    |325          |Upcoming  |TA_story              |TH_story              |AUTOTEST_Tennis_story      |Total               |false                  |BET NOW|
|54714    |Tennis    |325          |Upcoming  |TA_story              |TH_story              |AUTOTEST_Tennis_story      |Match Result        |true                   |BET NOW|
|54715    |Hockey    |50           |Upcoming  |HA_story              |HH_story              |AUTOTEST_Hockey_story      |Moneyline           |true                   |BET NOW|
|54716    |Hockey    |50           |Upcoming  |HA_story              |HH_story              |AUTOTEST_Hockey_story      |Point Spread         |false                 |BET NOW|
|54717    |Basketball|2            |Upcoming  |BA_story              |BH_story              |AUTOTEST_Basketball_story  |Moneyline           |true                   |BET NOW|
|54718    |Basketball|2            |Upcoming  |BA_story              |BH_story              |AUTOTEST_Basketball_story  |Outcome next play   |false                  |BET NOW|
|54719    |Soccer    |33           |Upcoming  |SA_story              |SH_story              |AUTOTEST_Basketball_story  |Total               |true                   |BET NOW|
|54720    |Soccer    |33           |Upcoming  |SA_story              |SH_story              |AUTOTEST_Basketball_story  |Outcome next play   |false                  |BET NOW|

Scenario: BET NOW to b displayed if event has combination of open and suspended markets
Meta:
@scenarioName BGSIR_547_BetNow_OpenSuspendedMarkets
Given an event is created using below data:
|GameId     |Sport  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description  |DisplayAwayTeamFirst  |
|<GameId>   |<Sport>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|<DisplayAwayTeamFirst>|
And add markets with below details:
|MarketName     |
| <MarketName1> |
| <MarketName2> |
When one of the market <MarketName2> is suspended
And player navigate to any In-Running page
Then text 'BET NOW' should be displayed in the event link bottom row replacing Starts in information


Examples:
|<GameId> |<Sport>   |<League Id>  |<Status>  |<Away Team>           |<Home Team>    |<Description>             |<MarketName1>       |<MarketName2>     |<DisplayAwayTeamFirst> |Message|
|54721    |Football  |5            |Upcoming  |FA_story              |FH_story              |AUTOTEST_Football_story    |Total               |Outcome next play |   false               |BET NOW|
|54722    |Football  |5            |Upcoming  |FA_story              |FH_story              |AUTOTEST_Football_story    |Point Spread        |Total             |   true                |BET NOW|
|54723    |Tennis    |325          |Upcoming  |TA_story              |TH_story              |AUTOTEST_Tennis_story      |Total               |Outcome next play |   false               |BET NOW|
|54724    |Tennis    |325          |Upcoming  |TA_story              |TH_story              |AUTOTEST_Tennis_story      |Match Result        |Total             |   true                |BET NOW|
|54725    |Hockey    |50           |Upcoming  |HA_story              |HH_story              |AUTOTEST_Hockey_story      |Moneyline           |Point Spread      |   true                |BET NOW|
|54726    |Hockey    |50           |Upcoming  |HA_story              |HH_story              |AUTOTEST_Hockey_story      |Point Spread        |Total             |   false               |BET NOW|
|54727    |Basketball|2            |Upcoming  |BA_story              |BH_story              |AUTOTEST_Basketball_story  |Moneyline           |Point Spread      |   true                |BET NOW|
|54728    |Basketball|2            |Upcoming  |BA_story              |BH_story              |AUTOTEST_Basketball_story  |Outcome next play   |Total             |   false               |BET NOW|
|54729    |Soccer    |33           |Upcoming  |SA_story              |SH_story              |AUTOTEST_Basketball_story  |Total               |Outcome next play |   true                |BET NOW|
|54730    |Soccer    |33           |Upcoming  |SA_story              |SH_story              |AUTOTEST_Basketball_story  |Outcome next play   |Moneyline         |   false               |BET NOW|
