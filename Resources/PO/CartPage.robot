*** Settings ***
Documentation               Products page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/PO/Misc.robot
Variables                   Resources/PO/CartPageDetails.yaml

*** Keywords ***
Load Shopping Cart
    Click on Cart Link
    Verify the Shopping Cart Page

Checkout New User
    Verify the Shopping Cart Page
    Click Register from Checkout

Checkout Logged User
    Proceed to Checkout

Verify the Shopping Cart Page
    [Documentation]         Verify that the shopping cart page is loaded
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate text     ${cart_page_details}[shopping_cart_txt]

Click on Cart Link
    [Documentation]         Load the Shopping Cart via link text
    click link              ${cart_page_details}[shopping_cart_link]

Remove the Only Product from Cart
    [Documentation]         Remove the first product from the shopping cart
    Verify the Shopping Cart Page
    Misc.Scroll to Element  ${cart_page_details}[delete_from_cart1]
    click element           ${cart_page_details}[delete_from_cart1]
    page should contain     ${cart_page_details}[empty_cart_txt]

Click Register from Checkout
    [Documentation]         Proceed to the checkout as new user
    Proceed to Checkout
    wait until element is visible    ${cart_page_details}[checkout_modal_elm]
    click link              ${cart_page_details}[register_login_link]

Proceed to Checkout
    [Documentation]         Proceed to checkout
    click element           class=check_out