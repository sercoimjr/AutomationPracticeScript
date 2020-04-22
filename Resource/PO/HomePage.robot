*** Settings ***
Library     SeleniumLibrary

*** Keywords ***

Acessar a home page da aplicação

    #Verificação se já está logado. Se estiver, chama keyword para deslogar e continua o teste.
    #É necessario deslogar da aplicação para que os cenários de login possam ser executados 
    ${campo_nome}=      run keyword and return status    
    ...                 element should be visible       xpath=//a[@title='View my customer account']/span
    run keyword if      ${campo_nome}                    Deslogar da aplicação
    
    Go to               ${URL}
    Title should be     My Store 

Navegar para a tela de Cadastro e login 
    Click link                  xpath=//a[@class='login']
    wait until page contains    Authentication  
