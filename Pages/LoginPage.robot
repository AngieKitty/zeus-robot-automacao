*** Settings ***

Documentation    Ações da funcionalidade de login

Resource       ../Resources/base.robot

*** Keywords ***
Preencher Campo De Email
    [Arguments]    ${email}
    Fill Text    ${EMAIL_INPUT}  ${email}

Preencher Campo De Senha
    [Arguments]    ${senha}
    Fill Secret    ${PASSWORD_INPUT}    $senha
    
#Preencher email e senha
#    ${EMAIL}    ${SENHA}    Obter Credenciais do Usuário
#    Preencher Campo De Email    ${EMAIL}
#    Preencher Campo De Senha    ${SENHA}
    
#Pedir Digitar Email    
#    [Arguments]    ${email}    
#    Fill Text    ${EMAIL_INPUT}  ${email}

#Pedir Digitar Senha
#    [Arguments]      ${password}
#    Fill Text    ${PASSWORD_INPUT}      ${password}

Clicar em enviar
    [Arguments]    ${selector}
    Click    ${selector}
   
Preencher login    
    [Arguments]    ${email}    ${password}
    Fill Text    ${EMAIL_INPUT}  ${email}
    Fill Secret    ${PASSWORD_INPUT}    ${password}

Validar Alerta Email Obrigatório
    [Arguments]    ${texto_esperado}
    ${Alerta_email}     Get Text   data-testid=email-input-error-message    
    Should Be Equal    ${Alerta_email}    ${texto_esperado}

Validar Alerta Senha Obrigatória
    [Arguments]    ${texto_esperado}
    ${Alerta_senha}     Get Text   data-testid=password-input-error-message    
    Should Be Equal    ${Alerta_senha}    ${texto_esperado}

Validar Alerta Senha Inválida
    [Arguments]    ${texto_esperado}    
    ${Alerta_senha_in}    Get Text    data-testid=sign-in-form-error-message
    Should Be Equal    ${Alerta_senha_in}    ${texto_esperado}
Validar Alerta Email Inválido
    [Arguments]    ${texto_esperado}
    ${Alerta_email_in}    Get Text    data-testid=email-input-error-message
    Should Be Equal    ${Alerta_email_in}    ${texto_esperado}

Digitar Email    
    [Arguments]    ${email}    
    Fill Text    ${EMAIL_INPUT}  ${email}

Digitar Senha
    [Arguments]      ${password}
    Fill Text    ${PASSWORD_INPUT}      ${password}
Aguardar Visualização do Formulário de Solicitação do Token
    Wait For Elements State    data-testid=two-factor-auth-form
    Sleep    5s

#*** Test Cases ***
#Login Com Credenciais Do Usuário
#    ${EMAIL}    ${SENHA}=    Obter Credenciais Do Usuário