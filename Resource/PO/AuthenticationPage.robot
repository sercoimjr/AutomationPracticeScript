*** Settings ***
Library             SeleniumLibrary


*** Variable ***
#Informar email e avançar para formulario
${INPUT_EMAIL}      id=email_create
${BTN_CADASTRO}     id=SubmitCreate
${ESPERA_LABEL}     Create an account

#Logar na aplicação
${CAMPO_EMAIL}      id=email
${CAMPO_PASSWORD}   id=passwd 
${BTN_LOGIN}        id=SubmitLogin

#Deslogar da aplicação
${LINK_LOGOUT}      xpath=//a[@class='logout']

#O sistema deve exibir mensagem de erro 
${MSG_EXIBIDA}      xpath=//div[@class='alert alert-danger']/ol/li


*** Keywords ***

Informar email e avançar para formulario
    input text                  ${INPUT_EMAIL}      ${EMAIL}
    click button                ${BTN_CADASTRO}   
    wait until page contains    ${ESPERA_LABEL}  

Logar na aplicação
    [Arguments]     ${email_login}         ${pass_login}
    
    input text      ${CAMPO_EMAIL}         ${email_login}
    input text      ${CAMPO_PASSWORD}      ${pass_login}
    click button    ${BTN_LOGIN}

Deslogar da aplicação
    click link      ${LINK_LOGOUT}

#Verifica se o nome do funcionario é exibido no topo da página. Massa de dados utilizada gerada no arquivo DataElements.robot
Validar login de participante 
    page should contain element             xpath=//a[@title='View my customer account']/span[.='${FIRST_NAME} ${LAST_NAME}']

#Captura a mensagem exibida em tela e a compara com a mensagem especificada no cenario de teste
O sistema deve exibir mensagem de erro 
    [Arguments]             ${mensagem_erro}
    ${mensagem_tela}=       get text            ${MSG_EXIBIDA}
    should be equal         ${mensagem_erro}    ${mensagem_tela}

