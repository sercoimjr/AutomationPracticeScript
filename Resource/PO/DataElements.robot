*** Settings ***
Library           SeleniumLibrary

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