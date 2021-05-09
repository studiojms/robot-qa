* Settings *
Documentation       Making order functionality actions

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
    
Select Payment Option
    [Arguments]     ${payment}

    Log     Forma PGTO: ${payment}
    IF          "${payment}" == "Dinheiro"
        Click   xpath=(//mt-radio//label)[1]//div

    ELSE IF     "${payment}" == "Cartão de Débito"
        Click   xpath=(//mt-radio//label)[2]//div
    
    ELSE IF     "${payment}" == "Cartão de Refeição"
        Click   xpath=(//mt-radio//label)[3]//div
    
    ELSE
        Fail    Incorrect Payment Type

    END

Pay Order
    Click   text=Concluir Pedido

Order Should Be Completed
    Wait For Elements State     css=p >> text=Seu pedido foi recebido pelo restaurante.     visible     5