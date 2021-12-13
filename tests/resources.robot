*** Settings ***
Library               SeleniumLibrary

*** Variables ***
${SERVER}             www.saucedemo.com
${BROWSER}            edge
${VALID USER}         standard_user
${LOCKED OUT USER}    locked_out_user
${PROBLEM USER}       problem_user
${VALID PASSWORD}     secret_sauce
${INVALID PASSWORD}   iforgor
${LOGIN URL}          https://${SERVER}/
${HOME URL}           https://${SERVER}/inventory.html
${LOCKED OUT ERROR}   Epic sadface: Sorry, this user has been locked out.
${WRONG PW ERROR}     Epic sadface: Username and password do not match any user in this service
${ERROR IMAGE}        https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
${BACKPACK}           Sauce Labs Backpack
${TEST ALL TSHIRT}    Test.allTheThings() T-Shirt (Red)
${SORT ALPHB DESC}    Name (A to Z)

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}   ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Button  login-button

Product Page Should Be Open
    Element Text Should Be  css:.title  PRODUCTS

Error Message Shown
    [Arguments]     ${error}
    Element Text Should Be  css:*[data-test=error]  ${error}

Input Username
    [Arguments]     ${username}
    Input Text  user-name   ${username}

Input Pass
    [Arguments]     ${password}
    Input Password  password    ${password}

Submit Credentials
    Click Button    login-button

Login Correctly
    Open Browser To Login Page
    Input Username  ${VALID USER}
    Input Pass  ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open

First Value Shown
    [Arguments]     ${text}
    Element Text Should Be  css:.inventory_list .inventory_item:first-child .inventory_item_name  ${text}

Last Value Shown
    [Arguments]     ${text}
    Element Text Should Be  css:.inventory_list .inventory_item:last-child .inventory_item_name  ${text}