* Settings *
Documentation       Shopping Cart functionality actions



* Keywords *
Choose Restaurant
    [Arguments]     ${super_var}

    Click                       text=${super_var["restaurant"]}
    Wait For Elements State     css=#detail     visible     10
    Get Text                    css=#detail     contains        ${super_var["desc"]}

Add To Cart
    [Arguments]     ${name}

    Click       xpath=//span[text()="${name}"]/..//a[@class="add-to-cart"]

Should Add To Cart
    [Arguments]     ${name}

    Wait For Elements State     css=#cart tr >> text=${name}      visible     5

Total Cart Should Be
    [Arguments]     ${value}

    Get Text        xpath=//th[contains(text(),"Total")]/..//td     contains    ${value}