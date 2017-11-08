Meta:
@author rkora
@story BGSIR_636
@functionality betslip
@testType regression

Narrative:
As a player
I want selected wager placement mode to be updated and remembered
so that I can place wagers with my preferred mode easily


Scenario: User changes preferred mode from Bet slip to QBM
Given a player loggedIn and navigate to live betting page
When Bet slip mode is activated
And player select QBM as preferred wager placement mode
And logout and login again
Then QBM is activated
And Betslip is not displayed in the right nav

Scenario: User changes preferred mode from QBM to Bet slip
Given a player loggedIn and navigate to live betting page
And QBM is in active state
When player select Bet slip as preferred wager placement mode
And logout and login again
Then Betslip mode is activated and Betslip is displayed in the right nav