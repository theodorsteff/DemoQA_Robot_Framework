*** Settings ***
Documentation               This is a demo project based on https://automationexercise.com/test_cases
Library                     SeleniumLibrary
Resource                    Resources/RegisterUserApp.robot
Resource                    Resources/LoginUserApp.robot
Resource                    Resources/AllProductsApp.robot
Resource                    Resources/ShoppingCartApp.robot
Resource                    Resources/ShoppingCartApp.robot
Test Teardown               Close All Browsers
Suite Teardown              Close All Browsers

# Running the test suite:
# $python -m robot -d Results Tests/OnlineShopping.robot
# echo $(date "+%Y.%m.%d-%H.%M.%S") && python -m robot -e Draft -d Results/$(date "+%Y.%m.%d-%H.%M.%S") Tests/OnlineShopping.robot

# Running specific test TC17:
# $python -m robot -d Results -i TC17 Tests/OnlineShopping.robot

# Manual Login credentials
# 20140404user@1420.com     dummypassword

*** Test Cases ***
User Registration Test
    [Documentation]             Register a new user on the online shop
    [Tags]                      TC01    01      Smoke       User
    log                         Starting TC01
    RegisterUserApp.Navigate To Login/Signup Page
    RegisterUserApp.Navigate To Signup Details Page
    RegisterUserApp.Fill Information and Create Account

User Login Test
    [Documentation]             Login an existing user on the online shop
    [Tags]                      TC02    02      Smoke       User
    log                         Starting TC02
    LoginUserApp.Navigate To Login/Signup Page
    LoginUserApp.Login with correct credentials

Verify All Products and details are accessible
    [Documentation]             Verifying that the "All Products" and "product details" pages are accessible
    [Tags]                      TC08    08      Smoke       User
    log                         Starting TC08
    AllProductsApp.Click on Products Button
    AllProductsApp.View Details for the First Product

Search for a Desired Product
    [Documentation]             Verifying that the Search feature is operational
    [Tags]                      TC09    09      Smoke       User
    log                         Starting TC09
    AllProductsApp.Click on Products Button
    AllProductsApp.Search for a Product

Add a Desired Product to Cart and Checkout
    [Documentation]             Add a desired product to cart and proceed to Checkout
    [Tags]                      TC14    14      Smoke       User
    log                         Starting TC14
    AllProductsApp.Click on Products Button
    AllProductsApp.Add First Product to Cart
    ShoppingCartApp.New User Checkout
    RegisterUserApp.Navigate To Signup Details Page
    RegisterUserApp.Fill Information and Create Account
    ShoppingCartApp.Logged User Checkout
    ShoppingCartApp.Execute Checkout Process
    ShoppingCartApp.Execute Payment Process
    LoginUserApp.Delete current user account

Remove Products From Cart
    [Documentation]             Add and Remove Products From Cart
    [Tags]                      TC17    17      Smoke       User
    log                         Starting TC17
    AllProductsApp.Click on Products Button
    AllProductsApp.Add First Product to Cart
    ShoppingCartApp.Remove Only Product from Cart

Draft find frames
    [Documentation]             Draft testcase
    [Tags]                      Draft
    AllProductsApp.Click on Products Button
    AllProductsApp.Add First Product to Cart
    ShoppingCartApp.Remove Only Product from Cart
