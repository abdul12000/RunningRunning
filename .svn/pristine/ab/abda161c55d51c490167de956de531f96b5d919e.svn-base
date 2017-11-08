Meta:
@author rkora
@story BGSIR_545
@functionality qbm

Narrative:
As a user
I want to perform an action
So that I can achieve a business goal

Lifecycle:
Before:
Given player is at live betting page
When Quick Bet Mode is activated

Scenario:  Corresponding button in default amount selector to be highlighted according to entered stake amount
Meta:
@testType smoke2
@scenarioName BGSIR_545_VerifyAmountButtonHighlighted
When player introduced amount <Amount> in the default stake input field
Then <Amount> button is highlighted in the default stake selector component

Examples:
|Amount|
|100|
|5|
|1|
|50|
|10|
|25|

Scenario: Corresponding button in default amount selector to be highlighted according to entered stake amount
Meta:
@testType smoke2
@scenarioName BGSIR_545_VerifyNoButtonsHighlighted
When player introduced amount <Amount> in the default stake input field
Then none of the buttons are highlighted in the default stake selector component

Examples:
|Amount|
|3|
|101|
|53|
|200|
|1000|