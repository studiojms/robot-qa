* Settings *

Resource        ${EXECDIR}/resources/base.robot

Test Setup      Start Session

Test Teardown   Take Screenshot

* Test Cases *
Should create a new order
    ${order}        Get JSON  order.json

    Go To restaurants
    Choose Restaurant  ${order}

    FOR     ${product}      IN     @{order["products"]}
        Add To Cart             ${product["name"]}
        Should Add To Cart      ${product["name"]}
    END

    Go To Checkout

    Fill Customer Data  ${order["customer"]}

* Keywords *
Go To Checkout
    Click   text=Fechar Pedido

    ${element}      Set Variable    css=.page-header

    Wait For Elements State     ${element}      visible     10
    Get Text                    ${element}      contains    Finalize o seu pedido

Fill Customer Data
    [Arguments]     ${customer}

    Fill Text       css=input[placeholder="Nome"]           ${customer["name"]}
    Fill Text       css=input[placeholder="E-mail"]         ${customer["email"]}
    Fill Text       css=input[placeholder^="Confirmação"]   ${customer["email"]}
    Fill Text       css=input[placeholder="Endereço"]       ${customer["address"]}
    Fill Text       css=input[placeholder="Número"]         ${customer["number"]}
