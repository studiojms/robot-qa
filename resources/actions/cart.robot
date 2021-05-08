* Settings *
Documentation       Shopping Cart functionality actions



* Keywords *
Add To Cart
    [Arguments]     ${name}

    Click       xpath=//span[text()="${name}"]/..//a[@class="add-to-cart"]

Should Add To Cart
    [Arguments]     ${name}

    Wait For Elements State     css=#cart tr >> text=${name}      visible     5

Total Cart Should Be
    [Arguments]     ${value}

    Log             ${value}
    Get Text        xpath=//th[contains(text(),"Total")]/..//td     contains    ${value}