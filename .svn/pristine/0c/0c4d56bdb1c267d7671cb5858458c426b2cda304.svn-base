Meta:
@story BGSIR_477
@functionality betslip

Narrative:
As a player 
 I want the focus to be in Risk field for the last selection added to the Bet slip 
 so that I can easily introduce the preferred risk amount for the selection that was just added 
					 
Scenario:  Focus is in Risk field for added selection to the Bet slip
Meta:
@scenarioName BGSIR477_FocusInLastSelectionRiskField
@testType regression
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|MarketTitle|MarketNameToCreate|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|<MarketTitle>|<MarketNameToCreate>|
And player loggedIn and navigate to the above event
Then market <<MarketTitle>> should be displayed in coupon area
When player add a <<Selection>> from <<MarketTitle>> to the betslip
Then by default risk field of last added selection should have focus

Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>           |<MarketNameToCreate>|<MarketTitle> |<Selection>    |Username    |Password |
|     |47701      |Football   |Buffalo Bills  |Arizona Cardinals |5          |In Progress|AT_Nick_117        |HT_Nick_117        |AUTOTEST_BGSIR117_Wager |Outcome next play   |Extra Market 1|Pass Completion|2393086     |testing  |
 
