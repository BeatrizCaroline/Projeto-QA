Feature: Cliente sem cadastro deseja criar uma conta
    @TestCaseKey=QA-T1
    Scenario: Cliente sem cadastro deseja criar uma conta
        
        Given que o cliente está na página inicial do sistema
        When o cliente clica no botão "Criar conta"
        Then o sistema deve redirecionar para a página de cadastro
        When o cliente informa o nome completo "Pessoa da Silva"
        And informa o e-mail "pessoa.silva@email.com"
        And informa a senha "Senha@123"
        And confirma a senha "Senha@123"
        And clica no botão "Cadastrar"
        Then o sistema deve criar a conta com sucesso
        And exibir a mensagem "Conta criada com sucesso"
        And redirecionar para a página inicial com o usuário logado
        When o cliente informa um e-mail já cadastrado "pessoa.silva@email.com"
        And informa os demais dados corretamente
        And clica no botão "Cadastrar"
        Then o sistema não deve criar a conta
        And deve exibir a mensagem "E-mail já cadastrado"
        When o cliente informa senhas que não coincidem "Senha@123" e "Senha@456"
        And clica no botão "Cadastrar"
        Then o sistema deve exibir a mensagem "As senhas não coincidem"
        And não deve permitir o cadastro
        When o cliente clica no botão "Cadastrar" sem preencher os campos obrigatórios
        Then o sistema deve exibir mensagens de validação nos campos obrigatórios
        And não deve permitir o envio do formulário
        When o cliente informa um e-mail em formato inválido "pessoasilva.com"
        And clica no botão "Cadastrar"
        Then o sistema deve exibir a mensagem "Formato de e-mail inválido"
        And não deve realizar o cadastro