*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${CAMPO_LOGADO}     xpath=//a[@title='View my customer account']/span[.='${FIRST_NAME} ${LAST_NAME}']

*** Keywords ***
#Teste para cadastro de participante
Informar email e avançar para formulario
    #[Setup]     criar rotina para limpar base antes do teste
    input text                  id=email_create      ${email}
    click button                id=SubmitCreate
    wait until page contains    Create an account
    set test variable           ${EMAIL}

#Testes de login de participante 
# Logar na aplicação com dados válidos
#     input text      id=email        ${EMAIL}
#     input text      id=passwd       ${PASSWORD}
#     click button    id=SubmitLogin

Logar na aplicação
    [Arguments]     ${email_login}  ${pass_login}
    
    input text      id=email        ${email_login}
    input text      id=passwd       ${pass_login}
    click button    id=SubmitLogin

Deslogar da aplicação
    click link      xpath=//a[@class='logout']

Validar login de participante
    page should contain element    ${CAMPO_LOGADO}

O sistema deve exibir mensagem de erro 
    [Arguments]             ${mensagem_erro}
    ${mensagem_tela}=       get text            xpath=//div[@class='alert alert-danger']/ol/li
    should be equal         ${mensagem_erro}    ${mensagem_tela}

