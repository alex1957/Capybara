Feature: As a tester
  I want to test sliders
  and be happy, if it works

  Scenario Outline: Testing sliders with examples data

    Given I'm on a sliders page
    When I set slider Balance to  "<balance>" and Equalizer to  "<slider_1>",  "<slider_2>",  "<slider_3>",  "<slider_4>" ,  "<slider_5>"
    Then I should read data from  Balance "<balance>" and Equalizer  "<slider_1>",  "<slider_2>",  "<slider_3>",  "<slider_4>",  "<slider_5>"

    Examples:
    | balance| slider_1  | slider_2 | slider_3 | slider_4 | slider_5 |
    |  -5    |  -8       |  15      |  -11     |  4       |  20      |
    |  0     |  0        |  0       |  0       |  0       |  0       |
    |  10    |  20       |  20      |  20      |  20      |  20      |
    |  -10   |  -20      | -20      |  -20     | -20      |  -20     |
    |  -4    |  15       |  6       |  -2      | -12      |  -18     |


