*** Settings ***
Documentation               This is a demo project based on https://automationexercise.com/test_cases
Resource                    Resources/API_Testing/API_Actions.robot


*** Test Cases ***

GET All Brands List
    [Documentation]             Get the list of all brands in the shop
    [Tags]                      apiTC01    api01       API
    log                         Starting apiTC01
    API_Actions.Get all brands list

POST To Search Product
    [Documentation]             Search for a specific type of product
    [Tags]                      apiTC02    api02       API
    log                         Starting apiTC02
    API_Actions.Search for a product