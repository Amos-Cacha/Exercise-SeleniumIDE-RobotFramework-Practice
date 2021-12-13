Library               SeleniumLibrary

*** Variables ***
${SERVER}             www.saucedemo.com
${BROWSER}            edge
${VALID USER}         standard_user
${LOCKED OUT USER}    locked_out_user
${VALID PASSWORD}     secret_sauce
${LOGIN URL}          https://${SERVER}/
${HOME URL}           https://${SERVER}/inventory.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}   ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Button  login-button

Product Page Should Be Open
    Element Text Should Be  css:.title  PRODUCTS

Input Username
    [Arguments] ${username}
    Input Text  user-name   ${username}

Input Password
    [Arguments] ${password}
    Input Password  password    ${password}