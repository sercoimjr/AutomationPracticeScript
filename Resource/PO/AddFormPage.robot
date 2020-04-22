*** Settings ***
Library     SeleniumLibrary


*** Variable ***

#Preencher formulario de cadastro
${CAMPO_GENERO}         id=uniform-id_gender1
${CAMPO_CUST_FNAME}     id=customer_firstname
${CAMPO_CUST_LNAME}     id=customer_lastname
${CAMPO_FORM_EMAIL}     id=email
${CAMPO_FORM_PASS}      id=passwd
${CAMPO_DIA}            id=days
${OPCAO_DIA}            10
${CAMPO_MES}            id=months
${OPCAO_MES}            5
${CAMPO_ANO}            id=years
${OPCAO_ANO}            1990
${CAMPO_FIRSTNAME}      id=firstname 
${CAMPO_LASTNAME}       id=lastname
${CAMPO_COMPANY}        id=company
${CAMPO_ADDRESS}        id=address1
${CAMPO_CITY}           id=city 
${CAMPO_ESTADO}         id=id_state 
${OPCAO_ESTADO}         44      #Utah
${CAMPO_POSTCODE}       id=postcode
${CAMPO_MOBILE}         id=phone_mobile 
${CAMPO_ALIAS}          id=alias

#Concluir cadastro válido
${BTN_SUBMIT_FORM}      id=submitAccount
${MES_CADASTRO}         Welcome to your account. Here you can manage all of your personal information and orders.


*** Keywords ***
Preencher formulario de cadastro
    #Dados declarados no arquivo DataElements
    click element               ${CAMPO_GENERO}
    input text                  ${CAMPO_CUST_FNAME}         ${FIRST_NAME}
    input text                  ${CAMPO_CUST_LNAME}         ${LAST_NAME}
    input text                  ${CAMPO_FORM_EMAIL}         ${EMAIL}
    input text                  ${CAMPO_FORM_PASS}          ${PASSWORD}

    Select From List by Value   ${CAMPO_DIA}                ${OPCAO_DIA}
    Select From List by Value   ${CAMPO_MES}                ${OPCAO_MES}
    Select From List by Value   ${CAMPO_ANO}                ${OPCAO_ANO} 

    input text                  ${CAMPO_FIRSTNAME}          ${FIRST_NAME}
    input text                  ${CAMPO_LASTNAME}           ${LAST_NAME}
    input text                  ${CAMPO_COMPANY}            ${COMPANY}
    input text                  ${CAMPO_ADDRESS}            ${ADDRESS}
    input text                  ${CAMPO_CITY}               ${CITY}
     
    Select From List by Value   ${CAMPO_ESTADO}             ${OPCAO_ESTADO}

    input text                  ${CAMPO_POSTCODE}           ${POSTCODE}
    input text                  ${CAMPO_MOBILE}             ${PHONE}
    input text                  ${CAMPO_ALIAS}              ${ALIAS}
    
Concluir cadastro válido
    click button                ${BTN_SUBMIT_FORM}
    page should contain         ${MES_CADASTRO}
