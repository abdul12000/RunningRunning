Meta:
@story BGSIR_331
@functionality leftnav

Narrative:
As a player 
I want to know the number of Live Now events when sport group is collapsed in the left nav 
so that I am aware of the number of events that will start shortly

Scenario:  When a sport is collapsed in Live Now events, there must be an indicator as to how many events are contained in the Sport group e.g. Tennis (14)
Meta:
@scenarioName BGSIR331_DisplayEventsCountInLiveNowSport
@testType regression
@author Harish

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
And player is at live betting page
When sport <<Sport>> is collapsed in live now events component
Then sport <<Sport>> header should display number of events in Live Now

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |
|     |3311       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|
|     |3312       |Soccer     |Algeria        |Anguilla          |33         |In Progress|
|     |3313       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|
|     |3314       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|
|     |3315       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|			 

Scenario: When a sport is expanded event count is not displayed in sport header
Meta:
@scenarioName BGSIR_331_NoEventCountDisplayedWhenSportExpanded
@testType regression
@author Harish
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
And player is at live betting page
Then all sports in Live Now are expanded by default
And event count not displayed in sports headers of Live Now events component
When sport <<Sport>> is collapsed in live now events component
Then sport <<Sport>> header should display number of events in Live Now
When sport <<Sport>> is expanded in live now events component
Then sport <<Sport>> header in live now should not display event count

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |
|     |3311       |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|
|     |3312       |Soccer     |Algeria        |Anguilla          |33         |In Progress|
|     |3313       |Tennis     |Home_17301     |Away_17301        |325        |In Progress|
|     |3314       |Hockey     |Boston Bruins  |Anaheim Ducks     |50         |In Progress|
|     |3315       |Basketball |Atlanta Hawks  |Denver Nuggets    |2          |In Progress|

Scenario: Event count is updated in sport when Live Now event is created
Meta:
@scenarioName BGSIR331_CreateEventUpdateEventCount
@author Harish
@testType regression
@run false
Given events are created using below data:
|GameId |Sport   |Home Team      |Away Team              |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName       |Description|
|33107  |Football  |Buffalo Bills|Arizona Cardinals      |5          |In Progress |AT_Nick            |HT_Nick_<GameId>     |AUTOTEST_Football_SortSportsGroup|
|33102  |Soccer    |Algeria      |Anguilla               |33         |In Progress  |Anguilla_Nick      |Algeria_Nick_<GameId>|AUTOTEST_SortSportsGroups|
|33103  |Tennis    |Home_17301   |Away_17301             |325        |In Progress   |HM_17301_Nick      |AW_17301_Nick_<GameId>|AUTOTEST_BGSIR275_Tennis|
|33104  |Hockey    |Boston Bruins|Anaheim Ducks          |50         |In Progress   |BostonBruins_Nick  |Anaheim_Nick_<GameId> |AUTOTEST_BGSIR275_Hocker|
|33105  |Basketball|Atlanta Hawks|Denver Nuggets         |2          |In Progress   |Atlanta_Nick       |Denver_Nick_<GameId>  |AUTOTEST_BGSIR275_Basketball|
And player is at live betting page
When sport <<Sport>> is collapsed in live now events component
Then sport <<Sport>> header should display number of events in Live Now
When an another event is created using below data:
|GameId   |Sport   |Home Team    |Away Team              |League Id    |Status       |AwayTeam NickName    |HomeTeam NickName     |
|<GameId> |<Sport> |<Home Team>  |<Away Team>            |<League Id>  |<Status>     |<Away Team>_<GameId> |<Home Team>_<GameId>  |
Then event <<GameId>> should appear in Live Now Events component within 1 minute
And event count of sport <<Sport>> in Live now events component should increase
Examples:
|<GameId> |<Sport>   |<Home Team>    |<Away Team>            |<League Id>|<Status>   |
|3310104  |Football  |Buffalo Bills_1  |Arizona Cardinals-1  |5          |In Progress|
|331201   |Soccer     |Algeria        |Anguilla          |33             |In Progress|
|331301   |Tennis     |Home_17301     |Away_17301        |325            |In Progress|
|331401   |Hockey     |Boston Bruins  |Anaheim Ducks     |50             |In Progress|
|331501   |Basketball |Atlanta Hawks  |Denver Nuggets    |2              |In Progress|


Scenario: Event count is updated in sport when Live Now event is changed to upcoming
Meta:
@scenarioName BGSIR331_ChangeEventStatusToUpcoming_UpdateEventCount
@author Harish
@testType regression
@run false
Given events are created using below data:
|GameId |Sport   |Home Team      |Away Team              |League Id  |Status        |AwayTeam NickName  |HomeTeam NickName       |Description|
|33101  |Football  |Buffalo Bills|Arizona Cardinals      |5          |In Progress   |AT_Nick            |HT_Nick_<GameId>     |AUTOTEST_Football_SortSportsGroup|
|33102  |Soccer    |Algeria      |Anguilla               |33         |In Progress   |Anguilla_Nick      |Algeria_Nick_<GameId>|AUTOTEST_SortSportsGroups|
|33103  |Tennis    |Home_17301   |Away_17301             |325        |In Progress   |HM_17301_Nick      |AW_17301_Nick_<GameId>|AUTOTEST_BGSIR275_Tennis|
|33104  |Hockey    |Boston Bruins|Anaheim Ducks          |50         |In Progress   |BostonBruins_Nick  |Anaheim_Nick_<GameId> |AUTOTEST_BGSIR275_Hocker|
|33105  |Basketball|Atlanta Hawks|Denver Nuggets         |2          |In Progress   |Atlanta_Nick       |Denver_Nick_<GameId>  |AUTOTEST_BGSIR275_Basketball|
And player is at live betting page
When sport <<Sport>> is collapsed in live now events component
Then sport <<Sport>> header should display number of events in Live Now
When change event with id <<GameId>> to Upcoming
Then event <<GameId>> should disappear in Live Now Events component within 1 minute
And event count of sport <<Sport>> in Live now events component should decrease
Examples:
|<GameId>|<Sport>   |
|33101   |Football  |
|33102   |Soccer    |
|33103   |Tennis    |
|33104   |Hockey    |
|33105   |Basketball|



