* Settings *

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session

Test Teardown   Take Screenshot

* Test Cases *
Should create a new order paying in cash
    ${order}        Get JSON  order.json

    Go To restaurants
    Choose Restaurant  ${order}

    FOR     ${product}      IN     @{order["products"]}
        Add To Cart             ${product["name"]}
        Should Add To Cart      ${product["name"]}
    END

    Go To Checkout

    Fill Customer Data      ${order["customer"]}
    Select Payment Option   ${order["payment"]}
    Pay Order
    Order Should Be Completed

