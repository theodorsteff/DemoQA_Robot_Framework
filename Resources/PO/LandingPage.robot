*** Settings ***
Documentation               Landing page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/PO/Misc.robot
Variables                   Resources/PO/LandingPageDetails.yaml

*** Keywords ***
Load
    Open the Home_URL
    Verify the Landing Page

Access Login/Signup
    Click Login/Signup

Access Products
    Click Products

Open the Home_URL
    [Documentation]         Open the browser and navigate to the URL
    open browser            ${landing_page_details}[home_url]       ${landing_page_details}[browser_used]
    maximize browser window

Verify the Landing Page
    [Documentation]         Verify that the landing page is loaded
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate text    ${landing_page_details}[landing_page_txt]

Click Login/SignUp
    [Documentation]         Click on the Login/SignUp button
    click element           ${landing_page_details}[signup_login_btn]

Click Products
    [Documentation]         Click on the Products button
    click element           ${landing_page_details}[products_btn]
