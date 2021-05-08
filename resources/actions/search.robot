* Settings *
Documentation   Restaurant Search Helpers

* Variables *
${RESTAURANT_DIV_BOX}   css=div[class="place-info-box"][style="opacity: 1;"]
${PLACE_INFO_BOX}       css=.place-info-box

* Keywords *

Go To restaurants
    Click           text=Estou com fome!
    Get Text        h1 strong   contains    Ta na hora de matar a fome!

Search by
    [Arguments]     ${value}
    Click           css=.search-link
    Fill Text       css=input[formcontrolname="searchControl"]  ${value}

Restaurant Should be Visible
    [Arguments]     ${name}
    Wait For Elements State     ${RESTAURANT_DIV_BOX}     visible     10
    Get Text                    ${PLACE_INFO_BOX}     contains    ${name}

Restaurant Count Should be
    [Arguments]     ${count}
    Wait For Elements State     ${PLACE_INFO_BOX}     visible     10
    Get Element Count           ${PLACE_INFO_BOX}     equal   ${count}