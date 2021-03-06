Meta:
@author rkora
@story BGSIR_74
@functionality qbm

Narrative:
As a player
I want to be able to set a default stake selector
so that the stake field will be populated with the selected value in Quick Bet Mode

Lifecycle:
Before:
Given player is at live betting page
When Quick Bet Mode is activated


Scenario: default stake button in default stake selector component
Meta:
@testType smoke
@scenarioName BGSIR_74_CheckDefaultStake
Then the amount selected by default as stake amount is 5

Scenario: Default Stake button Amount selected is displayed in stake field
Meta:
@testtype regression

When player clicks on Amount
Then the <Amount> selected will be displayed in the default stake field

Examples:
|Amount|
|1|
|5|
|10|
|25|
|50|
|100|

Scenario:  Input field in default stake selector component only accepts numbers
Meta:
@testtype smoke

When player introduced amount <Amount> in the default stake input field
Then <Amount> should display the Expected <Behavior>

Examples:
|Amount      |Behavior|
|11          |Accepted|
|BGSIR       |Not Accepted|
|1.5         |Not Accepted|
|46456       |Not Accepted|
|4645        |Accepted    |
|464567      |Not Accepted|



