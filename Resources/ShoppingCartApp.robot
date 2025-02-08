*** Settings ***
Documentation               Register User Application module
Resource                    Resources/PO/CartPage.robot
Resource                    Resources/PO/CheckoutPage.robot
Resource                    Resources/PO/PaymentPage.robot
Resource                    Resources/PO/OrderPlacedPage.robot

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