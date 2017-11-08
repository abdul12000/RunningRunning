Meta:
@story BGSIR_91
@functionality leftnav

Narrative:
As a player
 I want events in left nav to be able to be collapsed and expanded by Sport group
 so that I will be able to configure it in order to see the events in the Sports where I am interested for placing my wagers

Scenario: The default for all sport groups in the component will be expanded so all events will be visible
Meta:
@author Harish
@scenarioName BGSIR91_LiveNowAllSportsExpandedByDefault
@testType regression
Given events are created using below data:
|GameId |Sport   |Home Team    |Away Team              |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|1234   |Football  |Buffalo Bills|Arizona Cardinals      |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_Football_SortSportsGroup|
|12546  |Soccer    |Algeria      |Anguilla               |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_SortSportsGroups|
|4356   |Tennis    |Home_17301   |Away_17301             |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR54_Tennis|
|3678   |Hockey    |Boston Bruins|Anaheim Ducks          |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR54_Hocker|
|3677   |Basketball|Atlanta Hawks|Denver Nuggets         |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR54_Basketball|
When player navigate to any In-Running page
Then default for all sport groups in live now component will be expanded so all events will be visible

Scenario: Each sport group in Live Now events must have the ability to be collapsed
Meta:
@author Harish
@scenarioName BGSIR91_SportCanBeCollapsed
@testType regression
Given an event is created using below data:
|GameId   |Sport   |Home Team    |Away Team              |League Id    |Status       |Period  |AwayTeam NickName    |HomeTeam NickName    |Description|
|<GameId> |<Sport> |<Home Team>  |<Away Team>            |<League Id>  |<Status>     |<Period>|<AwayTeam NickName>  |<HomeTeam NickName>  |<Description>|
When player navigate to any In-Running page
And player collapses <<Sport>> sport in live now component
Then sport <<Sport>> group in live now component should be collapsed and all events under it should be hidden

Examples:
|<GameId> |<Sport>   |<Home Team>  |<Away Team>            |<League Id>  |<Status>     |<Period>|<AwayTeam NickName>  |<HomeTeam NickName>  |<Description>|
|1234     |Football  |Buffalo Bills|Arizona Cardinals      |5            |In Progress  |2       |AT_Nick              |HT_Nick              |AUTOTEST_Football_Display|
|12546    |Soccer    |Algeria      |Anguilla               |33           |In Progress  |1       |Anguilla_Nick        |Algeria_Nick         |AUTOTEST_SortSportsGroups|
|4356     |Tennis    |Home_17301   |Away_17301             |325          |In Progress  |1       |HM_17301_Nick        |AW_17301_Nick        |AUTOTEST_BGSIR891_Tennis|
|3678     |Hockey    |Boston Bruins|Anaheim Ducks          |50           |In Progress  |1       |BostonBruins_Nick    |Anaheim_Nick         |AUTOTEST_BGSIR91_Hocker|
|3677     |Basketball|Atlanta Hawks|Denver Nuggets         |2            |In Progress  |2       |Atlanta_Nick         |Denver_Nick          |AUTOTEST_BGSIR91_Basketball|

Scenario: Each sport group in Live Now events must have the ability to be expanded when collapsed
Meta:
@author Harish
@scenarioName BGSIR91_SportCanBeExpandedWhenCollapsed
@testType regression
Given an event is created using below data:
|GameId   |Sport   |Home Team    |Away Team              |League Id    |Status       |Period  |AwayTeam NickName    |HomeTeam NickName    |Description|
|<GameId> |<Sport> |<Home Team>  |<Away Team>            |<League Id>  |<Status>     |<Period>|<AwayTeam NickName>  |<HomeTeam NickName>  |<Description>|
When player navigate to any In-Running page
And player collapses <<Sport>> sport in live now component
Then sport <<Sport>> group in live now component should be collapsed and all events under it should be hidden
When player expands <<Sport>> sport in live now component
Then sport <<Sport>> group in live now component should be expanded and events should be shown

Examples:
|<GameId> |<Sport>   |<Home Team>  |<Away Team>            |<League Id>  |<Status>     |<Period>|<AwayTeam NickName>  |<HomeTeam NickName>  |<Description>|
|1234     |Football  |Buffalo Bills|Arizona Cardinals      |5            |In Progress  |2       |AT_Nick              |HT_Nick              |AUTOTEST_Football_Display|
|12546    |Soccer    |Algeria      |Anguilla               |33           |In Progress  |1       |Anguilla_Nick        |Algeria_Nick         |AUTOTEST_SortSportsGroups|
|4356     |Tennis    |Home_17301   |Away_17301             |325          |In Progress  |1       |HM_17301_Nick        |AW_17301_Nick        |AUTOTEST_BGSIR891_Tennis|
|3678     |Hockey    |Boston Bruins|Anaheim Ducks          |50           |In Progress  |1       |BostonBruins_Nick    |Anaheim_Nick         |AUTOTEST_BGSIR91_Hocker|
|3677     |Basketball|Atlanta Hawks|Denver Nuggets         |2            |In Progress  |2       |Atlanta_Nick         |Denver_Nick          |AUTOTEST_BGSIR91_Basketball|
