*** Settings ***

Documentation        Automação referente as funcionalidades de 2fa na ferramenta Zeus

Resource        ../Resources/base.robot

Test Setup    Abrir navegador na página de hml
Test Teardown    Take Screenshot

Library    AppiumLibrary

*** Test Cases ***
#Validar apresentação do QRCODE

#Validar cadastro do autenticador com sucesso

#Validar a autenticação com token válido

Validar erro na autenticação ao inserir um token inválido
    Login no sistema
    Clicar em enviar    ${LOGIN_SUBMIT_BUTTON}
    Aguardar Visualização do Formulário de Solicitação do Token
    Preencher token inválido
    Clicar em enviar    ${TOKEN_SUBMIT_BUTTON}
    Validar alerta token inválido    Invalid code.



Validar erro na autenticação ao inserir um token incompleto
    Login no sistema
    Clicar em enviar    ${LOGIN_SUBMIT_BUTTON}
    Aguardar Visualização do Formulário de Solicitação do Token
    Preencher token incompleto
    Clicar em enviar    ${TOKEN_SUBMIT_BUTTON}
    Validar alerta token incompleto    Please enter a valid verification code
#Validar erro na autenticação ao deixar o campo token vazio

#Validar erro na autenticação ao utilizar um token expirado

#Validar itens e direcionamentos do rodapé


*** Keywords ***
Preencher token inválido    
    Click    ${TOKEN_INPUT}    
    Keyboard Input    Type    1111111

Preencher token incompleto
    Click    ${TOKEN_INPUT}
    Keyboard Input    Type    15151

Validar alerta token inválido
    [Arguments]        ${texto_esperado}
    ${title}    Browser.Get Text        [data-slot=alert-title]
    Should Be Equal    ${title}    Error
    ${message_error}    Browser.Get Text    data-testid=two-factor-auth-form-error-message
    Should Be Equal    ${message_error}    ${texto_esperado}

Validar alerta token incompleto
    [Arguments]        ${texto_esperado}
    ${message_error}    Browser.Get Text    data-testid=two-factor-auth-form-code-error
    Should Be Equal    ${message_error}    ${texto_esperado}

Validar alerta token vazio
    [Arguments]        ${texto_esperado}
    ${message_error}    Browser.Get Text    data-testid=two-factor-auth-form-code-error
    Should Be Equal    ${message_error}    ${texto_esperado}

#caso conflito, utilize a sintaxe NomeDaBiblioteca.Keyword.
