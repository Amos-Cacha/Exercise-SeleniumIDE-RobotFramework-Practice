*** Settings ***
Documentation   A test suite with a singles valid login
...
...             This test follows the example using keywords from
...             the Selenium library
Resource        resources.robot

*** Variables ***


*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username  ${VALID USER}
    Input Password  ${VALID PASSWORD}
    Click Button   login-button
    Product Page Should Be Open
    [teardown]  Close Browser

Locked Out Login
    Open Browser To Login Page
    Input Username  ${LOCKED OUT USER}
    Input Password  ${VALID PASSWORD}
    Click Button   login-button
    Element Text Should Be  css:[data-test=error]  Epic sadface: Sorry, this user has been locked out.
    [teardown]  Close Browser