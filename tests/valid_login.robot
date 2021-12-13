*** Settings ***
Documentation   A test suite testing logins
...
...             This test follows the example using keywords from
...             the Selenium library
Resource        resources.robot
Test Teardown   Close Browser

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username  ${VALID USER}
    Input Pass  ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open

Locked Out Login
    Open Browser To Login Page
    Input Username  ${LOCKED OUT USER}
    Input Pass  ${VALID PASSWORD}
    Submit Credentials
    Error Message Shown  ${LOCKED OUT ERROR}

Typed Wrong Password
    Open Browser To Login Page
    Input Username  ${LOCKED OUT USER}
    Input Pass  ${INVALID PASSWORD}
    Submit Credentials
    Error Message Shown  ${WRONG PW ERROR}

Problem User Login
    Open Browser To Login Page
    Input Username  ${PROBLEM USER}
    Input Pass  ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open
    Element Attribute Value Should Be   css:#item_0_img_link > .inventory_item_img  src    ${ERROR IMAGE}
    Element Attribute Value Should Be   css:#item_1_img_link > .inventory_item_img  src    ${ERROR IMAGE}
    Element Attribute Value Should Be   css:#item_2_img_link > .inventory_item_img  src    ${ERROR IMAGE}
    Element Attribute Value Should Be   css:#item_3_img_link > .inventory_item_img  src    ${ERROR IMAGE}
    Element Attribute Value Should Be   css:#item_4_img_link > .inventory_item_img  src    ${ERROR IMAGE}
    Element Attribute Value Should Be   css:#item_5_img_link > .inventory_item_img  src    ${ERROR IMAGE}