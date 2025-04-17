*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}        https://quality-eagles.qacoders.dev.br/api/
${EMPRESA_ENDPOINT}  /empresa
${TOKEN}           None

*** Test Cases ***
Login e Criar Sessão
    Login Usuario
    Criar Sessao

Criar Empresa com Sucesso
    Criar empresa

Listar Empresa
    Listar empresa

Listar Empresa Acesso Negado
    Listar empresa acesso negado

Listar Empresa por ID Inválido
    Listar empresa por ID invalido

Contar Empresas
    Contagem de empresas

Contar Empresas Status Inválido
    Contagem de empresa Status invalido

Contar Empresas com Token Inválido
    Contagem de empresa com token inválido

Mostrar Empresa por ID
    Mostrar empresa por ID

Atualizar Empresa por ID
    Atualizar Dados de empresa por ID

Atualizar Empresa com ID Inválido
    Atualizar Dados de empresa por ID inválido

Atualizar Empresa Sem Token
    Atualizar Dados de empresa sem Token

Deletar Empresa por ID
    Deletar Empresa por ID

Deletar Empresa por ID Inválido
    Deletar Empresa por ID inválido

Deletar Empresa Sem Token
    Deletar Empresa sem Token

Atualizar Endereço da Empresa
    Atualizar endereço de empresa

Atualizar Status por ID
    Atualizar status por id para true com sucesso

*** Keywords ***
Login Usuario
    Create Session    login    ${BASE_URL}
    ${payload}=    Create Dictionary    email=usuario@email.com    senha=123456
    ${response}=    POST On Session    login    ${LOGIN_ENDPOINT}    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    200
    ${json}=    To Json    ${response.content}
    Set Suite Variable    ${TOKEN}    ${json['token']}

Criar Sessao
    [Documentation]    Apenas cria a sessão se já não estiver criada
    Run Keyword Unless    '${TOKEN}' != 'None'    Create Session    api    ${BASE_URL}    headers={'Authorization': 'Bearer ${TOKEN}', 'Content-Type': 'application/json'}

Criar empresa
    ${data}=    Create Dictionary    nome=Nova Empresa    cnpj=12345678000199    endereco=Rua Teste 123
    ${response}=    POST On Session    api    ${EMPRESA_ENDPOINT}    json=${data}
    Should Be Equal As Integers    ${response.status_code}    201

Listar empresa
    ${response}=    GET On Session    api    ${EMPRESA_ENDPOINT}
    Should Be Equal As Integers    ${response.status_code}    200

Listar empresa acesso negado
    Create Session    semtoken    ${BASE_URL}
    ${response}=    GET On Session    semtoken    ${EMPRESA_ENDPOINT}
    Should Be Equal As Integers    ${response.status_code}    403

Listar empresa por ID invalido
    ${response}=    GET On Session    api    ${EMPRESA_ENDPOINT}/id_invalido
    Should Be Equal As Integers    ${response.status_code}    404

Contagem de empresas
    ${response}=    GET On Session    api    ${EMPRESA_ENDPOINT}/contagem
    Should Be Equal As Integers    ${response.status_code}    200

Contagem de empresa Status invalido
    ${response}=    GET On Session    api    ${EMPRESA_ENDPOINT}/contagem?status=xyz
    Should Be Equal As Integers    ${response.status_code}    400

Contagem de empresa com token inválido
    Create Session    tokeninvalido    ${BASE_URL}    headers={'Authorization': 'Bearer token_falso'}
    ${response}=    GET On Session    tokeninvalido    ${EMPRESA_ENDPOINT}/contagem
    Should Be Equal As Integers    ${response.status_code}    403

Mostrar empresa por ID
    ${response}=    GET On Session    api    ${EMPRESA_ENDPOINT}/1
    Should Be Equal As Integers    ${response.status_code}    200

Atualizar Dados de empresa por ID
    ${data}=    Create Dictionary    nome=Empresa Atualizada
    ${response}=    PUT On Session    api    ${EMPRESA_ENDPOINT}/1    json=${data}
    Should Be Equal As Integers    ${response.status_code}    200

Atualizar Dados de empresa por ID inválido
    ${data}=    Create Dictionary    nome=Empresa Teste
    ${response}=    PUT On Session    api    ${EMPRESA_ENDPOINT}/id_fake    json=${data}
    Should Be Equal As Integers    ${response.status_code}    404

Atualizar Dados de empresa sem Token
    Create Session    semtoken2    ${BASE_URL}
    ${data}=    Create Dictionary    nome=Sem Token
    ${response}=    PUT On Session    semtoken2    ${EMPRESA_ENDPOINT}/1    json=${data}
    Should Be Equal As Integers    ${response.status_code}    403

Deletar Empresa por ID
    ${response}=    DELETE On Session    api    ${EMPRESA_ENDPOINT}/1
    Should Be Equal As Integers    ${response.status_code}    200

Deletar Empresa por ID inválido
    ${response}=    DELETE On Session    api    ${EMPRESA_ENDPOINT}/id_invalido
    Should Be Equal As Integers    ${response.status_code}    404

Deletar Empresa sem Token
    Create Session    semtoken3    ${BASE_URL}
    ${response}=    DELETE On Session    semtoken3    ${EMPRESA_ENDPOINT}/1
    Should Be Equal As Integers    ${response.status_code}    403

Atualizar endereço de empresa
    ${data}=    Create Dictionary    endereco=Rua Nova Atualizada
    ${response}=    PATCH On Session    api    ${EMPRESA_ENDPOINT}/1/endereco    json=${data}
    Should Be Equal As Integers    ${response.status_code}    200

Atualizar status por id para true com sucesso
    ${data}=    Create Dictionary    status=True
    ${response}=    PATCH On Session    api    ${EMPRESA_ENDPOINT}/1/status    json=${data}
    Should Be Equal As Integers    ${response.status_code}    200
