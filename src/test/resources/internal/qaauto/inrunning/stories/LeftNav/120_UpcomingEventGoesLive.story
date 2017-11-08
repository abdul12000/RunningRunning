Meta:
@story BGSIR_120
@functionality leftnav

Narrative:
As a player 
I want Live Now to display upcoming events that go live 
so that I am aware of the start of the event and I am able to place wagers on them
					 
Scenario:  Upcoming event goes live
Meta:
@scenarioName BGSIR_120_UpcomingEventGoesLive
@testType smoke
@author Harish
Given an upcoming event created using below details with current time as start time
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|<Description>|
And player navigate to a Single Game View page of a Live Event <<GameId>>
Then text 'Starting Now' should be displayed in the event link bottom row replacing Starts in information within 1 minute
When update the status of the event from upcoming to live
Then within a minute the event should display in Live now Events component
And it should not be displayed in Upcoming Events Component


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>     |Minutes|
|     |5620901    |Football   |HomeUp         |AwayUp         |5              |Upcoming   |AUTOTEST-BGSIR-562|-10|
