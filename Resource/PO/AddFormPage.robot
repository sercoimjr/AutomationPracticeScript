*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
Preencher formulario de cadastro
    #Dados declarados no arquivo DataElements
    click element               id=uniform-id_gender1
    input text                  id=customer_firstname        ${FIRST_NAME}
    input text                  id=customer_lastname        ${LAST_NAME}
    input text                  id=email                    ${email}
    input text                  id=passwd                   ${PASSWORD}

    Select From List by Value   id=days                     10
    Select From List by Value   id=months                   5
    Select From List by Value   id=years                    1990

    input text                  id=firstname                ${FIRST_NAME}
    input text                  id=lastname                 ${LAST_NAME}
    input text                  id=company                  ${COMPANY}
    input text                  id=address1                 ${ADDRESS}
    input text                  id=city                     ${CITY}
     
    Select From List by Value   id=id_state                 44      #Utah

    input text                  id=postcode                 ${POSTCODE}
    input text                  id=phone_mobile             ${PHONE}
    input text                  id=alias                    ${ALIAS}
    
Concluir cadastro válido
    click button                id=submitAccount
    page should contain         Welcome to your account. Here you can manage all of your personal information and orders.
