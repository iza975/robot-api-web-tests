
*** Settings ***

Library    SeleniumLibrary

*** Variables ***
# --- URLS ---
${URl}              https://quality-eagles-front.qacoders.dev.br/login
${URL_CADASTROS}    https://automacao.qacoders-academy.com.br/user?new
${URL_EMPRESA}      https://automacao.qacoders-academy.com.br/company
${URL_CLIENTE}      https://automacao.qacoders-academy.com.br/client
${BROWSER}          Chrome
# --- LOGIN ---
${input_email}         id=email
${input_senha}         id=password
#${btn_entrar}          id=login
${button_entrar}       xpath=//button[contains(text(), "Entrar")]
${div_cadastros}       xpath=//span[text()="Cadastros"]
${usuarios_select}     xpath=//span[text()="Usuários"]
# --- USUÁRIO ---
${NOME}             id=fullName
${NOME_USUARIO}     Felipa Gaia
${CAMPO_EMAIL}      id=mail
${CPF}              id=cpf
${PERFIL_ACESSO}    id=accessProfile
${SENHA}            id=password
${CONFIRM_SENHA}    id=confirmPassword
${BTN_NOVO_CADASTRO}    id=Novo Cadastro
${SALVAR_NOVO}          id=save
${MSG_SUCESSO}          //p[contains(text(), 'Cadastro realizado com sucesso')]
${EMAIL_CADASTRO}       usuario.cadastro@example.com  # Email válido para cadastro
${SENHA_USUARIO}     Test258@.com
${CPF_Usuario}       12345678900  # CPF válido para teste

# --- EMPRESA ---
${id_RAZAO_SOCIAL_EMPRESA}    id=corporateName
${RAZAO_SOCIAL_EMPRESA}       Empresa Exemplo Ltda
${id_NOME_FANTASIA_EMPRESA}    id=fantasyName
${NOME_FANTASIA_EMPRESA}       ExemploTech
${id_EMAIL_EMPRESA}    id=email
${EMAIL_EMPRESA}       contato@exemplotech.com
${id_CNPJ_EMPRESA}    id=cnpj
${CNPJ_EMPRESA}       12.345.678/0001-99
${id_TELEFONE_EMPRESA}    id=phone
${TELEFONE_EMPRESA}       (11) 98765-4321
${id_DESCRICAO_SERVICOS}    id=serviceDescription
${DESCRICAO_SERVICOS}       Empresa de tecnologia especializada em soluções digitais.
${id_NOME_RESPONSAVEL}    id=responsibleName
${NOME_RESPONSAVEL}       João da Silva
${id_CEP_EMPRESA}    id=cep
${CEP_EMPRESA}       12345-678
${id_PAIS_EMPRESA}    id=country
${PAIS_EMPRESA}       Brasil
${id_CIDADE_EMPRESA}    id=city
${CIDADE_EMPRESA}       São Paulo
${id_ESTADO_EMPRESA}    id=state
${ESTADO_EMPRESA}       SP
${id_BAIRRO_EMPRESA}    id=neighborhood
${BAIRRO_EMPRESA}       Centro
${id_RUA_EMPRESA}    id=street
${RUA_EMPRESA}       Rua das Empresas
${id_NUMERO_EMPRESA}    id=number
${NUMERO_EMPRESA}       100
${id_COMPLEMENTO_EMPRESA}    id=complement
${COMPLEMENTO_EMPRESA}       Sala 201
${div_Empresa}          xpath=//span[text()='Empresa']

# --- CLIENTE ---
${div_Cliente}          xpath=//span[text()='Cliente']   # cliente apos cadastros
${id_NOME_CLIENTE}       id=nomeCliente
${NOME_CLIENTE}         Mendy Metts
${id_DATA_NASCIMENTO}   id=dataNascimento
${DATA_NASCIMENTO}      05/11/93
${id_EMAIL_CLIENTE}        id=emailCliente
${EMAIL_CLIENTE}         cliente@example.com
${id_TELEFONE_CLIENTE}     id=telefoneCliente
${TELEFONE_CLIENTE}       (11) 91234-5678
${id_CARGO_CLIENTE}        id=cargo
${CARGO_CLIENTE}        Padeiro
${id_RG_CLIENTE}        id=rg
${RG_CLIENTE}           123456789
${CPF_CLIENTE}          123.456.789-00
${id_CPF_CLIENTE}       id=cpfCliente
${CEP_CLIENTE}          12345-678
${id_CEP_CLIENTE}       id=cep
${PAIS_CLIENTE}         BRASIL
${id_PAIS_CLIENTE}      id=pais 
${CIDADE_CLIENTE}       SÃO PAULO
${id_CIDADE_CLIENTE}    id=cidade
${id_ESTADO_CLIENTE}    id=estado
${ESTADO_CLIENTE}       SAO PAULO 
${BAIRRO_CLIENTE}       BAIRRO EXEMPLO
${id_BAIRRO_CLIENTE}    id=bairro
${id_RUA_CLIENTE}       id=rua
${RUA_CLIENTE}          RUA EXEMPLO
${NUMERO_CLIENTE}       900
${id_NUMERO_CLIENTE}    id=numero
${id_COMPLEMENTO_CLIENTE}    id=complemento
${COMPLEMENTO_CLIENTE}   lado c

# MENSAGEM DE ERRO
${MSG_ERRO_RAZAO_SOCIAL}    O campo razão social é obrigatório
${MSG_ERRO_NOME_FANTASIA}    O campo nome fantasia é obrigatório
${MSG_ERRO_EMAIL}    O campo email é obrigatório
${MSG_ERRO_CNPJ}    O campo CNPJ é obrigatório
${MSG_ERRO_TELEFONE}    O campo telefone é obrigatório
${MSG_ERRO_CEP}    O campo CEP é obrigatório
${MSG_ERRO_PAIS}    O campo país é obrigatório
${MSG_ERRO_CIDADE}    O campo cidade é obrigatório
${MSG_ERRO_ESTADO}    O campo estado é obrigatório
${MSG_ERRO_BAIRRO}    O campo bairro é obrigatório
${MSG_ERRO_RUA}    O campo rua é obrigatório
${MSG_ERRO_NUMERO}    O campo número é obrigatório



*** Test Cases ***
Login no Sistema
    Open Browser    ${URL}    ${BROWSER}       
    Wait Until Location Is    ${URL}      
    Sleep       05
    Capture Page Screenshot
    Fechar Navegador
    [Documentation]    Realiza login na plataforma
    Fazer Login        email=sysadmin@qacoders.com    senha=1234@Test 

Cadastrar Novo Usuário
    [Documentation]    Testa o cadastro de um novo usuário
    Acessar Página de Cadastro de Usuário
    Preencher Formulário Usuário
    Submeter Formulário

Cadastrar Novo Cliente
    [Documentation]    Testa o cadastro de um novo cliente
    Acessar Página de Cadastro de Cliente
    Preencher Formulário Cliente
    Submeter Formulário


Cadastrar Nova Empresa
    [Documentation]    Testa o cadastro de uma nova empresa
    Acessar Página de Cadastro de Empresa
    Preencher Formulário Empresa
    Submeter Formulário

Validar Mensagens de Erro ao Cadastrar Empresa sem Dados
    [Documentation]    Testa as mensagens de erro quando os campos obrigatórios são deixados em branco.
    Open Browser    ${URL_EMPRESA}    ${BROWSER}
    Fazer Login     email=sysadmin@qacoders.com    senha=1234@Test 
    Acessar Página de Cadastro de Empresa 
    Click Button    id=save

    # Verificar mensagens de erro
    Verificar Mensagem de Erro    ${MSG_ERRO_RAZAO_SOCIAL}
    Verificar Mensagem de Erro    ${MSG_ERRO_NOME_FANTASIA}
    Verificar Mensagem de Erro    ${MSG_ERRO_EMAIL}
    Verificar Mensagem de Erro    ${MSG_ERRO_CNPJ}
    Verificar Mensagem de Erro    ${MSG_ERRO_TELEFONE}
    Verificar Mensagem de Erro    ${MSG_ERRO_CEP}
    Verificar Mensagem de Erro    ${MSG_ERRO_PAIS}
    Verificar Mensagem de Erro    ${MSG_ERRO_CIDADE}
    Verificar Mensagem de Erro    ${MSG_ERRO_ESTADO}
    Verificar Mensagem de Erro    ${MSG_ERRO_BAIRRO}
    Verificar Mensagem de Erro    ${MSG_ERRO_RUA}
    Verificar Mensagem de Erro    ${MSG_ERRO_NUMERO}
    Close Browser

Validar Mensagens de Erro com Dados Inválidos ao Cadastrar Empresa
    [Documentation]    Testa as mensagens de erro quando dados inválidos são inseridos.
    Open Browser    ${URL_EMPRESA}    ${BROWSER}
    Fazer Login    email=sysadmin@qacoders.com    senha=1234@Test 
    Acessar Página de Cadastro de Empresa

    # Preencher o formulário com dados inválidos
    Input Text    id=corporateName    12345
    Input Text    id=fantasyName    12345
    Input Text    id=email    email_invalido
    Input Text    id=cnpj    abc123
    Input Text    id=phone    123abc
    Input Text    id=cep    abc123
    Input Text    id=country    123
    Input Text    id=city    123
    Input Text    id=state    123
    Input Text    id=neighborhood    123
    Input Text    id=street    123
    Input Text    id=number    abc
    Input Text    id=complement    **********

    # Clicar no botão Salvar
    Click Button    id=save

    # Verificar mensagens de erro
    Validar Mensagem de Alerta    Email inválido
    Validar Mensagem de Alerta    O campo Nome Fantasia deve conter apenas letras
    Validar Mensagem de Alerta    O campo Razão Social deve conter apenas letras
    Validar Mensagem de Alerta    O campo CEP é inválido
    Close Browser

Validar Mensagens de Erro ao Cadastrar Usuário sem Dados
    [Documentation]  Testa a exibição de mensagens de erro ao cadastrar um usuário sem preencher os campos obrigatórios.
    Open Browser    ${URL_CADASTROS}    chrome
    Maximize Browser Window
    Click Button    id=save

    # Validar mensagens de erro para campos obrigatórios
    Verificar Mensagem de Erro    O campo nome completo é obrigatório
    Verificar Mensagem de Erro    O campo email é obrigatório
    Verificar Mensagem de Erro    O campo perfil de acesso é obrigatório
    Verificar Mensagem de Erro    O campo CPF é obrigatório
    Close Browser

Validar Mensagens de Erro com Dados Inválidos ao Cadastrar Usuário.
    [Documentation]  Testa a exibição de mensagens de erro ao inserir dados inválidos no formulário de usuário.
    Open Browser    ${URL_CADASTROS}    chrome
    Maximize Browser Window

    # Preencher formulário com dados inválidos
    Input Text    id=fullName    12345
    Input Text    id=email    invalid_email
    Input Text    id=cpf    1234
    Input Text    id=password    senha123
    Input Text    id=confirmPassword    senha456
    Click Button    id=save

    # Validar mensagens de erro para campos inválidos
    Validar Mensagem de Alerta    O campo nome completo não deve conter números
    Validar Mensagem de Alerta    Deve preencher o CPF com 11 dígitos
    Validar Mensagem de Alerta    O e-mail informado é inválido. Informe um e-mail no formato [nome@domínio.com].
    Validar Mensagem de Alerta    As senhas não conferem.

*** Keywords ***

Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar Navegador
    Close Browser

Fazer Login
    [Arguments]     ${email}    ${senha}
    Input Text      ${input_email}    ${email}
    Input Text      ${input_senha}    ${senha}
    Click Button    ${button_entrar}

Acessar Página de Cadastro de Usuário
    Click Element    ${div_cadastros}
    Click Element    ${usuarios_select}
    Click Element    ${btn_novoCadastro}

Preencher Formulário Usuário
    Input Text    ${NOME}    ${NOME_USUARIO}
    Input Text    ${CAMPO_EMAIL}    ${EMAIL_CADASTRO}
    Input Text    ${SENHA}    ${SENHA_USUARIO}
    Input Text    ${CONFIRM_SENHA}    ${SENHA_USUARIO}
    Input Text    ${CPF}    ${CPF_Usuario}
    Select From List By Value    ${PERFIL_ACESSO}    admin

Submeter Formulário
    Click Button    ${SALVAR_NOVO}

Acessar Página de Cadastro de Cliente
    Click Element    ${div_cadastros}
    Click Element    ${div_Cliente}
    Click Element    ${btn_novoCadastro}


Preencher Formulário Cliente
    Input Text    ${id_NOME_CLIENTE}    ${NOME_CLIENTE}
    Input Text    ${id_DATA_NASCIMENTO}    ${DATA_NASCIMENTO}
    Input Text    ${id_EMAIL_CLIENTE}    ${EMAIL_CLIENTE}
    Input Text    ${id_TELEFONE_CLIENTE}    ${TELEFONE_CLIENTE}
    Input Text    ${id_CARGO_CLIENTE}    ${CARGO_CLIENTE}
    Input Text    ${id_RG_CLIENTE}    ${RG_CLIENTE}
    Input Text    ${id_CPF_CLIENTE}    ${CPF_CLIENTE}
    Input Text    ${id_CEP_CLIENTE}    ${CEP_CLIENTE}
    Input Text    ${id_PAIS_CLIENTE}    ${PAIS_CLIENTE}
    Input Text    ${id_CIDADE_CLIENTE}    ${CIDADE_CLIENTE}
    Input Text    ${id_ESTADO_CLIENTE}    ${ESTADO_CLIENTE}
    Input Text    ${id_BAIRRO_CLIENTE}    ${BAIRRO_CLIENTE}
    Input Text    ${id_RUA_CLIENTE}    ${RUA_CLIENTE}
    Input Text    ${id_NUMERO_CLIENTE}    ${NUMERO_CLIENTE}
    Input Text    ${id_COMPLEMENTO_CLIENTE}    ${COMPLEMENTO_CLIENTE}

    Click Button    ${SALVAR_NOVO}


Acessar Página de Cadastro de Empresa
    Click Element    ${div_cadastros}
    Click Element    ${div_Empresa}
    Click Element    ${btn_novoCadastro}


Preencher Formulário Empresa
    Input Text    ${id_RAZAO_SOCIAL_EMPRESA}    ${RAZAO_SOCIAL_EMPRESA}
    Input Text    ${id_NOME_FANTASIA_EMPRESA}    ${NOME_FANTASIA_EMPRESA}
    Input Text    ${id_EMAIL_EMPRESA}    ${EMAIL_EMPRESA}
    Input Text    ${id_CNPJ_EMPRESA}    ${CNPJ_EMPRESA}
    Input Text    ${id_TELEFONE_EMPRESA}    ${TELEFONE_EMPRESA}
    Input Text    ${id_DESCRICAO_SERVICOS}    ${DESCRICAO_SERVICOS}
    Input Text    ${id_NOME_RESPONSAVEL}    ${NOME_RESPONSAVEL}
    Input Text    ${id_CEP_EMPRESA}    ${CEP_EMPRESA}
    Input Text    ${id_PAIS_EMPRESA}    ${PAIS_EMPRESA}
    Input Text    ${id_CIDADE_EMPRESA}    ${CIDADE_EMPRESA}
    Input Text    ${id_ESTADO_EMPRESA}    ${ESTADO_EMPRESA}
    Input Text    ${id_BAIRRO_EMPRESA}    ${BAIRRO_EMPRESA}
    Input Text    ${id_RUA_EMPRESA}    ${RUA_EMPRESA}
    Input Text    ${id_NUMERO_EMPRESA}    ${NUMERO_EMPRESA}
    Input Text    ${id_COMPLEMENTO_EMPRESA}    ${COMPLEMENTO_EMPRESA}
    Submeter Formulário
    Click Button    ${SALVAR_NOVO}


Verificar Mensagem de Erro
    [Arguments]    ${mensagem}
    Wait Until Element Is Visible    xpath=//p[contains(text(), '${mensagem}')]    timeout=20
    Element Should Be Visible    xpath=//p[contains(text(), '${mensagem}')]

Validar Mensagem de Alerta
    [Arguments]  ${mensagem}
    Wait Until Element Is Visible  xpath=//div[contains(text(), '${mensagem}')]  timeout=10
    Element Should Be Visible  xpath=//div[contains(text(), '${mensagem}')]