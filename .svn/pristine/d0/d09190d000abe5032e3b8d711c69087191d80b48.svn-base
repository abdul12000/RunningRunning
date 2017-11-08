Meta:
@author rkora
@story BGSIR_97
@functionality markets
@testType regression
@run false
!-- coloumn layout is also covered in 479_LiveCouponMarketColumnsLayout
!-- Please consult Raghu for detail


Narrative:
As a player
I want Live coupons to display in two columns markets with two betting selections

Scenario: the number of betting selections offered for a market type is two, markets has to be displayed in two columns layout coupon.
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|
When add markets with below details:
| MarketName   | MarketTitle    |
| Point Spread | Extra Market 1 |
And player navigates to above event
Then the list of markets of the selected event are displayed in the coupon area
And the markets should display two columns layout
|MarketTitle   |
|Extra Market 1|

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>   |<Description>  |
|97001      |Football   |Home_Story     |Away_Story     |5              |In Progress |AUTOTEST-BGSIR-103|

