*** Settings ***
Documentation               REST API actions
Library                     RequestsLibrary
Library                     Collections
Variables                   Resources/API_Testing/API_Details.yaml

*** Keywords ***

Get all brands list
    [Documentation]         Get the list of all brands in the shop
    ${response}=    GET         ${api_details}[get_brands_url]
    log    ${response.json()}

Search for a product
    [Documentation]         Search for a specific type of product
    &{req_body}=  Create Dictionary    search_product=${api_details}[search_product]
    ${response}=    POST        ${api_details}[search_product_url]      data=${req_body}    expected_status=200
    log    ${response.json()}[products]
