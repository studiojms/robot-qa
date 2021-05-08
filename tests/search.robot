* Settings *

Library     Browser

* Test Cases *

Should find only one restaurant when searching by name
    Start Session
    Go To restaurants
    Search by  Debuger
    Restaurant Should be Visible  DEBUGER KING
    Restaurant Count Should be  1

    Sleep   1
    Take Screenshot

Should search for category
    Start Session
    Go To restaurants
    Search by  Cafe
    Restaurant Should be Visible  STARBUGS COFFEE
    Restaurant Count Should be  1

    Take Screenshot

Should find all the restaurants
    Start Session
    Go To restaurants
    Search by  a
    Restaurant Count Should be  5

    Sleep   1
    Take Screenshot

* Keywords *

Start Session
    New Browser     chromium
    # New Browser     chromium    False
    New Page        http://parodifood.qaninja.academy/
    Get Text        span    contains    Nunca foi tão engraçado pedir comida

Go To restaurants
    Click           text=Estou com fome!
    Get Text        h1 strong   contains    Ta na hora de matar a fome!

Search by
    [Arguments]     ${value}
    Click           css=.search-link
    Fill Text       css=input[formcontrolname="searchControl"]  ${value}

Restaurant Should be Visible
    [Arguments]     ${name}
    Wait For Elements State      css=.place-info-box     visible     10
    Get Text        css=.place-info-box     contains    ${name}

Restaurant Count Should be
    [Arguments]     ${count}
    Wait For Elements State      css=.place-info-box     visible     10
    Get Element Count   css=.place-info-box     equal   ${count}