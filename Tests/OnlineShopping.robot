*** Settings ***
Documentation               This is a demo project based on https://automationexercise.com/test_cases
Resource                    Resources/Account/RegisterUserActions.robot
Resource                    Resources/Account/LoginUserActions.robot
Resource                    Resources/General/GeneralActions.robot
Resource                    Resources/Products/AllProductsActions.robot
Resource                    Resources/Checkout/ShoppingCartActions.robot
Test Teardown               Close All Browsers
Suite Teardown              Close All Browsers

*** Test Cases ***

User Registration Test
    [Documentation]             Register a new user on the online shop
    [Tags]                      TC01    01      Smoke       User
    log                         Starting TC01
    GeneralActions.Navigate To Login/Signup Page
    RegisterUserActions.Navigate To Signup Details Page
    RegisterUserActions.Fill Information and Create Account

User Login Test
    [Documentation]             Login an existing user on the online shop
    [Tags]                      TC02    02      Smoke       User
    log                         Starting TC02
    GeneralActions.Navigate To Login/Signup Page
    LoginUserActions.Login with correct credentials

Verify All Products and details are accessible
    [Documentation]             Verifying that the "All Products" and "product details" pages are accessible
    [Tags]                      TC08    08      Smoke       User
    log                         Starting TC08
    AllProductsActions.Click on Products Button
    AllProductsActions.View Details for the First Product

Search for a Desired Product
    [Documentation]             Verifying that the Search feature is operational
    [Tags]                      TC09    09      Smoke       User
    log                         Starting TC09
    AllProductsActions.Click on Products Button
    AllProductsActions.Search for a Product

Add a Desired Product to Cart and Checkout
    [Documentation]             Add a desired product to cart and proceed to Checkout
    [Tags]                      TC14    14      Smoke       User
    log                         Starting TC14
    AllProductsActions.Click on Products Button
    AllProductsActions.Add First Product to Cart
    ShoppingCartActions.New User Checkout
    RegisterUserActions.Navigate To Signup Details Page
    RegisterUserActions.Fill Information and Create Account
    ShoppingCartActions.Logged User Checkout
    ShoppingCartActions.Execute Checkout Process
    ShoppingCartActions.Execute Payment Process
    LoginUserActions.Delete current user account

Remove Products From Cart
    [Documentation]             Add and Remove Products From Cart
    [Tags]                      TC17    17      Smoke       User
    log                         Starting TC17
    AllProductsActions.Click on Products Button
    AllProductsActions.Add First Product to Cart
    ShoppingCartActions.Remove Only Product from Cart
