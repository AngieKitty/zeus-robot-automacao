*** Settings ***    
Documentation       Base de testes do site Zeus

Library    Browser
Library    Dialogs
Library    EnvLoader.py 
Library    OperatingSystem

Resource   ./actions/acess.robot
Resource   ../Pages/LoginPage.robot
Resource   ../Resources/Keywords/usuario.robot


*** Variables ***
${URL_HML}        https://front-administrator-hml-990632969909.us-central1.run.app
${EMAIL_INPUT}        id=email
${PASSWORD_INPUT}     id=password
${LOGIN_SUBMIT_BUTTON}       data-testid=sign-in-form-submit
${TOKEN_INPUT}        id=code
${TOKEN_SUBMIT_BUTTON}    data-testid=two-factor-auth-form-submit

*** Keywords ***
Abrir navegador na página de hml
    New Browser    headless=false    browser=chromium
    New Page       ${URL_HML}
    Set Viewport Size    1280        720
Limpar o cache e recarregar a página
    LocalStorage Clear
    Sleep    2
    Reload

Login no sistema
    ${USER}=       Get Environment Variable    ZEUS_USER
    ${PASSWORD}=   Get Environment Variable    ZEUS_PASSWORD
    Fill Text    id=email    ${USER}
    Fill Secret    ${PASSWORD_INPUT}    %ZEUS_PASSWORD
    # Adicione suas validações aqui


