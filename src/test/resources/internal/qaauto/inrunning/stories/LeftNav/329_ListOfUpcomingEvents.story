Meta:
@story BGSIR_329
@functionality leftnav

Narrative:
As a player 
I want Upcoming Events component in the left nav display a list with the next Live events
so that I am aware of the upcoming events where I will be able to place wagers
					 
Scenario:  Events with status 'U' to be displayed in Upcoming events component
Meta:
@scenarioName BGSIR329_DisplayUpcomingEvents
@author Harish
@testType regression
Given events are created using below data:
|GameId |Sport   |Home Team      |Away Team              |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|32901  |Football  |Buffalo Bills|Arizona Cardinals      |5          |Upcoming   |AT_Nick            |HT_Nick            |AUTOTEST_Football_SortSportsGroup|
|32902  |Soccer    |Algeria      |Anguilla               |33         |Upcoming   |Anguilla_Nick      |Algeria_Nick       |AUTOTEST_SortSportsGroups|
|32903  |Tennis    |Home_17301   |Away_17301             |325        |Upcoming   |HM_17301_Nick      |AW_17301_Nick      |AUTOTEST_BGSIR275_Tennis|
|32904  |Hockey    |Boston Bruins|Anaheim Ducks          |50         |Upcoming   |BostonBruins_Nick  |Anaheim_Nick       |AUTOTEST_BGSIR275_Hocker|
|32905  |Basketball|Atlanta Hawks|Denver Nuggets         |2          |Upcoming   |Atlanta_Nick       |Denver_Nick        |AUTOTEST_BGSIR275_Basketball|
When player navigate to In-Running page
Then events with status 'U' found in response of backend call should be displayed in Upcoming Events Component

