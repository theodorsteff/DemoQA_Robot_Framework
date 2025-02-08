*** Settings ***
Documentation               Account created page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/PO/Misc.robot
Resource                    Resources/PO/LoginSignupPage.robot
Variables                   Resources/PO/UserLoggedPageDetails.yaml

*** Keywords ***
Verify User is Logged In
    [Documentation]         Verify that the user is logged in
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate element      ${user_logged_page_details}[conf_elem_txt]
    page should contain     ${user_logged_page_details}[conf_txt]       ${RANDOM_USER_TC}

Delete user account
    [Documentation]         Click on delete user account
    click link              ${user_logged_page_details}[delete_account_txt]