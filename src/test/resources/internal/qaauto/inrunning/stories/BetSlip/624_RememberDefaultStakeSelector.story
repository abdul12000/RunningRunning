Meta:
@story BGSIR_624
@functionality betslip


Narrative:
As a player 
I want the default stake amount selected to be remembered while I am logged in 
so that I do not have to change the value for each wager that I place 
					 
Scenario:  Default stake amount is remembered by user session
Meta:
@scenarioName BGSIR_624_RememberDefaultStakeSelector
@author Harish
@testType regression
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |AwayTeam NickName   |HomeTeam NickName   |League Id  |Status     |Description  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<Away Team>_<GameId>|<Home Team>_<GameId>|<League Id>|<Status>   |<Description>|
And a player loggedIn and navigate to live betting page
And QBM is in active state
Then the amount selected by default as stake amount is 5
When player clicks on 10
And QBM is deactivated
Then Betslip mode is activated and Betslip is displayed in the right nav
When QBM is activated
Then amount 10 will be selected as stake
When player clicks on 25
And QBM is deactivated
Then Betslip mode is activated and Betslip is displayed in the right nav
When QBM is activated
Then amount 25 will be selected as stake
When player clicks on 50
And QBM is deactivated
Then Betslip mode is activated and Betslip is displayed in the right nav
When QBM is activated
Then amount 50 will be selected as stake
When player clicks on 100
And QBM is deactivated
Then Betslip mode is activated and Betslip is displayed in the right nav
When QBM is activated
Then amount 100 will be selected as stake
When logout and login again
And player navigates to above event
And QBM is activated
Then the amount selected by default as stake amount is 5


Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |
|62401      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-624|

Scenario:  Default stake amount is remembered by user session
Meta:
@scenarioName BGSIR_624_RememberDefaultStakeSelector_UserEnteredStake
@author Harish
@testType regression
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |AwayTeam NickName   |HomeTeam NickName   |League Id  |Status     |Description  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<Away Team>_<GameId>|<Home Team>_<GameId>|<League Id>|<Status>   |<Description>|
And a player loggedIn and navigate to live betting page
And QBM is in active state
Then the amount selected by default as stake amount is 5
When player enters 11 in input field
And QBM is deactivated
Then Betslip mode is activated and Betslip is displayed in the right nav
When QBM is activated
Then the 11 selected will be displayed in the default stake field
When player enters 3 in input field
And QBM is deactivated
Then Betslip mode is activated and Betslip is displayed in the right nav
When QBM is activated
Then the 3 selected will be displayed in the default stake field
When player enters 29 in input field
And QBM is deactivated
Then Betslip mode is activated and Betslip is displayed in the right nav
When QBM is activated
Then the 29 selected will be displayed in the default stake field
When player enters 101 in input field
And QBM is deactivated
Then Betslip mode is activated and Betslip is displayed in the right nav
When QBM is activated
Then the 101 selected will be displayed in the default stake field



Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<Description>     |
|62402      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-104|