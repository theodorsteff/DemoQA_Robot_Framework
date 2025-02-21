*** Settings ***
Documentation               Register User Application module
Resource                    Resources/Home/PO/LandingPage.robot
Resource                    Resources/Account/PO/LoginSignupPage.robot
Resource                    Resources/Account/PO/NewSignupPage.robot
Resource                    Resources/Account/PO/AccountCreatedPage.robot
Resource                    Resources/Account/PO/UserLoggedPage.robot

*** Keywords ***

Navigate To Signup Details Page
    LoginSignupPage.Verify the SignUp Page
    LoginSignupPage.Enter Name And Email to SignUp
    LoginSignupPage.Click Signup Button

Fill Information and Create Account
    NewSignupPage.Verify Information Request Is Visible
    NewSignupPage.Fill account information
    NewSignupPage.Mark checkboxes
    NewSignupPage.Fill address information
    NewSignupPage.Submit information
    AccountCreatedPage.Verify Confirmation Is Visible
    AccountCreatedPage.Click Continue
    UserLoggedPage.Verify User is Logged In
