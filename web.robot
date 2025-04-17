*** Settings ***
Library      SeleniumLibrary
Library      OperatingSystem


*** Variables ***
${URL}                https://quality-eagles-front.qacoders.dev.br/login
#${URL}                 https://automacao.qacoders-academy.com.br/login
#${URL_USUARIO}         https://automacao.qacoders-academy.com.br/user?new
${BROWSER}             Chrome
${btn_entrar}          id=login
${button_Entrar}       xpath=//button[text()="Entrar"]
#${button_Entrar}        className=css-1ucues4  


${input_email}         id=email
${input_senha}         input[id=password]
${div_cadastros}       xpath=//span[text()="Cadastros"]

${msg_error}          div[class*=MuiAlert-standard]
${link_esqueci_minha_senhas}     //a[contains(text(), 'Esqueci minha senhas')]
${msg_senha_obrigatoria}        //p[contains(text(), 'A senha é obrigatória')]
${msg_email_obrigatorio}        //p[contains(text(), 'O email é obrigatório')]
#${LOGO_XPATH}      //img[@alt='Qa.CodersAcademy']
# login 
${EMAIL_ID}                      id=email  
${PASSWORD_ID}                   id=password     
${Expected_Text_Slogan}          Formando Profissionais de Qualidade
${link_acesse_aqui}              css:. css-ks2d6a 
${MENSAGEM_ERRO}        xpath=//h1[contains(text(), 'E-mail ou senha informados são inválidos')]
${usuarios_select}         id=Usuários
#${usuarios_select}    //span[text()='Usuários']
#${div_cadastros}      //span[text()='Cadastros']
    
${btn_novoCadastro}    button[id="Novo Cadastro"]                      # botao cadastro interface CADASTRO                      # ID do botão de salvar     # Novo nome para inserir
${SALVAR_NOVO}              id=save    # botao salvar novo usuario
### interface Usuarios
${NOME_USUARIO}     Filipa Gaia       # Novo nome para inserir
${NOME}              id=fullName
${CAMPO_EMAIL}       id=mail
${SENHA}             id=password
${CONFIRM_SENHA}     id=confirmPassword
${SENHA_USUARIO}     Test258@.com
${MSG_ERRO}        //p[contains(@class, 'erro')]
${MSG_SUCESSO}     //p[contains(text(), 'Cadastro realizado com sucesso')]
${PERFIL_ACESSO}     id=accessProfile 
${CPF}               id=cpf
${EMAIL_CADASTRO}   usuario.cadastro@example.com  # Email válido para cadastro
${NOME_VAZIO}       ""  # Nome vazio para teste
${EMAIL_INVALIDO}    usuario.invalido@  # E-mail inválido para teste
${CPF_Usuario}       12345678900  # CPF válido para teste
${MSG_ERRO_NOME}    O campo Nome é obrigatório.
${MSG_ERRO_EMAIL}   E-mail inválido.
# cliente 
${URL_CLIENTE}    https://automacao.qacoders-academy.com.br/client  # Substitua pela URL do seu formulário
${NOME_CLIENTE}               Mendy Metts
${DATA_NASCIMENTO_CLIENTE}     01/01/1990
${EMAIL_CLIENTE}               cliente@example.com
${TELEFONE_CLIENTE}            (11) 91234-5678
${CARGO_CLIENTE}               CARGO DO CLIENTE
${RG_CLIENTE}                  123456789
${CPF_CLIENTE}                 123.456.789-00
${CEP_CLIENTE}                 12345-678
${PAIS_CLIENTE}                BRASIL
${CIDADE_CLIENTE}              SÃO PAULO
${ESTADO_CLIENTE}              SP
${BAIRRO_CLIENTE}              BAIRRO EXEMPLO
${RUA_CLIENTE}                 RUA EXEMPLO
${NUMERO_CLIENTE}              123
${COMPLEMENTO_CLIENTE}         COMPLEMENTO EXEMPLO
${div_Cliente}                 xpath=//span[text()='Cliente']   # cliente apos cadastros

# empresa 
${URL_EMPRESA}    https://automacao.qacoders-academy.com.br/company
${RAZAO_SOCIAL_EMPRESA}    Procyon Esportes
${NOME_FANTASIA_EMPRESA}    Procyon Esportes
${EMAIL_EMPRESA}    empresa@teste.com
${CNPJ_EMPRESA}    12.345.678/0001-90
${TELEFONE_EMPRESA}    (11) 98765-4321
${DESCRICAO_SERVIÇOS}    Descrição dos serviços prestados.
${NOME_RESPONSAVEL}    João da Silva
${CEP_EMPRESA}    01234-567
${PAIS_EMPRESA}    Brasil
${CIDADE_EMPRESA}    São Paulo
${ESTADO_EMPRESA}    SP
${BAIRRO_EMPRESA}    Centro
${RUA_EMPRESA}     Avenida Vinte e Dois de Novembro
${NUMERO_EMPRESA}    123
${COMPLEMENTO_EMPRESA}    Apto 101
${div_Empresa}       xpath=//span[text()='Empresa']
*** Test Cases ***                              

CT01 - Tela de Login Exibida ao Acessar a Aplicação.
    [Documentation]    Verifica se a tela de login é exibida como primeira tela ao acessar a aplicação.
    Open Browser    ${URL}    ${BROWSER}    
    Wait Until Location Is    ${URL}      
    Sleep       05
    Capture Page Screenshot
    Fechar Navegador

CT02 - Login com Sucesso e Redirecionamento à Página de Cadastros.
    [Documentation]    Valida o login com sucesso e o redirecionamento correto para a página de cadastro.
    Open Browser    ${URL}    chrome
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test 
    Sleep  05
    Wait Until Element Is Visible    css=${div_cadastros}   
    Sleep    02  
    Element Should Be Visible        css=${div_cadastros}  
    Capture Element Screenshot       css=${div_cadastros} 
    Fechar Navegador

CT03 - Validar Presença do Campo input E-mail na Tela de Login
    [Documentation]   Verifica se o campo de input para o e-mail está presente e visível na tela de login.
    Open Browser    ${URL}    chrome
    Wait Until Page Contains Element    ${EMAIL_ID}   
    Element Should Be Visible           ${EMAIL_ID}
    Capture Element Screenshot          ${EMAIL_ID}
    Close Browser
 
CT04 - Validar Presença do Campo input Senha na Tela de Login
    [Documentation]   Verifica se o campo de input para senha está presente e visível na tela de login.
    Open Browser    ${URL}    chrome
    Wait Until Page Contains Element    ${PASSWORD_ID}    
    Element Should Be Visible           ${PASSWORD_ID}
    Capture Element Screenshot          ${PASSWORD_ID}
    Close Browser  

CT05 - Validar Presença do Botão "Entrar" na Tela de Login
    [Documentation]   Verifica se o botão "Entrar" está presente e visível na tela de login.  
    Open Browser    ${URL}    ${BROWSER}    
    Wait Until Location Is    ${URL}      
    Sleep  10 
    Wait Until Element Is Visible    css=${btn_entrar}  
    Sleep  2
    Element Should Be Visible        css=${btn_entrar}  
    Element Should Be Enabled        css=${btn_entrar}
    Capture Element Screenshot       css=${btn_entrar}  
    Fechar Navegador
CT06 - Login com Sucesso e Redirecionamento à Página de usuários.
    [Documentation]    Valida login e redirecionamento correto para a página de cadastro.
    Open Browser    ${URL}    ${BROWSER}  
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test 

    Wait Until Element Is Visible    css=${div_cadastros}    timeout=10s
    Click Element                    css=${div_cadastros} 

    Wait Until Element Is Visible    ${usuarios_select}    timeout=10s
    Click Button                     ${usuarios_select}
    Fechar Navegador

CT07 - Cadastro de Novo Usuário
    [Documentation]    Valida o cadastro de um novo usuário 
    Open Browser    ${URL}    ${BROWSER} 
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test 
    Acessar tela de Usuários 
    Wait Until Element Is Visible        ${usuarios_select}    timeout=10
    Click Element                        ${usuarios_select}
    Wait Until Element Is Visible    css=${btn_novoCadastro}    timeout=10s
    Click Element       css=${btn_novoCadastro}
    Capture Page Screenshot

    Input Text    ${NOME}               ${NOME_USUARIO}
    Input Text    ${CAMPO_EMAIL}        ${EMAIL_CADASTRO}
    Input Text    ${SENHA}              ${SENHA_USUARIO}
    Input Text    ${CONFIRM_SENHA}      ${SENHA_USUARIO}
    Input Text    ${CPF}                ${CPF_Usuario}

    Select From List By Value    ${PERFIL_ACESSO}    admin  
    Click Button    ${SALVAR_NOVO}
    Capture Page Screenshot
    Fechar Navegador

CT08 - Validar Campo Nome Vazio
    [Documentation]    Tentar cadastrar um usuário com o campo nome vazio e validar a mensagem de erro.
    Open Browser    ${URL}    ${BROWSER} 
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test 
    Acessar tela de Usuários 
    Wait Until Element Is Visible    ${btn_novoCadastro}    timeout=60
    Click Element    ${btn_novoCadastro}
    Input Text    ${NOME}               ${NOME_VAZIO}
    Input Text    ${CAMPO_EMAIL}        ${EMAIL_CADASTRO}
    Input Text    ${SENHA}              ${SENHA_USUARIO}
    Input Text    ${CONFIRM_SENHA}      ${SENHA_USUARIO}
    Input Text    ${CPF}                ${CPF_Usuario}

    Select From List By Value    ${PERFIL_ACESSO}    admin  
    Click Button    ${SALVAR_NOVO}
    Capture Page Screenshot
    Fechar Navegador

CT09 - Validar Email Inválido
    [Documentation]    Tentar cadastrar um usuário com um e-mail inválido e validar a mensagem de erro.
    Open Browser    ${URL}    ${BROWSER} 
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test 
    Acessar tela de Usuários 
    Wait Until Element Is Visible    ${btn_novoCadastro}    timeout=60
    Click Element    ${btn_novoCadastro}
    Input Text    ${NOME}               ${NOME_USUARIO}
    Input Text    ${CAMPO_EMAIL}        ${EMAIL_INVALIDO}
    Input Text    ${CONFIRM_SENHA}      ${SENHA_USUARIO}
    Input Text    ${SENHA}              ${SENHA_USUARIO}
    Input Text    ${CPF}                ${CPF_Usuario}

    Select From List By Value    ${PERFIL_ACESSO}    admin  
    Click Button    ${SALVAR_NOVO}
    Capture Page Screenshot
    Fechar Navegador
T10 - Cadastrar Novo Cliente
    [Documentation]    Testa o cadastro de um novo cliente com dados válidos.
    Open Browser    ${URL}    ${BROWSER} 
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test 
    Acessar tela de Usuários 
    Wait Until Element Is Visible    ${div_Cliente}    timeout=60
    Click Element    ${div_Cliente}
    Wait Until Element Is Visible    ${btn_novoCadastro}    timeout=60
    Click Element    ${btn_novoCadastro}
    # Definir as variáveis com os dados do cliente
    ${NOME_CLIENTE}    Set Variable    João da Silva
    ${DATA_NASCIMENTO_CLIENTE}    Set Variable    01/01/1990
    ${EMAIL_CLIENTE}    Set Variable    joao.silva@email.com
    ${TELEFONE_CLIENTE}    Set Variable    (11) 91234-5678
    ${CARGO_CLIENTE}    Set Variable    Analista
    ${RG_CLIENTE}    Set Variable    12.345.678-9
    ${CPF_CLIENTE}    Set Variable    123.456.789-09
    ${CEP_CLIENTE}    Set Variable    01234-567
    ${PAIS_CLIENTE}    Set Variable    Brasil
    ${CIDADE_CLIENTE}    Set Variable    São Paulo
    ${ESTADO_CLIENTE}    Set Variable    SP
    ${BAIRRO_CLIENTE}    Set Variable    Centro
    ${RUA_CLIENTE}    Set Variable    Rua das Flores
    ${NUMERO_CLIENTE}    Set Variable    123
    ${COMPLEMENTO_CLIENTE}    Set Variable    Apartamento 45

    # Chamar a keyword para preencher o formulário
    Preencher Formulario de Cliente    ${NOME_CLIENTE}    ${DATA_NASCIMENTO_CLIENTE}    ${EMAIL_CLIENTE}    ${TELEFONE_CLIENTE}    ${CARGO_CLIENTE}    ${RG_CLIENTE}    ${CPF_CLIENTE}    ${CEP_CLIENTE}    ${PAIS_CLIENTE}    ${CIDADE_CLIENTE}    ${ESTADO_CLIENTE}    ${BAIRRO_CLIENTE}    ${RUA_CLIENTE}    ${NUMERO_CLIENTE}    ${COMPLEMENTO_CLIENTE}

    # Clicar no botão Salvar
    Wait Until Element Is Visible    id=save    timeout=20
    Click Button    id=save
    Close Browser
T11 - Validar Mensagens de Erro ao Cadastrar Cliente sem Dados
    [Documentation]    Testa as mensagens de erro quando os campos obrigatórios são deixados em branco.
    Open Browser    ${URL_CLIENTE}    ${BROWSER} 
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test 
    Acessar tela de Usuários 
    Wait Until Element Is Visible    ${div_Cliente}    timeout=60
    Click Element    ${div_Cliente}
    Wait Until Element Is Visible    ${btn_novoCadastro}    timeout=60
    Click Element    ${btn_novoCadastro}

    # Clicar no botão Salvar sem preencher os campos
    Wait Until Element Is Visible    id=save    timeout=20
    Click Button    id=save

    # Verificar mensagens de erro
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo nome completo é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo nome completo é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo data de nascimento é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo data de nascimento é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo email é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo email é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo cargo é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo cargo é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo CEP é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo CEP é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo país é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo país é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo cidade é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo cidade é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo estado é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo estado é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo bairro é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo bairro é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo rua é obrigatório')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo rua é obrigatório')]
    Close Browser

T12 - Validar Mensagens de Erro com Dados Inválidos
    [Documentation]    Testa as mensagens de erro quando dados inválidos são inseridos.
    Open Browser    ${URL_CLIENTE}    ${BROWSER} 
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test 
    Acessar tela de Usuários 
    Wait Until Element Is Visible    ${div_Cliente}    timeout=60
    Click Element    ${div_Cliente}
    Wait Until Element Is Visible    ${btn_novoCadastro}    timeout=60
    Click Element    ${btn_novoCadastro}
    # Preencher o formulário com dados inválidos
    Input Text    id=fullName    12345    # Nome inválido
    Input Text    id=birthDate    12345678    # Data de Nascimento inválida
    Input Text    id=mail    invalid_email    # Email inválido
    Input Text    id=phone    abcdefg    # Telefone inválido
    Input Text    id=cep    abcdefg    # CEP inválido
    Input Text    id=country    12345    # País inválido
    Input Text    id=city    12345    # Cidade inválida
    Input Text    id=state    123    # Estado inválido
    Input Text    id=district    12345    # Bairro inválido
    Input Text    id=street    12345    # Rua inválida
    Input Text    id=number    abcdefg    # Número inválido
    Input Text    id=complement    12345    # Complemento inválido

    # Clicar no botão Salvar
    Wait Until Element Is Visible    id=save    timeout=20
    Click Button    id=save

    # Verificar mensagens de erro
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Email inválido')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), 'Email inválido')]
    
    Wait Until Element Is Visible    xpath=//div[contains(text(), 'Limite de caracteres excedido')]    timeout=20
    Element Should Be Visible    xpath=//div[contains(text(), 'Limite de caracteres excedido')]
    
    Wait Until Element Is Visible    xpath=//div[contains(text(), 'O campo Nome Completo deve conter apenas letras')]    timeout=20
    Element Should Be Visible    xpath=//div[contains(text(), 'O campo Nome Completo deve conter apenas letras')]
    Close Browser

CT13 - Cadastrar Empresa
    [Documentation]    Testa o cadastro de uma nova empresa.
    Open Browser    ${URL_EMPRESA}    chrome
    Maximize Browser Window

    # Preencher o formulário de cadastro
    Input Text    id=companyName    ${RAZAO_SOCIAL_EMPRESA}
    Input Text    id=fantasyName    ${NOME_FANTASIA_EMPRESA}
    Input Text    id=companyMail    ${EMAIL_EMPRESA}
    Input Text    id=cnpj    ${CNPJ_EMPRESA}
    Input Text    id=telephone    ${TELEFONE_EMPRESA}
    Input Text    id=serviceDescription    ${DESCRICAO_SERVIÇOS}
    Input Text    id=responsibleName    ${NOME_RESPONSAVEL}
    Input Text    id=zipCode    ${CEP_EMPRESA}
    Input Text    id=country    ${PAIS_EMPRESA}
    Input Text    id=city    ${CIDADE_EMPRESA}
    Input Text    id=state    ${ESTADO_EMPRESA}
    Input Text    id=district    ${BAIRRO_EMPRESA}
    Input Text    id=street    ${RUA_EMPRESA}
    Input Text    id=number    ${NUMERO_EMPRESA}
    Input Text    id=complement    ${COMPLEMENTO_EMPRESA}
    Click Button    id=save

CT14 - Cadastrar Empresa Sem Dados
    [Documentation]    Testa o cadastro de uma nova empresa sem preencher os campos obrigatórios.
    Open Browser    ${URL_EMPRESA}    chrome
    Maximize Browser Window
    Click Button    id=save

    # Verificar se as mensagens de erro são exibidas
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo razão social é obrigatório')]    timeout=10
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo razão social é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo nome fantasia é obrigatório')]    timeout=10
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo nome fantasia é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo email é obrigatório')]    timeout=10
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo email é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo CNPJ é obrigatório')]    timeout=10
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo CNPJ é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo telefone é obrigatório')]    timeout=10
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo telefone é obrigatório')]
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'O campo nome do responsável é obrigatório')]    timeout=10
    Element Should Be Visible    xpath=//p[contains(text(), 'O campo nome do responsável é obrigatório')]
    Close Browser

*** Keywords *** 
Realizar Login 
    [Documentation]     Keyword usada para realizar login 2 orgumentos [email - senha]
    [Arguments]      ${email}     ${senha}
    Abrir Navegador 
    Input text        css=${input_email}    ${email}
    Input text        css=${input_senha}    ${senha}
    Click Button      css=${btn_entrar}

Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}    
    Maximize Browser Window
Fechar Navegador 
    Close Browser

Acessar tela de Usuários
    Wait Until Element Is Visible       css=.css-11z55jn              timeout=50s
    Capture Page Screenshot
    Click Element                       css=.css-11z55jn
    Wait Until Element Is Visible       locator=${usuarios_select}    timeout=50s
    Capture Page Screenshot
    Click Element                       locator=${usuarios_select}
    Sleep    2
    Capture Page Screenshot
    ${url_atual}=                    Get Location
    Should Be Equal                  ${url_atual}    https://automacao.qacoders-academy.com.br/user
                                                

Acessar tela de Cadastro de Usuarios
    Wait Until Element Is Visible      locator=${usuarios_select}    timeout=50s            
    Click Element                      locator=${usuarios_select}  
    Wait Until Element Is Visible      locator=${btn_novoCadastro}
    Click Button                       locator=${btn_novoCadastro}

    Wait Until Element Is Visible    ${NOME}    timeout=20s
    Capture Page Screenshot  # Captura da tela após o clique

    ${url_atual}=                    Get Location
    Should Be Equal                  ${url_atual}    https://automacao.qacoders-academy.com.br/user
     
 Preencher Formulario de Cadastro
    [Documentation]    Preenche o formulário de cadastro com os dados do usuário.
    Wait Until Element Is Visible    id=fullName    timeout=20
    Input Text    id=fullName    ${NOME_USUARIO}
    
    Wait Until Element Is Visible    id=mail    timeout=20
    Input Text    id=mail    ${EMAIL_CADASTRO}
    
    Wait Until Element Is Visible    id=accessProfile    timeout=20
    Input Text    id=accessProfile    ${PERFIL_ACESSO}
    
    Wait Until Element Is Visible    id=cpf    timeout=20
    Input Text    id=cpf    ${CPF}
    
    Wait Until Element Is Visible    id=password    timeout=20
    Input Text    id=password    ${SENHA}
    
    Wait Until Element Is Visible    id=confirmPassword    timeout=20
    Input Text    id=confirmPassword    ${CONFIRM_SENHA}

Clicar Botao Salvar
    [Documentation]    Clica no botão "Salvar Novo" para finalizar o cadastro.
    Wait Until Element Is Visible    id=save    timeout=20
    Click Element    id=save

Verificar Cadastro Sucesso
    [Documentation]    Verifica se o cadastro foi realizado com sucesso.
    Wait Until Element Is Visible    //p[contains(text(), 'Cadastro realizado com sucesso')]    timeout=20
    Element Should Contain    //p[contains(text(), 'Cadastro realizado com sucesso')]    ${MSG_SUCESSO}   

Preencher Formulario de Cliente
    [Documentation]    Preenche o formulário de cadastro com os dados do cliente.
    [Arguments]    ${NOME_CLIENTE}    ${DATA_NASCIMENTO_CLIENTE}    ${EMAIL_CLIENTE}    ${TELEFONE_CLIENTE}    ${CARGO_CLIENTE}    ${RG_CLIENTE}    ${CPF_CLIENTE}    ${CEP_CLIENTE}    ${PAIS_CLIENTE}    ${CIDADE_CLIENTE}    ${ESTADO_CLIENTE}    ${BAIRRO_CLIENTE}    ${RUA_CLIENTE}    ${NUMERO_CLIENTE}    ${COMPLEMENTO_CLIENTE}
    
    Wait Until Element Is Visible    id=fullName    timeout=20
    Input Text    id=fullName    ${NOME_CLIENTE}
    
    Wait Until Element Is Visible    id=birthDate    timeout=20
    Input Text    id=birthDate    ${DATA_NASCIMENTO_CLIENTE}
    
    Wait Until Element Is Visible    id=mail    timeout=20
    Input Text    id=mail    ${EMAIL_CLIENTE}
    
    Wait Until Element Is Visible    id=phone    timeout=20
    Input Text    id=phone    ${TELEFONE_CLIENTE}
    
    Wait Until Element Is Visible    id=currentRole    timeout=20
    Input Text    id=currentRole    ${CARGO_CLIENTE}
    
    Wait Until Element Is Visible    id=rg    timeout=20
    Input Text    id=rg    ${RG_CLIENTE}

    Wait Until Element Is Visible    id=cpf    timeout=20
    Input Text    id=cpf    ${CPF_CLIENTE}

    Wait Until Element Is Visible    id=zipCode    timeout=20
    Input Text    id=zipCode    ${CEP_CLIENTE}

    Wait Until Element Is Visible    id=country    timeout=20
    Input Text    id=country    ${PAIS_CLIENTE}

    Wait Until Element Is Visible    id=city    timeout=20
    Input Text    id=city    ${CIDADE_CLIENTE}

    Wait Until Element Is Visible    id=state    timeout=20
    Input Text    id=state    ${ESTADO_CLIENTE}

    Wait Until Element Is Visible    id=district    timeout=20
    Input Text    id=district    ${BAIRRO_CLIENTE}

    Wait Until Element Is Visible    id=street    timeout=20
    Input Text    id=street    ${RUA_CLIENTE}

    Wait Until Element Is Visible    id=number    timeout=20
    Input Text    id=number    ${NUMERO_CLIENTE}

    Wait Until Element Is Visible    id=complement    timeout=20
    Input Text    id=complement    ${COMPLEMENTO_CLIENTE}


