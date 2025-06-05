*** Settings ***
Documentation        Automação referente as funcionalidades de login na ferramenta Zeus

Resource    ../Resources/base.robot   

Test Setup       Abrir navegador na página de hml  #antes de cada caso de teste
Test Teardown    Take Screenshot                  #depois de cada caso de teste

*** Test Cases ***
Cenário 01: Validar login com sucesso
    Login no sistema
    Clicar em enviar    ${LOGIN_SUBMIT_BUTTON}
    Aguardar Visualização do Formulário de Solicitação do Token

Cenário 02: Validar falha no login deixando o campo email em branco    
    Digitar Senha     123
    Clicar em enviar    ${LOGIN_SUBMIT_BUTTON}
    Validar Alerta Email Obrigatório  	Please enter your email   

Cenário 03: Validar falha no login deixando o campo senha em branco
    Digitar Email    um.teste@concentrix.com
    Clicar em enviar    ${LOGIN_SUBMIT_BUTTON}
    Validar Alerta Senha Obrigatória    Please enter your password

Cenário 04: Validar falha no login deixando os campos email e senha em branco
    Clicar em enviar    ${LOGIN_SUBMIT_BUTTON}
    Validar Alerta Email Obrigatório  	Please enter your email
    Validar Alerta Senha Obrigatória    Please enter your password

Cenário 05: Validar falha no login deixando o campo email incompleto
    Digitar Email    alguem.testes@
    Digitar Senha     123
    Clicar em enviar    ${LOGIN_SUBMIT_BUTTON}
    Take Screenshot
    Sleep    2
    Digitar Email    alguem.testes@alo
    Clicar em enviar    ${LOGIN_SUBMIT_BUTTON}
    Validar Alerta Email Inválido    Please enter a valid email

Cenário 06: Validar falha no login com senha incorreta 
    Digitar Email    angela.hennig@concentrix.com
    Digitar Senha     123
    Clicar em enviar    ${LOGIN_SUBMIT_BUTTON}
    Validar Alerta Senha Inválida    Invalid credentials.