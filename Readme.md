## Script de automação criado para avaliação, utilizando Microsoft VSC, Python e Robotframework.

Não adicionei arquivo gitignore, pois o objetivo é armazenar todos os arquivos, inclusive o relatório gerado.

Site: http://automationpractice.com/

Escopo: Cadastro, login com sucesso (com usuário cadastrado), Login invalido (credenciais invalidas), Login inválido (mantendo um dos campos sem preenchimento)

Relatório gerado pela ferramenta, no diretório _Result_.

O script esta setado para ser executado pelo chrome, porém o browser pode ser alterado diretamente pela linha de comando para execução do script, alterando a variavel _BROWSER_ para ie, chrome, headlessechrome, safari, etc.
EX:

    robot -d result --reporttitle "AME - Test Report" --logtitle "AME - Test Report"  -v BROWSER:headlessfirefox test/testpractice.robot

   Este comando executa a suite de testes testpractice.robot com o browser firefox em headless, armazenando relatorio no diretório Result, e customizando o título do relatório gerado.

Criação de cenarios em Gherkin (BDD).
    1ª camada em abstração Gherkin,
    2ª camada em abordagem descritiva,
    3ª camada usando Page Objects.

Descrevendo cenários de teste dessa forma o relatório gerado pode ser lido por qualquer pessoa, e será facilmente identificado onde uma falha ocorreu. Ajuda bastante também para manutenção de scripts, pois é mais fácil de isolar onde ocorreu o problema.

Ao longo do script eu inseri comentarios para explicar o fluxo ou sobre algum tipo de limitação na aplicação, como por exemplo para a exclusão de um usuário já existente. 
O sistema não permite a exclusão do usuário cadastrado, logo não é possivel criar uma rotina para exclusão do usuário previamente cadastrado noinício dos testes, para nova execução da regressão. 
Neste caso existem duas opções, ou se utiliza uma entrada de dados externa (Data Driven), ou se altera na mão a massa no arquivo _Resource>PO>DataElements.robot_.
Mantive da forma mais simples pois não era o escopo, então será necessario alterar o **email** da massa de testes a cada nova execução.
