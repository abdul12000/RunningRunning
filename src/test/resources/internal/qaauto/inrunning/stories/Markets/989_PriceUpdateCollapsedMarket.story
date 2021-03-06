Meta:
@story BGSIR_989
@functionality markets
@testType regression

Narrative:
As a BA I want markets to be in the state when autmospheric updates are received
					 
Scenario:  Collapsed markets in coupon area should be collapsed even after price update
Meta:
@scenarioName BGSIR_989_PriceUpdateCollapseMarket
@testType regression
@author Harish

Given user created an event with below data:
|GameId     |Sport  |Home Team  |Away Team  |League Id  |Status     |AwayTeam NickName   |HomeTeam NickName   |
|<GameId>   |<Sport>|<Home Team>|<Away Team>|<League Id>|<Status>   |<Away Team>_<GameId>|<Home Team>_<GameId>|
And add an extra market using below details:
|MarketTitle     |
|<MarketTitle1>  |
|<MarketTitle2>  |
When player navigates to above event
Then above markets should be displayed in coupon area
When player collapses market '<<MarketTitle1>>'
Then the market '<<MarketTitle1>>' should collapse with all outcomes hidden
When price is updated for one of the outcome <OutcomeDesc> of market '<<MarketTitle2>>' with Win <WinValue> and risk <RiskValue>
Then Expected price <Price> for the outcome <OutcomeDesc> of market <<MarketTitle2>> should be displayed
Then the market '<<MarketTitle1>>' should still be collapsed with all outcomes hidden
Then market '<<MarketTitle2>>' shoudl still be in expand mode


Examples:
|<GameId>   |<Sport>    |<Home Team>    |<Away Team>    |<League Id>    |<Status>    |<MarketTitle1>|<MarketTitle2>|OutcomeDesc    |WinValue|RiskValue|Price|
|98401      |Football   |Home_Story     |Away_Story     |5              |In Progress |Extra Market1 |Extra Market2 |Pass Completion|24      |20       |+120|
 
