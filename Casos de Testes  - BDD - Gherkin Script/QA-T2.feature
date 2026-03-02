Feature: Funcionalidade de login
    @TestCaseKey=QA-T2
    Scenario: Funcionalidade de login
        
        Given que o usuário está na página de login
        When o usuário informa o e-mail "usuario@email.com"
        And informa a senha "Senha@123"
        And clica no botão "Entrar"
        Then o sistema deve autenticar o usuário com sucesso
        And redirecionar para a página inicial
        And exibir o nome do usuário logado no cabeçalho
        When o usuário informa o e-mail "usuario@email.com"
        And informa uma senha incorreta "senhaErrada"
        And clica no botão "Entrar"
        Then o sistema não deve autenticar o usuário
        And deve exibir a mensagem "E-mail ou senha inválidos"
        And o usuário deve permanecer na página de login
        When o usuário clica no botão "Entrar" sem preencher os campos
        Then o sistema deve exibir mensagens de validação nos campos obrigatórios
        And não deve permitir o envio do formulário
        When o usuário informa o e-mail inválido "usuarioemail.com"
        And informa a senha "Senha@123"
        And clica no botão "Entrar"
        Then o sistema deve exibir a mensagem "Formato de e-mail inválido"
        And não deve realizar a autenticação
        When o usuário realiza 5 tentativas de login com credenciais inválidas
        Then o sistema deve bloquear temporariamente o acesso
        And exibir a mensagem "Conta temporariamente bloqueada. Tente novamente em 30 minutos"