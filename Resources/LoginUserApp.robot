*** Settings ***
Documentation               Register User Application module
Resource                    Resources/PO/LandingPage.robot
Resource                    Resources/PO/LoginSignupPage.robot
Resource                    Resources/PO/UserLoggedPage.robot
Resource                    Resources/PO/DeletedAccountPage.robot

*** Keywords ***
Navigate To Login/Signup Page
    LandingPage.Load
    LandingPage.Access Login/Signup

Login with correct credentials
    LoginSignupPage.Enter Correct Credentials and Click Login
    UserLoggedPage.Verify User is Logged In

Delete current user account
    UserLoggedPage.Delete user account
    DeletedAccountPage.Confirm and Continue