Meta:
@author rkora
@story BGSIR_897
@functionality betslip
@testType smoke

Narrative:
As a player
I want My Bets to include informative messages
so that I have more information about My Bets functionality


Scenario: Default My Bets message to be displayed after clicking on my bets
Meta:
@sceanrioName mybetsdefaultmessage
Given login to a account where there are no placed bets
When player navigate to In-Running page
And clicks on My bets tab
Then it should display a default message 'Please note: It may take up to 5 minutes for a placed or settled bet to be displayed.'

Scenario: Different messages to be displayed when selecting the dropdowns Allbets,openbets and settled bets
Meta:
@scenarioName allBetsMessage
Given login to a account where there are no placed bets
When player navigate to In-Running page
And clicks on My bets tab
When player select 'All Bets' from the dropdown
Then it should display relevant message 'You have no settled or placed bets in the last 14 days.'

Scenario: Different messages to be displayed when selecting the dropdowns Allbets,openbets and settled bets
Meta:
@scenarioName openBetsMessage
Given login to a account where there are no placed bets
When player navigate to In-Running page
And clicks on My bets tab
When player select 'Open Bets' from the dropdown
Then it should display relevant message 'You have no placed bets in the last 14 days.'

Scenario: Different messages to be displayed when selecting the dropdowns Allbets,openbets and settled bets
Meta:
@scenarioName settledBetsMessage
Given login to a account where there are no placed bets
When player navigate to In-Running page
And clicks on My bets tab
When player select 'Settled Bets' from the dropdown
Then it should display relevant message 'You have no settled bets in the last 14 days.'