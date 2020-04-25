*** Settings ***
Resource    ./PO/Common.robot           #arquivo com instruções comum a qq suite/teste
Resource    ./PO/DataElements.robot     #arquivo de dados do cadastro
Resource    ./PO/AddFormPage.robot
Resource    ./PO/AuthenticationPage.robot
Resource    ./PO/HomePage.robot

*** Keywords ***    
Dado que estou na página de cadastro de usuário
    Acessar a home page da aplicação
    Navegar para a tela de Cadastro e login

Quando eu efetuo um novo cadastro
    #utilizando passagem de variavel
    Informar email e avançar para formulario
    Preencher formulario de cadastro

Então o sistema exibe mesagem de boas vindas
    Concluir cadastro válido
 
Então o sistema exibe o meu nome na área logada 
    Validar login de participante

Dado que estou na página de login
    Acessar a home page da aplicação
    Navegar para a tela de Cadastro e login

Quando eu efetuo um login válido
    #Dados gerados para massa, em Common.robot
    Logar na aplicação  #com dados válidos do arquivo de dados
    ...     ${EMAIL}        ${PASSWORD}

Quando eu efetuo um login com dados inválidos
    [Arguments]     ${email_login}      ${pass_login}
    Logar na aplicação
    ...     ${email_login}      ${pass_login}

Então o sistema exibe a mensagem "${mensagem_erro}"
    O sistema deve exibir mensagem de erro 
    ...     ${mensagem_erro}