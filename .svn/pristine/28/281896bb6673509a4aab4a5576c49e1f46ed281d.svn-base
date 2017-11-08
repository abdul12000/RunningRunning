Meta:
@story BGSIR_643
@functionality betslip

Narrative:
As a player 
I want Bet slip to display an informative message in the Bet Slip when it has no selections 
so that I know that I have to add the outcomes to proceed with the wager placement
					 
Scenario:  Message 'Please add selections to your Bet Slip' displayed when there are no selections in betslip
Meta:
@scenarioName BGSIR_643_DisplayAddSelectionsMsg
@testType regression
@author Harish
Given player is at live betting page
When Bet slip mode is activated
Then message 'Please add selections to your Bet Slip' should be displayed

Scenario:  Message 'Please add selections to your Bet Slip' displayed when there are no selections in betslip 
Meta:
@scenarioName BGSIR_643_DisplayAddSelectionsMsg_Login
@testType regression
@author Harish
Given a player loggedIn and navigate to live betting page
When Bet slip mode is activated
Then message 'Please add selections to your Bet Slip' should be displayed

Scenario:  Message to add selections not displayed after a selection is added to betslip
Meta:
@scenarioName BGSIR_643_AddSelectionsMsgNotDisplayedAfterAddingASelection
@testType regression
@author Harish
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName           |HomeTeam NickName           |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>_<GameId>|<HomeTeam NickName>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
When player navigates to above event
And player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
Then message 'Please add selections to your Bet Slip' should not be displayed in betslip
When player removes all bet selections
Then message 'Please add selections to your Bet Slip' should be displayed


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>   |<HomeTeam NickName>       |<Description>    |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |64301      |Football   |Buffalo Bills |Arizona Cardinals  |5          |In Progress|AT_Nick_Buffalo Bills |HT_Nick_Arizona Cardinals |AUTOTEST_BGSIR643|Outcome next play   |Extra Market 1    |Pass Completion|

Scenario:  Message to add selections not displayed after a selection is added to betslip
Meta:
@scenarioName BGSIR_643_AddSelectionsMsgNotDisplayedAfterAddingASelection
@testType regression
@author Harish
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName           |HomeTeam NickName           |Description  |MarketTitle  |MarketNameToCreate  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>_<GameId>|<HomeTeam NickName>_<GameId>|<Description>|<MarketTitle>|<MarketNameToCreate>|
And a player loggedIn and navigate to live betting page
And player navigate to a Single Game View page of a Live Event <<GameId>>
When player add a <<Selection>> from <<MarketTitle>> to the betslip
Then <<Selection>> of <<MarketTitle>> should be displayed in the betslip
Then message 'Please add selections to your Bet Slip' should not be displayed in betslip
When player removes all bet selections
Then message 'Please add selections to your Bet Slip' should be displayed


Examples:
|Meta:|<GameId>   |<Sport>    |<Home Team>    |<Away Team>       |<League Id>|<Status>   |<AwayTeam NickName>   |<HomeTeam NickName>       |<Description>    |<MarketNameToCreate>|<MarketTitle>     |<Selection>    |
|     |64301      |Football   |Buffalo Bills |Arizona Cardinals  |5          |In Progress|AT_Nick_Buffalo Bills |HT_Nick_Arizona Cardinals |AUTOTEST_BGSIR643|Outcome next play   |Extra Market 1    |Pass Completion|

