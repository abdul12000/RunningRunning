Meta:
@author rkora
@story BGSIR_123
@functionality leftnav
@testType regression

Narrative:
As a player
I want Upcoming events component to display "Starting Now" when provided event start time has passed
so that I will be informed that the event will start shortly

Scenario: Starting Now is displayed in upcoming event link without markets
Given an upcoming event created using below data:
|GameId   |Sport   |League Id    |Status  |AwayTeam NickName    |HomeTeam NickName    |DisplayAwayTeamFirst  |
|<GameId> |<Sport> |<League Id>  |<Status>|<AwayTeam NickName>  |<HomeTeam NickName>  |<DisplayAwayTeamFirst>|
When an event start time is set in the past
And player navigate to In-Running page
Then above created event should be displayed under sport <<Sport>> in Upcoming Coupons component
And text 'Starting Now' should be displayed in the event link bottom row replacing Starts in information

Examples:
| <GameId> | <Sport>    | <League Id> | <Status> | Minutes | <AwayTeam NickName> | <HomeTeam NickName> | <DisplayAwayTeamFirst> |
| 12301    | Football   | 5           | Upcoming |  -11     | FA_story            | FH_story            | false                  |
| 12302    | Football   | 5           | Upcoming |  -12     | FH_story            | FA_story            | true                   |
| 12303    | Tennis     | 325         | Upcoming | -15     | TA_story            | TH_story            | false                  |
| 12304    | Tennis     | 325         | Upcoming |  -12     | TH_story            | TA_story            | true                   |
| 12305    | Hockey     | 50          | Upcoming | -10     | HA_story            | HH_story            | false                  |
| 12306    | Hockey     | 50          | Upcoming | -10     | HH_story            | HA_story            | true                   |
| 12307    | Basketball | 2           | Upcoming | -12     | BA_story            | BH_story            | false                  |
| 12308    | Basketball | 2           | Upcoming | -10     | BH_story            | BA_story            | true                   |
| 12309    | Soccer     | 33          | Upcoming | -14     | SA_story            | SH_story            | false                  |
| 12310    | Soccer     | 33          | Upcoming | -13     | SH_story            | SA_story            | true                   |

Scenario: Starting Now is displayed in upcoming event link with markets
Meta:
Given an upcoming event created using below data:
|GameId   |Sport   |League Id    |Status  |AwayTeam NickName    |HomeTeam NickName    |DisplayAwayTeamFirst  |
|<GameId> |<Sport> |<League Id>  |<Status>|<AwayTeam NickName>  |<HomeTeam NickName>  |<DisplayAwayTeamFirst>|
And add markets with below details:
|MarketName|
|Total|
|Point Spread|
When an event start time is set in the past
And player navigate to In-Running page
Then above created event should be displayed under sport <<Sport>> in Upcoming Coupons component
And text 'Starting Now' should be displayed in the event link bottom row replacing Starts in information

Examples:
| <GameId> | <Sport>    | <League Id> | <Status> | Minutes | <AwayTeam NickName> | <HomeTeam NickName> | <DisplayAwayTeamFirst> |
| 12311    | Football   | 5           | Upcoming |-11     | FA_story            | FH_story            | false                  |
| 12312    | Football   | 5           | Upcoming |-12     | FH_story            | FA_story            | true                   |
| 12313    | Tennis     | 325         | Upcoming | -15     | TA_story            | TH_story            | false                  |
| 12314    | Tennis     | 325         | Upcoming | -12     | TH_story            | TA_story            | true                   |
| 12315    | Hockey     | 50          | Upcoming | -10     | HA_story            | HH_story            | false                  |
| 12316    | Hockey     | 50          | Upcoming | -10     | HH_story            | HA_story            | true                   |
| 12317    | Basketball | 2           | Upcoming | -12     | BA_story            | BH_story            | false                  |
| 12318    | Basketball | 2           | Upcoming | -10     | BH_story            | BA_story            | true                   |
| 12319    | Soccer     | 33          | Upcoming | -14     | SA_story            | SH_story            | false                  |
| 12320    | Soccer     | 33          | Upcoming |-13     | SH_story            | SA_story            | true                   |