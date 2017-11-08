Narrative:
As a user
I want competition name to be displayed at the top of the Live coupon page
So that I know which competition I am betting on

Meta:
@story LateefTest3_coupon
@Author Lateef
@functionality coupons

Scenario: display competiton name on the Live coupon page
Given user created the event with the  below data
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |Description|MarketNameToCreate|MarketTitle|Handicap|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Description>|<MarketNameToCreate>|<MarketTitle>|<Handicap>|

When player navigates to above event
