*** Settings ***
Documentation               Products page objects and actions
Library                     SeleniumLibrary
Library                     Collections
Resource                    Resources/Misc/PO/Misc.robot
Resource                    Resources/Products/PO/AllProductsPage.robot
Variables                   Resources/Misc/PO/UserDetails.yaml
Variables                   Resources/Checkout/PO/CheckoutPageDetails.yaml
Variables                   Resources/Account/PO/NewSignupPageDetails.yaml

*** Keywords ***

Verify the Checkout Page
    [Documentation]         Verify that the checkout page is loaded
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate text     ${checkout_page_details}[checkout_txt]

Verify Address Details
    [Documentation]         Verify the address details
    @{address_details}=     create list     ${user_details}[personal_title]     ${user_details}[first_name]     ${user_details}[last_name]      ${user_details}[mobile_number]
    append to list          ${address_details}      ${user_details}[address]        ${user_details}[country]        ${user_details}[state]      ${user_details}[city]       ${user_details}[zipcode]
    FOR     ${element}          IN              @{address_details}
        page should contain     ${element}
    END

Review Order
    [Documentation]         Review the products in the order
    Misc.Scroll to Element  ${checkout_page_details}[order_msg_label]
    page should contain     ${PRODUCT_NAME}
    page should contain     ${PRODUCT_PRICE}

Add Order Comment
    [Documentation]         Add order commentary
    Misc.Scroll to Element  ${new_signup_page_details}[subscribe_elm]
    input text              ${checkout_page_details}[text_area]         ${checkout_page_details}[text_comment]

Click Place Order
    [Documentation]         Click on the Place Order link
    click link              ${checkout_page_details}[place_order_link]