Meta:
@author rkora
@story BGSIR_267
@functionality leftnav
@testType regression

Scenario: Maximum live events to display in Left nav should be 20 
Given player is at live betting page
And get the count of Live events currently displayed
And events are created using below data:
| GameId | Sport      | League Id | Status      | AwayTeam NickName | HomeTeam NickName |
| 26701  | Football   | 5         | In Progress | AT_F_01           | HT_F_01           |
| 26702  | Soccer     | 33        | In Progress | AT_S_02           | HT_S_02           |
| 26703  | Tennis     | 325       | In Progress | AT_T_03           | HT_T_03           |
| 26704  | Hockey     | 50        | In Progress | AT_H_04           | HT_H_05           |
| 26705  | Basketball | 2         | In Progress | AT_B_05           | HT_B_05           |
| 26706  | Football   | 5         | In Progress | AT_F_06           | HT_F_06           |
| 26707  | Soccer     | 33        | In Progress | AT_S_07           | HT_S_07           |
| 26708  | Tennis     | 325       | In Progress | AT_T_08           | HT_T_08           |
| 26709  | Hockey     | 50        | In Progress | AT_H_09           | HT_H_09           |
| 26710  | Basketball | 2         | In Progress | AT_B_10           | HT_B_10           |
| 26711  | Football   | 5         | In Progress | AT_F_11           | HT_F_11           |
| 26712  | Soccer     | 33        | In Progress | AT_S_12           | HT_S_12           |
| 26713  | Tennis     | 325       | In Progress | AT_T_13           | HT_T_13           |
| 26714  | Hockey     | 50        | In Progress | AT_H_14           | HT_H_14           |
| 26715  | Basketball | 2         | In Progress | AT_B_15           | HT_B_15           |
| 26716  | Football   | 5         | In Progress | AT_F_16           | HT_F_16           |
| 26717  | Soccer     | 33        | In Progress | AT_S_17           | HT_S_17           |
| 26718  | Tennis     | 325       | In Progress | AT_T_18           | HT_T_18           |
| 26719  | Hockey     | 50        | In Progress | AT_H_19           | HT_H_19           |
| 26720  | Basketball | 2         | In Progress | AT_B_20           | HT_B_20           |
When player navigate to In-Running page
Then maximum events to be displayed in the live now component should be more than or equal to 20