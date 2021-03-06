Meta:
@author rkora
@story BGSIR_571
@functionality markets
@testType regression

Narrative:
As a player
I want coupons to display up-to-date information
so that I can place my wagers according to the information in the coupon


Scenario: verify Automatic handicap updates in the Live Coupon
Meta:
@scenarioName BGSIR_571_VerifyAutoUpdateUpdatesLiveCoupon
Given user created the event with the  below data
|GameId     |Sport      |MarketNameToCreate  |MarketTitle   |League Id  |Status      |
|<GameId>   |<Sport>    |<MarketNameToCreate>|<MarketTitle> |<League Id>|<Status>    |
When player navigates to above event
And update the handicap <Handicap> value for market <<MarketNameToCreate>> which has marketTitle <<MarketTitle>>
Then expected handicap values <HomeHandicap> and <AwayHandicap> should be displayed for Market <<MarketTitle>>

Examples:
|<GameId>   |<Sport>    |<MarketNameToCreate>|<MarketTitle>                         |Handicap|HomeHandicap|AwayHandicap |<League Id> |<Status>    |
|57149      |Football   |Point Spread        |EXTRA MARKET POINTS SPREAD Football   |2.5     |    +2½     |  -2½        |   5        |In Progress |
|57150      |Football   |Total               |EXTRA MARKET TOTAL Football           |4.75    |    4¾      |  4¾         |   5        |In Progress |
|57151      |Tennis     |Point Spread        |EXTRA MARKET POINTS SPREAD Tennis     |-2.5    |    -2½     |  +2½        |   325      |In Progress |
|57152      |Tennis     |Total               |EXTRA MARKET TOTAL Tennis             |3.25    |    3¼      |  3¼         |   325      |In Progress |
|57153      |Hockey     |Point Spread        |EXTRA MARKET POINTS SPREAD Hockey     |2.25    |    +2¼     |  -2¼        |   50       |In Progress |
|57154      |Hockey     |Total               |EXTRA MARKET TOTAL Hockey             |3       |    3       |  3          |   50       |In Progress |
|57155      |Basketball |Point Spread        |EXTRA MARKET POINTS SPREAD Basketball |-2.25   |    -2¼     |  +2¼        |   2        |In Progress |
|57156      |Basketball |Total               |EXTRA MARKET TOTAL Basketball         |3       |    3       |  3          |   2        |In Progress |
|57155      |Soccer     |Point Spread        |EXTRA MARKET POINTS SPREAD Soccer     |-6.25   |    -6¼     |  +6¼        |   33       |In Progress |
|57156      |Soccer     |Total               |EXTRA MARKET TOTAL Soccer             |4.75    |    4¾      |  4¾         |   33       |In Progress |

Scenario: verify Automatic handicap updates in the Live Coupon after login

Given user created the event with the  below data
|GameId     |Sport      |MarketNameToCreate  |MarketTitle   |League Id  |Status      |
|<GameId>   |<Sport>    |<MarketNameToCreate>|<MarketTitle> |<League Id>|<Status>    |
And player loggedIn and navigate to the above event
When update the handicap <Handicap> value for market <<MarketNameToCreate>> which has marketTitle <<MarketTitle>>
Then expected handicap values <HomeHandicap> and <AwayHandicap> should be displayed for Market <<MarketTitle>>

Examples:
| <GameId> | <Sport>    | <MarketNameToCreate> | <MarketTitle>                         | Handicap | HomeHandicap | AwayHandicap | <League Id> | <Status>    |
| 57149    | Football   | Point Spread         | EXTRA MARKET POINTS SPREAD Football   | 2.5      | +2½          | -2½          | 5           | In Progress |
| 57150    | Football   | Total                | EXTRA MARKET TOTAL Football           | 4.75     | 4¾           | 4¾           | 5           | In Progress |
| 57151    | Tennis     | Point Spread         | EXTRA MARKET POINTS SPREAD Tennis     | -2.5     | -2½          | +2½          | 325         | In Progress |
| 57152    | Tennis     | Total                | EXTRA MARKET TOTAL Tennis             | 3.25     | 3¼           | 3¼           | 325         | In Progress |
| 57153    | Hockey     | Point Spread         | EXTRA MARKET POINTS SPREAD Hockey     | 2.25     | +2¼          | -2¼          | 50          | In Progress |
| 57154    | Hockey     | Total                | EXTRA MARKET TOTAL Hockey             | 3        | 3            | 3            | 50          | In Progress |
| 57155    | Basketball | Point Spread         | EXTRA MARKET POINTS SPREAD Basketball | -2.25    | -2¼          | +2¼          | 2           | In Progress |
| 57156    | Basketball | Total                | EXTRA MARKET TOTAL Basketball         | 3        | 3            | 3            | 2           | In Progress |
| 57155    | Soccer     | Point Spread         | EXTRA MARKET POINTS SPREAD Soccer     | -6.25    | -6¼          | +6¼          | 33          | In Progress |
| 57156    | Soccer     | Total                | EXTRA MARKET TOTAL Soccer             | 4.75     | 4¾           | 4¾           | 33          | In Progress |