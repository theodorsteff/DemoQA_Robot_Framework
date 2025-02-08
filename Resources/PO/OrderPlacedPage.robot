*** Settings ***
Documentation               Account created page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/PO/Misc.robot
Variables                   Resources/PO/OrderPlacedPageDetails.yaml

*** Keywords ***
Confirm and Continue
    Verify Order Confirmation Is Visible
    Click Continue

Verify Order Confirmation Is Visible
    [Documentation]         Verify that the account information is visible
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate text     ${order_placed_page_details}[confirmation_txt]

Click Continue
    [Documentation]         Click on the "Continue" button
    click element           ${confirmation_page_details}[continue_btn]
