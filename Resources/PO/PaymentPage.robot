*** Settings ***
Documentation               Products page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/PO/Misc.robot
Variables                   Resources/PO/PaymentPageDetails.yaml

*** Keywords ***
Payment Process
    Verify the Payment Page
    Enter banking information
    Click Pay and Confirm Order

Verify the Payment Page
    [Documentation]         Verify that the checkout page is loaded
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate text    ${payment_page_details}[payment_txt]

Enter banking information
    [Documentation]         Enter the banking card details
    TRY
        input text          ${payment_page_details}[name_on_card_css]       ${payment_page_details}[name_on_card_txt]
        input text          ${payment_page_details}[card_number_css]        ${payment_page_details}[card_number_txt]
        input text          ${payment_page_details}[cvc_number_css]         ${payment_page_details}[cvc_number_txt]
        input text          ${payment_page_details}[expiry_month_css]       ${payment_page_details}[expiry_month_txt]
        input text          ${payment_page_details}[expiry_year_css]         ${payment_page_details}[expiry_year_txt]
    EXCEPT
        log                 Banking details couldn't be inserted
    END

Click Pay and Confirm Order
    [Documentation]         Click to pay and confirm the order
    Misc.Scroll to Element  ${new_signup_page_details}[subscribe_elm]
    click button            ${payment_page_details}[pay_button_txt]