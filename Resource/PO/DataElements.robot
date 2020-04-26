*** Settings ***
Library             SeleniumLibrary
Library             FakerLibrary

*** Variable ***

${BROWSER}          chrome
${URL}              http://automationpractice.com/

#Variaveis para cadastro de usuário
#
#Variaveis first_name, last_name e email são setadas no arquivo Common.robot, utilizando biblioteca Faker
#Com isso, não é necessário editar os dados a cada execução, devido a limitação do sistema de não permitir a exclusão de um funcionario cadastrado.
${FIRST_NAME}
${LAST_NAME}
${EMAIL}        

${PASSWORD}         pass123
${COMPANY}          AME Digital
${ADDRESS}          Av Endereço, 12
${CITY}             São Paulo
${POSTCODE}         12345
${PHONE}            11992211211
${ALIAS}            Casa 

*** Keywords ***
    
#setando as variaveis que utilizam faker para geração de dados
Gera nova massa de teste
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