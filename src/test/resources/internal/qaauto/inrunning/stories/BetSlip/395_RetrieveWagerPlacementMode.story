Meta:
@story BGSIR_395
@functionality betslip

Narrative:
As a player 
I want selected wager placement mode to be remembered 
so that I can place wagers with my preferred mode easily

					 
Scenario: Bet slip mode is the preferred mode for a visitor
Meta:
@scenarioName BGSIR_395_BetslipPreferredMode
@author Harish
@testType smoke
Given the /api/bet/preference endpoint providing the wager mode for visitors
And the received betting mode is 'Multi'
When player navigate to any In-Running page
Then Bet slip mode is active (toggle is off) and displayed in right nav
