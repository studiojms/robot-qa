* Settings *
Documentation   Project base file (everything starts here)

Library     Browser
Library     OperatingSystem

Resource    actions/search.robot
Resource    actions/cart.robot
Resource    actions/order.robot

* Variables *
${DEFAULT_TIMEOUT}      5

* Keywords *

Start Session
    New Browser     chromium
    New Browser     ${browser}    ${headless}
    New Page        http://parodifood.qaninja.academy/
    Get Text        span    contains    Nunca foi tão engraçado pedir comida


### Helpers ###

Get JSON
    [Arguments]     ${filename}

    ${file}         Get File        ${EXECDIR}/resources/fixtures/${filename}
    ${super_var}    Evaluate        json.loads($file)       json

    [return]        ${super_var}