*** Settings ***
Library     SeleniumLibrary

*** Keywords ***

Inicia cenario
    Open Browser                about:blank       ${BROWSER}
    Set Window Size             1200              700
    Set Selenium implicit wait  5

Conclui cenario
    Close Browser

Finaliza teste
    Capture page screenshot