*** Settings ***
Documentation               Register User Application module
Resource                    Resources/Checkout/PO/CartPage.robot
Resource                    Resources/Checkout/PO/CheckoutPage.robot
Resource                    Resources/Checkout/PO/PaymentPage.robot
Resource                    Resources/Checkout/PO/OrderPlacedPage.robot

*** Keywords ***
Remove Only Product from Cart
    CartPage.Remove the Only Product from Cart

New User Checkout
    CartPage.Verify the Shopping Cart Page
    CartPage.Click Register from Checkout

Logged User Checkout
    CartPage.Click on Cart Link
    CartPage.Verify the Shopping Cart Page
    CartPage.Proceed to Checkout

Execute Checkout Process
    CheckoutPage.Verify the Checkout Page
    CheckoutPage.Verify Address Details
    CheckoutPage.Review Order
    CheckoutPage.Add Order Comment
    CheckoutPage.Click Place Order

Execute Payment Process
    PaymentPage.Verify the Payment Page
    PaymentPage.Enter banking information
    PaymentPage.Click Pay and Confirm Order
    OrderPlacedPage.Verify Order Confirmation Is Visible
    OrderPlacedPage.Click Continue