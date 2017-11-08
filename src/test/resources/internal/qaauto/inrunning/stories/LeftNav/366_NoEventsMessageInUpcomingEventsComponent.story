Meta:
@story BGSIR_3660
@functionality leftnav

Narrative:
As a player 
I want left nav components will display a message when there are no events available 
so that I am aware of the unavailability of events in Live Client
					 
Scenario:  Upcoming events components should display message when there are no events
Meta:
@scenarioName BGSIR366_NoEventsMessageInUpcomingEventsComponent
@author Harish
@testType regression
Given player is at live betting page
And close events in upcoming events component if there are any
Then message should be displayed informing that there are no upcoming events available
