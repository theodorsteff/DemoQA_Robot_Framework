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
    NewSignupPage.Enter Details and Create Account
    AccountCreatedPage.Confirm and Continue
    UserLoggedPage.Verify User is Logged In
