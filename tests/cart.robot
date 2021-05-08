* Settings *

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session

Test Teardown   Take Screenshot

* Test Cases *

Should add one item to the cart
    &{restaurant}           Create Dictionary   restaurant=STARBUGS COFFEE    desc=Nada melhor que um café pra te ajudar a resolver um bug.

    Go To restaurants
    Choose Restaurant   ${restaurant}

    Add To Cart             Starbugs 500 error
    Should Add To Cart      Starbugs 500 error
    Total Cart Should Be    15,60

Should Add 3 items to the cart
    ${car_json}         Get JSON  cart.json

    Go To restaurants
    Choose Restaurant   ${car_json}

    FOR     ${product}      IN     @{car_json["products"]}
        Add To Cart             ${product["name"]}
        Should Add To Cart      ${product["name"]}
    END

    Total Cart Should Be    ${car_json["total"]}

