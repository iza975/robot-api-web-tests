
*** Settings ***
Documentation       Testar Company

Library        RequestsLibrary
Library        String
Library        Collections
Library        libs/get_fake_company.py
Library        JSONLibrary


*** Variables ***
${BASEURL}            https://quality-eagles.qacoders.dev.br/api/
${ID_COMPANY}         67d0718711d5ff7629b91929      
${TOKEN}               
${mailUser}            manuelaribeiro@qacoders.com.br
${passUser}            j4Uulv4sbr@D
${token_invalido}       abc123xyz

*** Test Cases ***

Cadastro de Company
    Login
    Criar Sessao
    ${company_fake}    Get Fake Company
    Criar Empresa      ${company_fake}
    Contar Empresas Ativas
    Contar Empresas Sem Token
Status Ativos 
    Status Ativos


*** Keywords ***
Login 
    ${headers}    Create Dictionary    accept=application/json   Content-Type=application/json    
    Create Session    alias=qualityeagles    url=${BASEURL}   headers=${headers}    timeout=120  verify=true 
    ${body}          Create Dictionary  
    ...      mail=${mailUser}
    ...      password=${passUser}
    ${resposta}    POST On Session     alias=qualityeagles    url=login    json=${body}
    Set Global Variable    ${TOKEN}    ${resposta.json()["token"]}   # seta a variavel token e mostra o caminho 
    Log To Console    Token: ${TOKEN} 

Criar Sessao
    ${headers}    Create Dictionary  
    ...    content-type=application/json
    ...    authorization=${TOKEN}
    Create Session    alias=qualityeagles    
    ...    url=${BASEURL}    headers=${headers}    timeout=120    verify=true    

Criar empresa 
    [Arguments]    ${company_fake}
    ${address}=    Create List
    ${address_item}=    Create Dictionary
    ...    zipCode=04777001
    ...    city=São Paulo
    ...    state=SP
    ...    district=Bom Jardim
    ...    street=Avenida Interlagos
    ...    number=50
    ...    complement=de 4503 ao fim - lado ímpar
    ...    country=Brasil
    Append To List    ${address}    ${address_item}
       
    ${body}     Create Dictionary        
    ...    corporateName=${company_fake}[corporateName]
    ...    registerCompany=${company_fake}[cnpj]
    ...    mail=${company_fake}[corporateEmail]
    ...    matriz=Teste
    ...    responsibleContact=Marcio
    ...    telephone=99999999999999
    ...    serviceDescription=Testes
    ...    address=${address}

    ${headers}=    Create Dictionary    
    ...    Content-Type=application/json    
    ...    Authorization=${TOKEN}   
    ${resposta}=   POST On Session    alias=qualityeagles    
    ...    url=company/   json=${body}    headers=${headers}
    Log To Console    ${resposta.json()} 
    Log To Console    O ID é    ${resposta.json()["newCompany"]["_id"]}  # log do Id retornado pela resposta
    Set Global Variable    ${ID_COMPANY}    ${resposta.json()["newCompany"]["_id"]}  # seta a variavel do id criado 
 


Contar Empresas Ativas
    ${headers}    Create Dictionary  
    ...    content-type=application/json
    ...    authorization=${TOKEN}
    ${resposta}    GET On Session   
    ...    alias=qualityeagles    
    ...    url=company/count    
    ...    headers=${headers}
    Log To Console    Response JSON: ${resposta.json()}
    Status Should Be    200    ${resposta}
    ${count}    Set Variable    ${resposta.json()["count"]}
    Log To Console    Total de empresas ativas: ${count}

Contar Empresas Sem Token
    ${headers}    Create Dictionary  
    ...    content-type=application/json
    ${resposta}    GET On Session    
    ...    alias=qualityeagles   
    ...    url=company/count    
    ...    headers=${headers}
    Status Should Be    403    ${resposta}
   ${response_json}    Set Variable    ${resposta.json()}
    Log To Console    Resposta: ${response_json}
    Should Be Equal As Strings    ${response_json["errors"][0]}    No token provided.    "A mensagem de erro deve ser 'No token provided.'"

Status Ativos
    [Documentation]  Teste de Api retorna a contagem de empresas ativas 
    Create Session    qualityeagles    ${BASE_URL}    verify=${False}

    ${headers}    Create Dictionary  
    ...    Content-Type=application/json
    ...    Authorization=Bearer ${TOKEN}

    ${resposta}    GET On Session   
    ...    qualityeagles    
    ...    /company/count?Status=ativo    
    ...    headers=${headers}

    Log To Console    Response JSON: ${resposta.json()}
    Status Should Be    200    ${resposta.status_code}