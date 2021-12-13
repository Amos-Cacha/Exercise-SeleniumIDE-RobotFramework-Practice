*** Settings ***
Documentation   A test suite with sorting
...
...             This test follows the example using keywords from
...             the Selenium library
Resource        resources.robot
Test Setup      Login Correctly
Test Teardown   Close Browser

*** Test Cases ***

Sort Alphabetically Descending
    Select From List By Label   css:*[data-test="product_sort_container"]   ${SORT ALPHB DESC}
    First Value Shown   ${BACKPACK}
    Last Value Shown    ${TEST ALL TSHIRT}