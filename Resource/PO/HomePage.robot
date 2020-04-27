*** Settings ***
Library     SeleniumLibrary

*** Variable ***

#Acessar a home page da aplicação
${USER_LOGADO}          xpath=//a[@class='account']
${TIULO_AUT_PAGINA}     My Store

#Navegar para a tela de Cadastro e login 
${BTN_AUT_LOGIN}        xpath=//a[@class='login']
${LABEL_AUT_LOGIN}      Authentication 


*** Keywords ***

Acessar a home page da aplicação
    #Verificação se já está logado, verificando se o nome do funcionario é apresentado na página. Se estiver, chama keyword para deslogar e continua o teste.
    #É necessario deslogar da aplicação para que os cenários de login possam ser executados 
    ${campo_nome}=    run keyword and return status    
    ...                 element should be visible        ${USER_LOGADO} 
    run keyword if      ${campo_nome}                    Deslogar da aplicação
    
    #navega para a Home
    Go to               ${URL}
    Title should be     ${TIULO_AUT_PAGINA}

Navegar para a tela de Cadastro e login 
    Click link                  ${BTN_AUT_LOGIN} 
    wait until page contains    ${LABEL_AUT_LOGIN} 

