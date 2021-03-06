Meta:
@author rkora
@story BGSIR_103
@functionality markets
@testtype smoke


Narrative:
As a player
I want market titles list to be displayed in the live event coupon area
so that I am aware of the available markets for the selected event where I can place wagers


Scenario: List of Markets for a Live event displayed in the coupon
Meta:
@scenarioName BGSIR_103_DisplayMarketTitles
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|
When add markets with below details:
| MarketName   | MarketTitle    |
| Point Spread | Extra Market 1 |
| Total        | Extra Market 2 |
And player navigates to above event
Then the list of markets of the selected event are displayed in the coupon area

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>  |
|10301      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-97|
