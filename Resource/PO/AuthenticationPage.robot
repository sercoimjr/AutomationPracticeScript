*** Settings ***
Library     SeleniumLibrary

*** Variable ***
#Informar email e avançar para formulario
${INPUT_EMAIL}      id=email_create
${BTN_CADASTRO}     id=SubmitCreate

#Logar na aplicação
${CAMPO_EMAIL}      id=email
${CAMPO_PASSWORD}   id=passwd 
${BTN_LOGIN}        id=SubmitLogin

#Deslogar da aplicação
${LINK_LOGOUT}      xpath=//a[@class='logout']

#Validar login de participante
${CAMPO_LOGADO}     xpath=//a[@title='View my customer account']/span[.='${FIRST_NAME} ${LAST_NAME}']

#O sistema deve exibir mensagem de erro 
${MSG_EXIBIDA}      xpath=//div[@class='alert alert-danger']/ol/li


*** Keywords ***
#Teste para cadastro de participante
Informar email e avançar para formulario
    input text                  ${INPUT_EMAIL}      ${EMAIL}
    click button                ${BTN_CADASTRO}   
    wait until page contains    Create an account

Logar na aplicação
    [Arguments]     ${email_login}         ${pass_login}
    
    input text      ${CAMPO_EMAIL}         ${email_login}
    input text      ${CAMPO_PASSWORD}      ${pass_login}
    click button    ${BTN_LOGIN}

Deslogar da aplicação
    click link      ${LINK_LOGOUT}

Validar login de participante
    page should contain element             ${CAMPO_LOGADO}

O sistema deve exibir mensagem de erro 
    [Arguments]             ${mensagem_erro}
    ${mensagem_tela}=       get text            ${MSG_EXIBIDA}
    should be equal         ${mensagem_erro}    ${mensagem_tela}

