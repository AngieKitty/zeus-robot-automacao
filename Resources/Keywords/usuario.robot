*** Settings ***

Documentation        

Resource    ../base.robot

*** Keywords ***
Obter Credenciais do Usuário 
    ${EMAIL}       Get Value From User    Digite seu e-mail:
    ${PASSWORD}    Get Value From User    Digite sua senha:    hidden=True
    RETURN        ${EMAIL}    ${PASSWORD}
    

