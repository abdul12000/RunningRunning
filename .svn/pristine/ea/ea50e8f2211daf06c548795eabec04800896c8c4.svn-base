Meta:
@author rkora
@story BGSIR_619
@testType regression
@functionality betslip
@run false
!-- The below scenario will fail as we cannot still create a bet through automation because of know issue.
!-- Please consult Raghu for details

Narrative:
As a player
I want Bet slip allows me to place wager
so that I can place wagers in Live events


Scenario: Place Wager with bet slip mode

Meta:
@scenarioName BGSIR_619_PlaceWager
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|
And a user logged in with username '<Username>' and password '<Password>'
When user navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
And player introduce the <risk> amount to the <<Selection>>
And clicks on place bet
Then betslip should display wager place message <Wager Placed msg>

Examples:
|<GameId>   |<Sport>     |<Selection>    |risk|Username|Password |Wager Placed Msg                        |<Description>           |<MarketNameToCreate>|<MarketTitle>     |<Home Team>    |<Away Team>    |<League Id>|<Status>    |
|61901      |Football    |Pass Completion|2   |2393086 |testing  |Thank you, your bet(s) have been placed |AUTOTEST-BGSIR_488      |Outcome next play   |Extra Market 1    |Home_story     |Away_story     |5          |In Progress |


