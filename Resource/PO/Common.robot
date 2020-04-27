*** Settings ***
Library     SeleniumLibrary

*** Keywords ***

Inicia cenario
    Open Browser                about:blank       ${BROWSER}
    Set Window Size             1200              800
    Set Selenium implicit wait  7

    #Keyword que utiliza dados randomicos para geração de massa para novo cadastro
    #criada no arquivo DataElements.robot
    Gera nova massa de teste

Conclui cenario
    Close Browser

#Ao final da execução de cada teste é capturado o print para evidencia, independente do resultado do teste. Por default o robot só captura quando falha
Finaliza teste
    Capture page screenshot