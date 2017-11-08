Meta:
@author rkora
@story BGSIR_546
@functionality couponarea
@testType smoke

Narrative:
As a player
I want an informative message to be displayed in the coupon area in single game page view
so that I am aware the event has finished

Scenario: Informative Message is displayed when for a finished live event which has multiple markets
Given user created the event with the  below data
|GameId     |Sport      |League Id  |Status      |
|<GameId>   |<Sport>    |<League Id>|<Status>    |
And add markets with below details:
|MarketName   |MarketTitle   |
|<MarketName1>|<MarketTitle1>|
|<MarketName2>|<MarketTitle2>|
When player navigates to above event
Then the markets which has the below market titles should be displayed in the coupon area
|MarketTitle   |
|<MarketTitle1>|
|<MarketTitle2>|
When event of <<GameId>> is finished
Then an Informative message <Message> should be displayed in the coupon area

Examples:
| <GameId> | <Sport>    | <League Id> | <Status>    | <MarketName1> | <MarketName2> | <MarketTitle1>        | <MarketTitle2>            | Message                                                     |
| 54601    | Football   | 5           | In Progress | Total         | Moneyline     | Football Test Total   | Football Test Moneyline   | No markets available... Betting has finished for this event |
| 54602    | Hockey     | 50          | In Progress | Total         | Moneyline     | Hockey Test Total     | Hockey Test Moneyline     | No markets available... Betting has finished for this event |
| 54603    | Tennis     | 325         | In Progress | Total         | Match Result  | Tennis Test Total     | Tennis Test Match Result  | No markets available... Betting has finished for this event |
| 54604    | Basketball | 2           | In Progress | Total         | Moneyline     | Basketball Test Total | Basketball Test Moneyline | No markets available... Betting has finished for this event |
| 54605    | Soccer     | 33          | In Progress | Total         | Moneyline     | Soccer Test Total     | Soccer Test Moneyline     | No markets available... Betting has finished for this event |

Scenario: Informative Message is displayed when for a finished live event which has a market
Given user created the event with the  below data
|GameId     |Sport      |League Id  |Status      |
|<GameId>   |<Sport>    |<League Id>|<Status>    |
And add markets with below details:
|MarketName   |MarketTitle   |
|<MarketName1>|<MarketTitle1>|
When player navigates to above event
Then the markets which has the below market titles should be displayed in the coupon area
|MarketTitle   |
|<MarketTitle1>|
When event of <<GameId>> is finished
Then an Informative message <Message> should be displayed in the coupon area

Examples:
| <GameId> | <Sport>    | <League Id> | <Status>    | <MarketName1> | <MarketTitle1>        |  Message                                                     |
| 54606    | Football   | 5           | In Progress | Total         | Football Test Total   |  No markets available... Betting has finished for this event |
| 54607    | Hockey     | 50          | In Progress | Total         | Hockey Test Total     |  No markets available... Betting has finished for this event |
| 54608    | Tennis     | 325         | In Progress | Total         | Tennis Test Total     |  No markets available... Betting has finished for this event |
| 54609    | Basketball | 2           | In Progress | Total         | Basketball Test Total |  No markets available... Betting has finished for this event |
| 54610    | Soccer     | 33          | In Progress | Total         | Soccer Test Total     |  No markets available... Betting has finished for this event |

Scenario: Informative Message is displayed for a finished live event
Given user created the event with the  below data
|GameId     |Sport      |League Id  |Status      |
|<GameId>   |<Sport>    |<League Id>|<Status>    |
When player navigates to above event
When event of <<GameId>> is finished
Then an Informative message <Message> should be displayed in the coupon area

Examples:
| <GameId> | <Sport>    | <League Id> | <Status>    | Message                                                     |
| 54611    | Football   | 5           | In Progress | No markets available... Betting has finished for this event |
| 54612    | Hockey     | 50          | In Progress | No markets available... Betting has finished for this event |
| 54613    | Tennis     | 325         | In Progress | No markets available... Betting has finished for this event |
| 54614    | Basketball | 2           | In Progress | No markets available... Betting has finished for this event |
| 54615    | Soccer     | 33          | In Progress | No markets available... Betting has finished for this event |