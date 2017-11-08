Meta:
@story BGSIR_366
@functionality leftnav

Narrative:
As a player 
I want left nav components will display a message when there are no events available 
so that I am aware of the unavailability of events in Live Client

!--Currently this test will fail as we are not waiting for 15 minutes to see this message

					 
Scenario:  Upcoming events components should display message when there are no events
Meta:
@scenarioName BGSIR366_NoEventsMessageInLiveNowEventsComponent
@author Harish
@testType regression
Given player is at live betting page
And close all live now events if there are any
Then message should be displayed informing that there are no live events available
