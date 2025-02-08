*** Settings ***
Documentation               Register User Application module
Resource                    Resources/PO/LandingPage.robot
Resource                    Resources/PO/LoginSignupPage.robot
Resource                    Resources/PO/NewSignupPage.robot
Resource                    Resources/PO/AccountCreatedPage.robot
Resource                    Resources/PO/UserLoggedPage.robot

*** Keywords ***
Navigate To Login/Signup Page
    LandingPage.Load
    LandingPage.Access Login/Signup

Navigate To Signup Details Page
    LoginSignupPage.Enter Details and Click SignUp

Fill Information and Create Account
    NewSignupPage.Enter Details and Create Account
    AccountCreatedPage.Confirm and Continue
    UserLoggedPage.Verify User is Logged In
