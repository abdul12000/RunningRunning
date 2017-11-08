Meta:
@story BGSIR_623
@functionality qbm

Narrative:
As a player 
I want QBM default stake selector to display amount in user preferences 
so that I am able to place wagers with default stake amount as risk amount

					 
Scenario:  Default stake selector to display amount in user preferences
Meta:
@scenarioName BGSIR_623_HighlightDefaultStakeSelector
@author Harish
@testType regression
Given platform endpoint providing default amount from user preference information
When player logs in and navigate to In-Running page
And Quick Bet Mode is activated
Then Default stake amount in the input will be the amount defined in user preference
