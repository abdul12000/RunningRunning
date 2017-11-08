Meta:
@story BGSIR_271
@functionality leftnav

Narrative:
As a player
I want event name for Live events to be displayed in Live Now event link top row
so that I am aware of the event name


Scenario: US Format Event Name to be displayed in the top row of links in Live now events
Meta:
@author Harish
@testtype smoke
@scenarioName USFormat
Given an event is created in american format using following data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName|Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>
When I navigate to In-Running page
Then Event name in Live Now link will be displayed in the top row of the link as '<<AwayTeam NickName>>@<<HomeTeam NickName>>'

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<AwayTeam NickName>|<HomeTeam NickName>|<Description>                          |
|27101     |Football   |Home_Story     |Away_Story     |5              |In Progress |AWNick             |HTNick             |AUTOTEST-BGSIR-271-Display event name |
|27102       |Basketball |Atlanta Hawks  |Denver Nuggets |2              |In Progress |Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR54_Basketball|


Scenario: European Format Event Name to be displayed in the top row of links in Live now events
Meta:
@author Harish
@testtype smoke
@scenarioName EuropeanFormat

Given an event is created in european format using following data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName|Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>
When I navigate to any In-Running page
Then Event name in Live Now link will be displayed in the top row of the link as '<<HomeTeam NickName>>vs<<AwayTeam NickName>>'

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<AwayTeam NickName>|<HomeTeam NickName>|Team Separator|<Description>                          |
|QA3456     |Football   |Home_Story     |Away_Story     |5              |In Progress |AWEuro             |HTEuro            |vs             |AUTOTEST-BGSIR-271-Display event name |
|3677       |Basketball |Atlanta Hawks  |Denver Nuggets |2              |In Progress |Atlanta_Nick       |Denver_Nick       |vs             |AUTOTEST_BGSIR54_Basketball|