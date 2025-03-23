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
${usuarios_select}        id=Usuários

*** Test Cases ***                              

T01 - Tela de Login Exibida ao Acessar a Aplicação.
    [Documentation]    Verifica se a tela de login é exibida como primeira tela ao acessar a aplicação.
    Open Browser    ${URL}    ${BROWSER}    
    Wait Until Location Is    ${URL}      
    Sleep       05
    Capture Page Screenshot
    Fechar Navegador

T02 - Login com Sucesso e Redirecionamento à Página de Cadastro.
    [Documentation]    Valida o login com sucesso e o redirecionamento correto para a página de cadastro.
    Realizar Login    email=sysadmin@qacoders.com    senha=1234@Test 
    Wait Until Element Is Visible    css=${div_cadastros}  
    Sleep    02
    Element Should Be Visible        css=${div_cadastros}  
    Capture Element Screenshot       css=${div_cadastros} 
    Capture Page Screenshot
    Fechar Navegador

T03 - Validar Presença do Campo input E-mail na Tela de Login
    [Documentation]   Verifica se o campo de input para o e-mail está presente e visível na tela de login.
    Open Browser    ${URL}    chrome
    Wait Until Page Contains Element    ${EMAIL_ID}   
    Element Should Be Visible           ${EMAIL_ID}
    Capture Element Screenshot          ${EMAIL_ID}
    Close Browser
 
T04 - Validar Presença do Campo input Senha na Tela de Login
    [Documentation]   Verifica se o campo de input para senha está presente e visível na tela de login.
    Open Browser    ${URL}    chrome
    Wait Until Page Contains Element    ${PASSWORD_ID}    
    Element Should Be Visible           ${PASSWORD_ID}
    Capture Element Screenshot          ${PASSWORD_ID}
    Close Browser  

T05 - Validar Presença do Botão "Entrar" na Tela de Login
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
  Should Be Equal                  ${url_atual}    https://automacao.qacoders.dev.br/user