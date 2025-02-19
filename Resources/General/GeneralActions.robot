*** Settings ***
Documentation               General user actions
Resource                    Resources/Home/PO/LandingPage.robot

*** Keywords ***
Navigate To Login/Signup Page
    LandingPage.Open the Home_URL
    LandingPage.Verify the Landing Page
    LandingPage.Click Login/SignUp