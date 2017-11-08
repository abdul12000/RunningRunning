Meta:
@author rkora
@story BGSIR_627
@functionality qbm
@testType regression

Narrative:
As a player
I want input field of default stake selector to accept a maximum of digits consistent with the maximum risk amount
so that I will be aware of the maximum risk amount that I can use for placing my wagers

Scenario: Maximum amount in input field for default stake should have 4 digits
Meta:
@scenarioName BGSIR_627_VerifyMaxInputFieldParameter
Given player is at live betting page
When Quick Bet Mode is activated
When player introduced amount <Amount> in the default stake input field
Then the input field accept up to 4 numerical digits <Expected Stake>

Examples:
| Amount | Expected Stake |
| 45566  | 4556           |
| 1234   | 1234           |
| 78984  | 7898           |
