* Settings *
Documentation   Project base file (everything starts here)

Library     Browser
Library     OperatingSystem

Resource    actions/search.robot
Resource    actions/cart.robot

* Keywords *

Start Session
    New Browser     chromium
    # New Browser     chromium    False
    New Page        http://parodifood.qaninja.academy/
    Get Text        span    contains    Nunca foi tão engraçado pedir comida


### Helpers ###

Get JSON
    [Arguments]     ${filename}

    ${file}         Get File        ${EXECDIR}/resources/fixtures/${filename}
    ${super_var}    Evaluate        json.loads($file)       json

    [return]        ${super_var}