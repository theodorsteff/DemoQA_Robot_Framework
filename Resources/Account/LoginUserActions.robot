*** Settings ***
Documentation               Register User Application module
Resource                    Resources/Home/PO/LandingPage.robot
Resource                    Resources/Account/PO/LoginSignupPage.robot
Resource                    Resources/Account/PO/UserLoggedPage.robot
Resource                    Resources/Account/PO/DeletedAccountPage.robot

*** Keywords ***

Login with correct credentials
    LoginSignupPage.Verify the Login Page
    LoginSignupPage.Login with Correct Credentials
    LoginSignupPage.Click Login Button
    UserLoggedPage.Verify User is Logged In

Delete current user account
    UserLoggedPage.Delete user account
    DeletedAccountPage.Verify Account Deleted Is Visible
    DeletedAccountPage.Click Continue