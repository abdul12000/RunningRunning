Meta:
@story BGSIR_106
@functionality couponarea

Narrative:
As a player
I want betting button to be able to support different format prices
so that I will see my preferred format price in the bet buttons in the coupon area


Scenario: verify different odds format is displayed
Meta:
@author Harish
@scenarioName OddsFormat
@testType regression
Given user created an event with below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>_<GameId>|<HomeTeam NickName>_<GameId>|<Description>|
And add an extra market with win and risk same for all outcomes:
|MarketTitle    |Win     |Risk   |
|<MarketTitle>  |<Win>   |<Risk> |
When player navigates to above event
And selects '<OddsFormat>' as odds format
Then price displayed for all outcomes of market <<MarketTitle>> in coupon area should be <OddsDisplayed>

Examples:
| Meta: | <GameId> | <Sport>  | <Home Team> | <Away Team> | <League Id> | <Status>    | <AwayTeam NickName> | <HomeTeam NickName> | <Description>      | <MarketTitle>  | <Win> | <Risk> | OddsFormat | OddsDisplayed |
|       | 10601    | Football | Home        | Away        | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 1 | 1000  | 1      | Fractional | 1000/1        |
|       | 10602    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 1000  | 1      | American   | +100000       |
|       | 10603    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 1000  | 1      | Decimal    | 1001.00       |
|       | 10604    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 1 | 1     | 100    | Fractional | 1/100         |
|       | 10605    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 1     | 100    | American   | -10000        |
|       | 10606    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 1     | 100    | Decimal    | 1.01          |
|       | 10607    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 11    | 4      | American   | +275          |
|       | 10608    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 11    | 4      | Fractional | 11/4          |
|       | 10609    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 11    | 4      | Decimal    | 3.75          |
|       | 10610    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 1     | 1      | American   | EVEN          |
|       | 10611    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 1     | 1      | Fractional | 1/1           |
|       | 10612    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 1     | 1      | Decimal    | 2.00          |
|       | 10613    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 2     | 5      | American   | -250          |
|       | 10614    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 2     | 5      | Fractional | 2/5           |
|       | 10615    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 2     | 5      | Decimal    | 1.40          |
|       | 10616    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 4     | 5      | American   | -125          |
|       | 10617    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 4     | 5      | Fractional | 4/5           |
|       | 10618    | Football | Home_story  | Away_story  | 5           | In Progress | NickAway            | NickHome            | AUTOTEST-BGSIR-106 | Extra Market 2 | 4     | 5      | Decimal    | 1.80          |

