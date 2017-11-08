Meta:
@story BGSIR_440
@functionality leftnav

Narrative:
As a player
I want coupon to display all the live markets for the selected event
so that I will be able to place wagers in all the live markets


Scenario: Live coupon should display the markets provided by EP regardless of flag displayInSportsLiveCoupons set to true or false
Meta:
@scenarioName BGSIR440_DisplayMarketWhenIrrespectiveOfFlagSetValue
@author Harish
@testType regression
Given an event is created using below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName  |HomeTeam NickName  |Description|
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<AwayTeam NickName>|<HomeTeam NickName>|<Description>|
And add extra below market with flag displayInSportsLiveCoupons set to false
|MarketTitle     |displayInSportsLiveCoupon|
|<MarketTitle>   |<displayInSportsLiveCoupon>|
When player navigate to any In-Running page
And player navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area

Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<AwayTeam NickName>|<HomeTeam NickName>|<Description>      |<MarketTitle>         |<displayInSportsLiveCoupon>|
|44001       |Football   |Home_Story     |Away_Story     |5              |In Progress |NickAway           |NickHome           |AUTOTEST-BGSIR-102 |Market to be verified|false                      |
|44002       |Football   |Home_Story     |Away_Story     |5              |In Progress |NickAway           |NickHome           |AUTOTEST-BGSIR-102 |Market to be verified|true                       |