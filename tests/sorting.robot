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
    First Item Shown   ${BACKPACK}
    Last Item Shown    ${TEST ALL TSHIRT}

Sort Alphabetically Ascending
    Select From List By Label   css:*[data-test="product_sort_container"]   ${SORT ALPHB ASC}
    First Item Shown   ${TEST ALL TSHIRT}
    Last Item Shown    ${BACKPACK}

Sort Price Descending
    Select From List By Label   css:*[data-test="product_sort_container"]   ${SORT PRICE DESC}
    First Price Shown   ${HIGHEST PRICE}
    Last Price Shown    ${LOWEST PRICE}

Sort Price Ascending
    Select From List By Label   css:*[data-test="product_sort_container"]   ${SORT PRICE ASC}
    First Price Shown   ${LOWEST PRICE}
    Last Price Shown    ${HIGHEST PRICE}