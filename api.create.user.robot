*** Settings ***
Documentation        Pegar Token

Library        RequestsLibrary
Library        libs/get_fake_company.py

*** Variables ***
${BASEURL}        https://quality-eagles.qacoders.dev.br/api/
#${TOKEN}          eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NmRiNWU0MGU1YTAwMTU2MzRmMTM3ZTYiLCJmdWxsTmFtZSI6IlFhLUNvZGVycy1TWVNBRE1JTiIsIm1haWwiOiJzeXNhZG1pbkBxYWNvZGVycy5jb20iLCJwYXNzd29yZCI6IiQyYiQxMCRqcGFsRGFZUlYuQlpTVndqM0xPYS8uQ2FxWC9CTVFzelFmNDdDZmp6dWJBTzVrRXA2anA2SyIsImFjY2Vzc1Byb2ZpbGUiOiJTWVNBRE1JTiIsImNwZiI6IjExMTExMTExMTExIiwic3RhdHVzIjp0cnVlLCJhdWRpdCI6W3sicmVnaXN0ZXJlZEJ5Ijp7InVzZXJJZCI6IjExMTExMTExMTExMTExMTExMSIsInVzZXJMb2dpbiI6InN5c2FkbWluQHFhY29kZXJzLmNvbSJ9LCJyZWdpc3RyYXRpb25EYXRlIjoic2V4dGEtZmVpcmEsIDA2LzA5LzIwMjQsIDE2OjU1OjQ0IEJSVCIsInJlZ2lzdHJhdGlvbk51bWJlciI6IjAxIiwiY29tcGFueUlkIjoiUWEuQ29kZXJzIiwiX2lkIjoiNjZkYjVlNDBlNWEwMDE1NjM0ZjEzN2U3In1dLCJfX3YiOjAsImlhdCI6MTc0MDc2ODg5NCwiZXhwIjoxNzQwODU1Mjk0fQ.c1zcK6uPMdMaD_Co76ky-NiG-NC2jsdhG80JDW2BcsE
${ID_USER}        67d3109b11d5ff7629057667


*** Test Cases
CT01 - Realizar Login com sucesso
    ${resposta}    Realizar Login     email=sysadmin@qacoders.com    senha=1234@Test   
    Status Should Be    200    ${resposta}

CT02 - Realizar Login com senha invalida 
    ${resposta}    Realizar Login     email=sysadmin@qacoders.com    senha=1234@Tes   
    RequestsLibrary.Status Should Be    400    ${resposta}
    
CT03 - Realizar Login com email invalido
    ${resposta}    Realizar Login     email=sysadmin@qacoders.com.br    senha=1234@Test 
    RequestsLibrary.Status Should Be    400    ${resposta}
    BuiltIn.Log To Console    message=${resposta}             # vem debugando a response 400
    BuiltIn.Log To Console    message=${resposta.json()}      # imprime todo o objeto
    BuiltIn.Log To Console    message=${resposta.json()["alert"]}  # imprime somente a mensagem
    Should Be Equal    first=E-mail ou senha informados são inválidos.    second=${resposta.json()["alert"]}
    
CT04 - Realizar Login com email e senha em branco
    ${resposta}    Realizar Login     email=''    senha=''
    RequestsLibrary.Status Should Be    400    ${resposta}
    BuiltIn.Log To Console    message=${resposta}             # vem debugando a response 400
    BuiltIn.Log To Console    message=${resposta.json()}      # imprime todo o objeto
    BuiltIn.Log To Console    message=${resposta.json()["alert"]}  # imprime somente a mensagem
    Should Be Equal    first=E-mail ou senha informados são inválidos.    second=${resposta.json()["alert"]}

CT05 - Atualizar Status para false com sucesso.
    ${ID_USER}     Create User  
    ${resposta}    Puts status    ID_USER=${ID_USER}    status=false
    Should Be Equal    Status do usuario atualizado com sucesso para status false.    ${resposta["msg"]}
    #${mensagem}    Set Variable    ${resposta.json()}[msg]
    #Log To Console    ${mensagem}
    #Should Be Equal As Strings    ${mensagem}    Olá Isabela Cirino, cadastro realizado com sucesso.

CT06 - Listar usuarios com sucesso
    ${token}       Pegar Token
    ${resposta}    GET On Session    alias=qualityeagles    url=/user/?token=${token}
    Status Should Be    200    ${resposta}

CT07 - Deletar usuario com sucesso
    ${ID_USER}        Create User
    ${resposta}       Delete User    ID_USER=${ID_USER}
    Should Be Equal    Usuário    deletado com sucessso!.    ${resposta.json()["msg"]}



*** Keywords ***
Criar Sessao
    [Documentation]    Criando sessao inicial para usar nas proximas requests
    ${headers}    Create Dictionary    accept=application/json    content-type=application/json
    Create Session    alias=qualityeagles    url=${BASE_URL}    headers=${headers}    verify=true
Pegar Token
    [Documentation]    Request usada para pegar o token do admin 
    ${body}    Create Dictionary    #objeto json
    ...    mail=sysadmin@qacoders.com
    ...    password=1234@Test
    Criar Sessao   # ele define qual request tenho que enviar 
    ${resposta}    POST On Session    alias=qualityeagles    url=/login    json=${body}
    RETURN    ${resposta.json()["token"]}   # retorna o Token
Realizar Login
    [Documentation]    Realizar Login
    [Arguments]    ${email}    ${senha}   # essa função define o que obrigatoriamente tem que reseber
    ${body}    Create Dictionary    
    ...    mail=${email}
    ...    password=${senha}
    Criar Sessao
    ${resposta}    POST On Session    alias=qualityeagles    expected_status=any    url=/login    json=${body}
    RETURN    ${resposta} 
Create User 
    [Documentation]    Keyword para criar usuario 
    ${person}    Get Fake Person
    ${token}     Pegar Token
    ${body}      Create Dictionary    
    ...    fullName=${person}[name]    
    ...    mail=${person}[email]    
    ...    password=1234@Test     
    ...    accessProfile=ADMIN    
    ...    cpf=${person}[cpf]    
    ...    confirmPassword=1234@Test
    ${resposta}    POST On Session    alias=qualityeagles    url=/user/?token=${token}    json=${body}
    Status Should Be    201    ${resposta}
    RETURN    ${resposta.json()["user"]["_id"]}   # retorna a resposta e o id
Cadastro Sucesso
    ${ID_USER}    Create User

Delete User
    [Arguments]    ${ID_USER}
    ${token}     Pegar Token
    ${body}      Create Dictionary    
    ${resposta}    DELETE On Session    alias=qualityeagles    url=/user/${ID_USER}?token=${token}
    RETURN    ${resposta}

Puts Status 
    [Arguments]    ${ID_USER}    ${status}  # define os argumentos
    ${token}     Pegar Token
    ${body}      Create Dictionary    status=${status}
    ${resposta}    PUT On Session    alias=qualityeagles    url=/user/status/${ID_USER}?token=${token}    json=${body}    
    RETURN        ${resposta.json()}
