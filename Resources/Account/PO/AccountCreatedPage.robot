*** Settings ***
Documentation               Account created page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/Misc/PO/Misc.robot
Variables                   Resources/Account/PO/AccountCreatedPageDetails.yaml

*** Keywords ***

Verify Confirmation Is Visible
    [Documentation]         Verify that the account information is visible
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate element      ${confirmation_page_details}[confirmation_elm]

Click Continue
    [Documentation]         Click on the "Continue" button
    click element           ${confirmation_page_details}[continue_btn]
