*** Settings ***
Documentation   Cenários solicitados como avaliação de automação e boas práticas
# Criar um projeto de automação em BDD utilizando o site http://automationpractice.com/index.php efetue:
#cadastro 
#Login Sucesso
#Login Inválido
#Login em Branco.

Resource    ../Resource/TestPractice_web.robot

Suite Setup         Inicia cenario
Suite Teardown      Conclui cenario
Test Teardown       Finaliza teste

# Linha de comando:
# robot -d result --reporttitle "AME - Test Report" --logtitle "AME - Test Report"  -v BROWSER:headlessfirefox test/testpractice.robot

*** Test Case ***
#Para o cenario de cadastro de usuário o ideal seria que ele chamasse uma keyword (rotina) para limpar a base antes, assim ele poderia ser executado com uma massa de testes controlada.
#Infelizmente não é possivel conectar diretamente na base da aplicação para remoção, e nem mesmo remover um usuário cadastrado pela tela da aplicação.Não existe opção para excluir usuário. 
CT001: Cadastrar usuário
    [Tags]      smoke
    [Documentation]     RN01: Deve ser possível cadastrar um usuário em formulário especifico

    Dado que estou na página de cadastro de usuário
    Quando eu efetuo um novo cadastro
    Então o sistema exibe mesagem de boas vindas 

CT002: Efetuar login com sucesso
    [Tags]      smoke
    [Documentation]     RN02: Deve ser possível logar-se na aplicação

    Dado que estou na página de login
    Quando eu efetuo um login válido
    Então o sistema exibe o meu nome na área logada 


#Testes de exceção com passagem de parametros para a mesma keyword que é chamada pelos 3 diferentes cenarios
#CT003 envia dados invalidos para email e login
CT003: Login com dados inválidos
    [Tags]      excecao
    [Documentation]     RN03: O sistema deve validar os dados de login impedindo acesso inválido

    Dado que estou na página de login
    Quando eu efetuo um login com dados inválidos
    ...     wgetgv2@dj94j.com       vtv2ergc
    Então o sistema exibe a mensagem "Authentication failed."

#CT004 não envia email, e envia um password cadastrado
CT004: Login inválido (email em branco)
    [Tags]      excecao
    [Documentation]     RN03: O sistema deve validar os dados de login impedindo acesso inválido
    
    Dado que estou na página de login
    Quando eu efetuo um login com dados inválidos
    ...     ${EMPTY}        ${PASSWORD}
    Então o sistema exibe a mensagem "An email address required."

#CT005 envia email cadastrado, e não envia password
CT005: Login inválido (password em branco)
    [Tags]      excecao
    [Documentation]     RN03: O sistema deve validar os dados de login impedindo acesso inválido

    Dado que estou na página de login
    Quando eu efetuo um login com dados inválidos
    ...     ${EMAIL}        ${EMPTY}
    Então o sistema exibe a mensagem "Password is required."

