Meta:
@story BGSIR_330
@functionality leftnav

Narrative:
As a player 
I want Live Now component in left nav display a list with active Live events 
so that I am aware of the live events where I could place wagers
					 
Scenario:  Events with status 'O', 'H' and 'C' to be displayed in Upcoming events component
Meta:
@scenarioName BGSIR330_DisplayLiveNowEvents
@author Harish
@testType regression
Given events are created using below data:
|GameId |Sport   |Home Team      |Away Team              |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|33001  |Football  |Buffalo Bills|Arizona Cardinals      |5          |In Progress|AT_Nick            |HT_Nick            |AUTOTEST_Football_SortSportsGroup|
|33002  |Soccer    |Algeria      |Anguilla               |33         |In Progress|Anguilla_Nick      |Algeria_Nick       |AUTOTEST_SortSportsGroups|
|33003  |Tennis    |Home_17301   |Away_17301             |325        |In Progress|HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR330_Tennis|
|33004  |Hockey    |Boston Bruins|Anaheim Ducks          |50         |In Progress|BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR330_Hocker|
|33005  |Basketball|Atlanta Hawks|Denver Nuggets         |2          |In Progress|Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR330_Basketball|
When player navigate to In-Running page
Then events with status 'O', 'H' and 'C' found in response of backend call should be displayed in Live Now Events

