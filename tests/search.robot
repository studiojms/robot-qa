* Settings *

Library     Browser

* Test Cases *

Should find only one restaurant when searching by name
    New Browser     chromium    False
    New Page        http://parodifood.qaninja.academy/
    Get Text        span    contains    Nunca foi tão engraçado pedir comida

    Click           text=Estou com fome!
    Get Text        h1 strong   contains    Ta na hora de matar a fome!
    # Sleep           5

    Click           css=.search-link
    Fill Text       css=input[formcontrolname="searchControl"]  Debuger
    
    Wait For Elements State      css=.place-info-box     visible     10
    Get Text        css=.place-info-box     contains    DEBUGER KING

    Get Element Count   css=.place-info-box     equal   1

    Sleep   1
    Take Screenshot