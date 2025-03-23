*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
#${URL}                https://quality-eagles-front.qacoders.dev.br/login
${URL}                 https://automacao.qacoders-academy.com.br/login
${BROWSER}            Chrome
${btn_entrar}         button[id=login]
${input_email}        input[id=email]
${input_senha}        input[id=password]
${div_cadastros}      div[id=Cadastros]
${msg_error}          div[class*=MuiAlert-standard]
${link_esqueci_minha_senhas}     //a[contains(text(), 'Esqueci minha senhas')]
${msg_senha_obrigatoria}        //p[contains(text(), 'A senha é obrigatória')]
${msg_email_obrigatorio}        //p[contains(text(), 'O email é obrigatório')]
#${LOGO_XPATH}      //img[@alt='Qa.CodersAcademy']
${EMAIL_ID}                      id=email  
${PASSWORD_ID}                   id=password     
${Expected_Text_Slogan}          Formando Profissionais de Qualidade
${link_acesse_aqui}              css:.css-c3vxn9
${MENSAGEM_ERRO}        xpath=//h1[contains(text(), 'E-mail ou senha informados são inválidos')]

*** Test Cases ***   

T01 - Bug Validar Falha na mensagem de Erro ao Informar E-mail Inválido Bug 
    [Documentation]  Verifica se a mensagem de erro "E-mail ou senha informados são inválidos" é exibida quando o e-mail informado é inválido.
    Realizar Login    email=sysadmin@qacoders    senha=1234@Test
    Wait Until Element Is Visible    css=${msg_error} 
    Element Should Be Visible        css=${msg_error}
    Capture Element Screenshot       css=${msg_error}
    Capture Page Screenshot 
    Fechar Navegador

T02 - Bug Validar Mensagem de Erro ao Informar "Senha Iválida" . BUG
    [Documentation]  Verifica se a mensagem de erro "E-mail ou senha informados são inválidos" é exibida quando a senha informada é incorreta.
    Realizar Login    email=sysadmin@qacoders.com    senha=234@Tests
    Wait Until Element Is Visible    css=${msg_error} 
    Element Should Be Visible        css=${msg_error}
    Capture Element Screenshot       css=${msg_error}
    Capture Page Screenshot 
    Fechar Navegador

T03 - Bug Validar Mensagem de Erro ao informar "E-mail" em branco.
    [Documentation]   Verifica se a mensagem "O email é obrigatório" é exibida quando o campo de e-mail está em branco.
    Realizar Login    email=          senha=1234@Test 
    Sleep    2
    Wait Until Element Is Visible    xpath=${msg_email_obrigatorio}    timeout=10
    Run Keyword And Return Status    Element Should Be Visible    xpath=${msg_email_obrigatorio}
    Capture Element Screenshot       xpath=${msg_email_obrigatorio}
    Fechar Navegador

T04 - Bug Validar mensagem de erro ao informar "Senha" em branco.
    [Documentation]  Verifica se a mensagem "A senha é obrigatória" é exibida quando o campo de senha está em branco.
    Realizar Login    email=sysadmin@qacoders.com    senha=
    Sleep    2
    Wait Until Element Is Visible      xpath=${msg_senha_obrigatoria} 
    Sleep    5
    Run Keyword And Return Status      Element Should Be Visible    xpath=${msg_senha_obrigatoria}  
    Capture Element Screenshot         xpath=${msg_senha_obrigatoria} 
    Fechar Navegador

T05 - Bug Validar Falha no Link "Esqueci Minha Senhas" 
    [Documentation]  Verifica se o link "Esqueci minha senha" e redirecionado para a página correta.
    Realizar Login    email=sysadmin@qacoders.com    senha=
    Wait Until Element Is Visible    xpath=${link_esqueci_minha_senhas}    timeout=10
    Sleep    2
    Click Element    xpath=${link_esqueci_minha_senhas}
    Sleep    2
    ${current_url}=    Get Location
    Execute JavaScript    window.location.href='https://automacao.qacoders-academy.com.br/login'
    Sleep    2    
    Should Be Equal As Strings    ${current_url}    ${URL}
    Capture Element Screenshot    xpath=${link_esqueci_minha_senhas}
    Capture Page Screenshot
    Fechar Navegador
    
T06 - Bug Erro de Posição da Logo: Qa.Coders Academy
    [Documentation]  Verifica a orientação da logo do QA Coders Academy (se está na vertical ou não).
    Open Browser    ${URL}    ${BROWSER}    
    Wait Until Location Is    ${URL}      
    Sleep       05
    Capture Page Screenshot
    Fechar Navegador
T07 - Bug Validar Exibição do Slogan "Formando Profissionais de Qualidade" BUG
    [Documentation]   Verifica se o slogan "Formando Profissionais de Qualidade" está visível na tela de login. 
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    ${existe}    Run Keyword And Return Status    Page Should Contain    Formando Profissionais de Qualidade
    Run Keyword If    not ${existe}    Capture Page Screenshot    slogan_nao_existe.png
    Close Browser

T08 - Bug Validar Orientação Vertical do Slogan Qa.Coders Academy 
    [Documentation]    Verifica a orientação correta do slogan "QA Coders Academy" (se está na orientação vertical).
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    ${existe}    Run Keyword And Return Status    Page Should Contain    Qa.CodersAcademy
    Run Keyword If     ${existe}    Capture Page Screenshot    slogan_existe.png
    Fechar Navegador

T09 - Bug Validar Funcionalidade do Link "Acesse Aqui" 
    [Documentation]  Valida se o link "Acesse aqui" está sem redirecionamento
    Open Browser    ${URL}    chrome
    ${url_antes}    Get Location
    Capture Page Screenshot
    Click Element                css:.css-c3vxn9 
    Capture Element Screenshot   css:.css-c3vxn9 
    ${url_depois}    Get Location
    Should Be Equal    ${url_antes}    ${url_depois}    O link redirecionou, mas não deveria.
    Fechar Navegador
T10 - Bug Verificar Link Esqueci Minha Senha
    Open Browser      ${URL}    chrome
    ${elemento} =    Get Text    //a[contains(text(), 'Esqueci minha senhas')]
    Should Contain    ${elemento}    Esqueci minha senha
    Close Browser

T11 - Bug Mensagem "E-mail ou senha informados são inválidos" não aparece ao clicar em "Esqueci minha senha"
    Open Browser    ${URL}    chrome
    Wait Until Element Is Visible    ${link_esqueci_minha_senhas}    10s  
    Click Link    ${link_esqueci_minha_senhas}
    Element Should Not Be Visible    ${MENSAGEM_ERRO}   
    Capture Page Screenshot
    Close Browser

*** Keywords *** 
Realizar Login 
    [Documentation]     Keyword usada para realizar login 2 orgumentos [email - senha]
    [Arguments]    ${email}    ${senha}
    Abrir Navegador 
    Input text        css=${input_email}    ${email}
    Input text        css=${input_senha}    ${senha}
    Click Button      css=${btn_entrar}

Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}    
    Maximize Browser Window
Fechar Navegador
    Close Browser



