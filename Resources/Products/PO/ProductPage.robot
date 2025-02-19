*** Settings ***
Documentation               Products page objects and actions
Library                     SeleniumLibrary
Library                     String
Resource                    Resources/Misc/PO/Misc.robot
Variables                   Resources/Products/PO/ProductPageDetails.yaml

*** Keywords ***
View Details for the Selected Product
    Verify Product Details is Displayed
    Verify Required Details Fields Exist
    Verify Required Details are Filled

Verify Product Details is Displayed
    [Documentation]         Verify that the product details page is loaded
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate element      ${product_page_details}[prod_details_elm]

Verify Required Details Fields Exist
    [Documentation]         Verify that the required product details fields exist
    page should contain element     ${product_page_details}[product_name]
    page should contain element     ${product_page_details}[category]
    page should contain element     ${product_page_details}[price]
    page should contain element     ${product_page_details}[availability]
    page should contain element     ${product_page_details}[condition]
    page should contain element     ${product_page_details}[brand]

Verify Required Details are Filled
    [Documentation]         Verify that the required product details are filled
    ${PROD_NAME}=       get text    ${product_page_details}[product_name]
    ${PROD_CATEG}=      get text    ${product_page_details}[category]
    ${PROD_PRICE}=      get text    ${product_page_details}[price]
    ${PROD_AV_FULL}=    Misc.Get Text of Parent    ${product_page_details}[availability]
    ${PROD_CD_FULL}=    Misc.Get Text of Parent    ${product_page_details}[condition]
    ${PROD_BD_FULL}=    Misc.Get Text of Parent    ${product_page_details}[brand]
    @{words}=           split string    ${PROD_AV_FULL}   :${SPACE}
    ${PROD_AVAIL}       set variable    ${words}[1]
    @{words}=           split string    ${PROD_CD_FULL}   :${SPACE}
    ${PROD_COND}        set variable    ${words}[1]
    @{words}=           split string    ${PROD_BD_FULL}   :${SPACE}
    ${PROD_BRAND}       set variable    ${words}[1]
    TRY
        should not be empty             ${PROD_NAME}
        should not be empty             ${PROD_CATEG}
        should not be empty             ${PROD_PRICE}
        should not be empty             ${PROD_AVAIL}
        should not be empty             ${PROD_COND}
        should not be empty             ${PROD_BRAND}
    EXCEPT
        log             Product Details are not correctly filled
    END