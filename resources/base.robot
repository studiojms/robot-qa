* Settings *
Documentation   Project base file (everything starts here)

Library     Browser

Resource    actions/search.robot

* Keywords *

Start Session
    New Browser     chromium
    # New Browser     chromium    False
    New Page        http://parodifood.qaninja.academy/
    Get Text        span    contains    Nunca foi tão engraçado pedir comida
