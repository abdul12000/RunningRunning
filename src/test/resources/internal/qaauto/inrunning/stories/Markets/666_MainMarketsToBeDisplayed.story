Meta:
@author rkora
@story BGSIR_666
@functionality markets
@testType regression

Narrative:
As a player
I want Live markets to be displayed in the Live coupon
so that I can place wagers on these markets

Scenario:MainMarkets to be displayed
Given user created the event with the  below data
|GameId     |Sport      |MarketNameToCreate  |MarketTitle   |League Id  |Status      |
|<GameId>   |<Sport>    |<MarketNameToCreate>|<MarketTitle> |<League Id>|<Status>    |
When player navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area

Examples:
|<GameId>   |<Sport>    |<MarketNameToCreate>|<MarketTitle>             |<League Id> |<Status>    |
|66601      |Football   |Point Spread        |POINTS SPREAD Football    |  5         |In Progress |
|66602      |Football   |Total               |TOTAL Football            |  5         |In Progress |
|66603      |Football   |Moneyline           |MONEYLINE Football        |  5         |In Progress |
|66604      |Tennis     |Point Spread        |POINTS SPREAD Tennis      |  325       |In Progress |
|66605      |Tennis     |Total               |TOTAL Tennis              |  325       |In Progress |
|66606      |Tennis     |Match Result        |MATCH RESULT Tennis       |  325       |In Progress |
|66607      |Hockey     |Point Spread        |POINTS SPREAD Hockey      |  50        |In Progress |
|66608      |Hockey     |Total               |TOTAL Hockey              |  50        |In Progress |
|66609      |Hockey     |Moneyline           |MONEYLINE Hockey          |  50        |In Progress |
|66610      |Basketball |Point Spread        |POINTS SPREAD Basketball  |  2         |In Progress |
|66611      |Basketball |Total               |TOTAL Basketball          |  2         |In Progress |
|66612      |Basketball |Moneyline           |MONEYLINE Basketball      |  2         |In Progress |
|66613      |Soccer     |Point Spread        |POINTS SPREAD Soccer      |  33        |In Progress |
|66614      |Soccer     |Total               |TOTAL Soccer              |  33        |In Progress |
|66615      |Soccer     |Moneyline           |MONEYLINE Soccer          |  33        |In Progress |