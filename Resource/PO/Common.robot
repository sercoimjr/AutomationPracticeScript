*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary

*** Keywords ***

Inicia cenario
    Open Browser                about:blank       ${BROWSER}
    Set Window Size             1200              800
    Set Selenium implicit wait  5

    #Keyword que utiliza dados randomicos para geração de massa para novo cadastro
    Gera dados para novo cadastro

#setando as variaveis que utilizam faker para geração de dados
Gera dados para novo cadastro
    ${temp_email}=              FakerLibrary.email
    ${temp_fname}=              FakerLibrary.first_name
    ${temp_lname}=              FakerLibrary.last_name
    Set Global variable         ${FIRST_NAME}       ${temp_fname}
    Set Global variable         ${LAST_NAME}        ${temp_lname}    
    Set Global variable         ${EMAIL}            ${temp_email}   

    #Dados gerados na massa
    Log                         ${FIRST_NAME} 
    Log                         ${LAST_NAME}
    Log                         ${EMAIL} 

Conclui cenario
    Close Browser

#Ao final da execução de cada teste é capturado o print para evidencia, independente do resultado do teste. Por default o robot só captura quando falha
Finaliza teste
    Capture page screenshot