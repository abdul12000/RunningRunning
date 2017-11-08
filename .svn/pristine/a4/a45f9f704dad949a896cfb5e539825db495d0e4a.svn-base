Meta:
@story BGSIR_286
@functionality betslip

Narrative:
As a player 
I want Bet Slip will be able to contain 10 maximum number of selections at one time 
so that I will be able to place 10 bets at once
					 
Scenario: The maximum number of selections that can appear in the Bet Slip at one time will be 10
Meta:
@scenarioName BGSIR_286_MaximumNoOfSelections
@testType regression
@author Harish

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description  |MarketTitle  |MarketNameToCreate  |proptypeid  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|<proptypeid>|
And ensure market <<MarketTitle>> has 11 outcomes
When player navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area
When select 10 selections of market <<MarketTitle>>
Then all 10 selections should be displayed in betslip
When player selects 11th selection of Market '<<MarketTitle>>' to add it to betslip
Then 11th selection should not be added to betslip
And display error message "Maximum Number of Selections in Bet Slip Exceeded." in betslip

Examples:
|<GameId>   |<Sport>    |<MarketTitle> |ColumnLayout         |<proptypeid>|ColumnName   |<Home Team>  |<Away Team>|<League Id>|<Status>    |<Description> |<MarketNameToCreate> |
|28601      |Football   |Extra Market 1|two-columns-prop     |1           |H2Columns    |Home_Story|Away_Story |5          |In Progress |AUTOTEST-BGSIR-104|Outcome next play   |


Scenario: The maximum number of selections that can appear in the Bet Slip at one time will be 10 and error message
displays when players attempts to add 11th selection
Meta:
@scenarioName BGSIR_286_MaximumNoOfSelections_Login
@testType regression
@author Harish

Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description  |MarketTitle  |MarketNameToCreate  |proptypeid  |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|<proptypeid>|
And ensure market <<MarketTitle>> has 11 outcomes
And a player loggedIn and navigate to live betting page
When player navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area
When select 10 selections of market <<MarketTitle>>
Then all 10 selections should be displayed in betslip
When player selects 11th selection of Market '<<MarketTitle>>' to add it to betslip
Then 11th selection should not be added to betslip
And display error message "Maximum Number of Selections in Bet Slip Exceeded." in betslip

Examples:
|<GameId>   |<Sport>    |<MarketTitle> |ColumnLayout         |<proptypeid>|ColumnName   |<Home Team>  |<Away Team>|<League Id>|<Status>    |<Description> |<MarketNameToCreate> |
|28601      |Football   |Extra Market 1|two-columns-prop     |1           |H2Columns    |Home_Story|Away_Story |5          |In Progress |AUTOTEST-BGSIR-104|Outcome next play   |