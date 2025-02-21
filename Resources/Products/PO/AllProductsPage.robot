*** Settings ***
Documentation               Products page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/Misc/PO/Misc.robot
Variables                   Resources/Products/PO/AllProductsPageDetails.yaml
Variables                   Resources/Misc/PO/UserDetails.yaml

*** Keywords ***

Verify All Products title is visible
    [Documentation]         Verify that the all products page is loaded
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate text     ${all_products_page_details}[all_products_txt]
    Misc.Try to locate element  ${all_products_page_details}[featured_items_elm]

Access the First Product
    [Documentation]         Access the first product in the list
    Misc.Scroll to Element  ${all_products_page_details}[add_to_cart1]
    click link              ${all_products_page_details}[product_details_1]

Add the First Product to Cart
    [Documentation]         Add the first product to the shopping cart
    Misc.Scroll to Element  ${all_products_page_details}[add_to_cart1]
    ${product_selected}=    get webelement      ${all_products_page_details}[product_name_elm]
    ${PRODUCT_NAME}         get text    ${product_selected}
    set test variable       ${PRODUCT_NAME}
    ${product_price}=       get webelement      ${all_products_page_details}[product_price_elm]
    ${PRODUCT_PRICE}        get text    ${product_price}
    set test variable       ${PRODUCT_PRICE}
    click element           ${all_products_page_details}[add_to_cart1]

View Shopping Cart
    [Documentation]         View the content of the Cart
    ${cart_modal}           run keyword and return status   page should contain element    ${all_products_page_details}[cart_modal_elm]
    IF    ${cart_modal}
        log                 Cart Modal found, clicking the link
        click element       ${all_products_page_details}[view_cart_modal_elm]
    ELSE
        click link          ${all_products_page_details}[view_cart_link]
    END

View Shopping Cart from PopUp
    [Documentation]         View the content of the Cart
    TRY
        wait until element is visible    ${all_products_page_details}[cart_modal_elm]
        click link          ${all_products_page_details}[view_cart_modal_link]
    EXCEPT
        pause execution     cart modal not visible
    END

Search for Product
    [Documentation]         Search for a given Prodct
    Misc.Consent to cookies and Dismiss Alarms
    input text              ${all_products_page_details}[search_bar_elm]      ${user_details}[searched_product_name]
    click button            ${all_products_page_details}[search_btn]
    page should contain     ${all_products_page_details}[searched_products_txt]
    page should contain element     ${all_products_page_details}[featured_items_elm]

Verify the displayed items in Search Results
    [Documentation]         Verify the number and validity of the items in the search results
    ${counted_items}=       get element count   ${all_products_page_details}[product_elm]
    @{detected_items}=      get webelements     ${all_products_page_details}[product_name_elm]
    ${detected_items_nr}=   get length          ${detected_items}
    should be equal as numbers                  ${counted_items}    ${detected_items_nr}
    FOR         ${element}      IN                  @{detected_items}
        ${element_txt}=         Get Text            ${element}
        should contain any      ${element_txt}      @{all_products_page_details}[product_name_tags]     ignore_case=True
    END