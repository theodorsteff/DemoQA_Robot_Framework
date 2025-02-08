*** Settings ***
Documentation               Register User Application module
Resource                    Resources/PO/LandingPage.robot
Resource                    Resources/PO/AllProductsPage.robot
Resource                    Resources/PO/ProductPage.robot
Resource                    Resources/PO/CartPage.robot

*** Keywords ***
Click on Products Button
    LandingPage.Load
    LandingPage.Click Products

View Details for the First Product
    AllProductsPage.Verify All Products title is visible
    AllProductsPage.Access the First Product
    ProductPage.View Details for the Selected Product

Search for a Product
    AllProductsPage.Verify All Products title is visible
    AllProductsPage.Search for Product
    AllProductsPage.Verify the displayed items in Search Results

Add First Product to Cart
    AllProductsPage.Verify All Products title is visible
    AllProductsPage.Add the First Product to Cart
    AllProductsPage.View Shopping Cart from PopUp
