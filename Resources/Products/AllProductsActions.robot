*** Settings ***
Documentation               Register User Application module
Resource                    Resources/Home/PO/LandingPage.robot
Resource                    Resources/Products/PO/AllProductsPage.robot
Resource                    Resources/Products/PO/ProductPage.robot
Resource                    Resources/Checkout/PO/CartPage.robot

*** Keywords ***
Click on Products Button
    LandingPage.Open the Home_URL
    LandingPage.Verify the Landing Page
    LandingPage.Click Products

View Details for the First Product
    AllProductsPage.Verify All Products title is visible
    AllProductsPage.Access the First Product
    ProductPage.Verify Product Details is Displayed
    ProductPage.Verify Required Details Fields Exist
    ProductPage.Verify Required Details are Filled

Search for a Product
    AllProductsPage.Verify All Products title is visible
    AllProductsPage.Search for Product
    AllProductsPage.Verify the displayed items in Search Results

Add First Product to Cart
    AllProductsPage.Verify All Products title is visible
    AllProductsPage.Add the First Product to Cart
    AllProductsPage.View Shopping Cart from PopUp
