Meta:
@story BGSIR_984
@functionality markets
@testType regression

Narrative:
As a BA I want players to be displayed with outcomes in correct order i.e outcome order should be determined by
whether event is created in american or european format so that it aids player while placing bets
					 
Scenario:Outcomes to be displayed in coupon area based on displayAwayTeamFlag
Meta:
@scenarioName BGSIR_984_IncorrectOutcomeOrder
@testType regression
@author Harish
Given user created the event with the  below data
|GameId     |Sport      |Away Team  |Home Team  |League Id  |Status      |AwayTeam NickName   |HomeTeam NickName|
|<GameId>   |<Sport>    |<Away Team>|<Home Team>|<League Id>|<Status>    |<Away Team>_<GameId>|<Home Team>_<GameId>|
And add the markets to the Event: 
|MarketName          |MarketTitle|
|<MarketNameToCreate>|<MarketTitle>|
When player navigates to above event
Then market <<MarketTitle>> should be displayed in coupon area
And outcomes of market '<<MarketTitle>>' should be displayed in correct order based on displayAwayTeam flag

Examples:
|<GameId>   |<Sport>    |<Away Team>|<Home Team>|<MarketNameToCreate>|<MarketTitle>           |<League Id> |<Status>    |
|98405      |Hockey     |Away_Story |Home_Story |Moneyline           |MONEYLINE Hockey        |50          |In Progress |
|98406      |Soccer     |Away_Story |Home_Story |Moneyline           |MONEYLINE Soccer        |33           |In Progress |