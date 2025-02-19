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
    CartPage.Checkout New User

Logged User Checkout
    CartPage.Load Shopping Cart
    CartPage.Checkout Logged User

Execute Checkout Process
    CheckoutPage.Checkout Process

Execute Payment Process
    PaymentPage.Payment Process
    OrderPlacedPage.Confirm and Continue