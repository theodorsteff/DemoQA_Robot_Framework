*** Settings ***
Documentation               Account created page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/PO/Misc.robot
Variables                   Resources/PO/DeletedAccountPageDetails.yaml

*** Keywords ***
Confirm and Continue
    Verify Account Deleted Is Visible
    Click Continue

Verify Account Deleted Is Visible
    [Documentation]         Verify that the account deletion confirmation is visible
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate text     ${deleted_account_page_details}[deleted_conf_txt]

Click Continue
    [Documentation]         Click on the "Continue" button
    click element           ${deleted_account_page_details}[continue_btn]
