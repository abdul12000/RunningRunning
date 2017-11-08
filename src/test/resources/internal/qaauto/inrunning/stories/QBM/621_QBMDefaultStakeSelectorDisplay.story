Meta:
@author rkora
@story BGSIR_621
@functionality qbm
@testType smoke

Narrative:
As a player
I want default stake selector to be displayed when QBM is activated
so that I can use it to select the default amount to place my wagers

Scenario: Default stake selector is displayed when QBM is activated
Given player is at live betting page
When Bet slip mode is activated
And player select QBM as preferred wager placement mode
Then Default stake selector is displayed

Scenario: Default stake selector is displayed when QBM is activated after login
Given a player loggedIn and navigate to live betting page
When Bet slip mode is activated
And player select QBM as preferred wager placement mode
Then Default stake selector is displayed

Scenario: Default stake selector is not displayed when Bet slip mode is activated
Given player is at live betting page
When Quick Bet Mode is activated
And player select Bet slip as preferred wager placement mode
Then Default stake selector is not displayed

Scenario: Default stake selector is not displayed when Bet slip mode is activated after login
Given a player loggedIn and navigate to live betting page
When Quick Bet Mode is activated
And player select Bet slip as preferred wager placement mode
Then Default stake selector is not displayed