
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