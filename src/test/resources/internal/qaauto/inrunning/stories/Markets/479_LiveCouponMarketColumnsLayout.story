Meta:
@author rkora
@story BGSIR_479
@linkedStories BGSIR401_BGSIR402_BGSIR4398_BGSIR399
@functionality markets

Narrative:
As a player
I want markets to be displayed with their corresponding layouts in the Live coupon
so that I can easily identify the selections to place wagers


Scenario: verify Columns layout applied to the defined marketTypes
Meta:
@scenarioName BGSIR479_marketColumnLayouts
@testType smoke
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketTitle|MarketNameToCreate|proptypeid|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketTitle>|<MarketNameToCreate>|<proptypeid>|
When player navigates to above event
Then the market which has '<<MarketTitle>>' title should display in <ColumnName> <ColumnLayout> layout

Examples:
|<GameId>   |<Sport>    |<MarketTitle> |ColumnLayout         |<proptypeid>|ColumnName   |<Home Team>  |<Away Team>|<League Id>|<Status>    |<Description> |<MarketNameToCreate> |
|47905      |Football   |Extra Market 1|two-columns-prop     |1           |H2Columns    |Home_Story|Away_Story |5          |In Progress |AUTOTEST-BGSIR-104|Outcome next play   |
|47906      |Football   |Extra Market 2|two-columns-prop     |19          |V2Columns    |Home_Story|Away_Story |5          |In Progress |AUTOTEST-BGSIR-104|Outcome next play   |
|47907      |Football   |Extra Market 2|three-columns-prop   |4           |H3Columns    |Home_Story|Away_Story |5          |In Progress |AUTOTEST-BGSIR-104|Outcome next play   |
|47908      |Football   |Extra Market 2|three-columns-prop   |20          |V3Columns    |Home_Story|Away_Story |5          |In Progress |AUTOTEST-BGSIR-104|Outcome next play   |
|47909      |Soccer     |Extra Market 2|home-draw-away-prop  |10          |CorrectScore |Home_Story|Away_Story |33         |In Progress |AUTOTEST-story    |Moneyline           |
|47910      |Football   |Extra Market 1|three-columns-prop   |17          |TimeSorted   |Home_Story|Away_Story |5          |In Progress |AUTOTEST-story    |Outcome next play   |
|47911      |Football   |Extra Market 1|home-away-prop       |3           |H2Columns-HA |Home_Story|Away_Story |5          |In Progress |AUTOTEST-story    |Moneyline           |






