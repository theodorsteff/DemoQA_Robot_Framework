*** Settings ***
Documentation               New SignUp page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/Misc/PO/Misc.robot
Variables                   Resources/Account/PO/NewSignupPageDetails.yaml
Variables                   Resources/Misc/PO/UserDetails.yaml

*** Keywords ***
Enter Details and Create Account
    Verify Information Request Is Visible
    Fill account information
    Mark checkboxes
    Fill address information
    Submit information

Verify Information Request Is Visible
    [Documentation]         Verify that the account information is visible
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate element      ${new_signup_page_details}[account_info_txt]

Fill account information
    select radio button             ${new_signup_page_details}[title_radio_btn]     ${user_details}[personal_title]
    input text                      ${new_signup_page_details}[input_pass_txt]      ${user_details}[personal_pass]
    Misc.Scroll to Element          ${new_signup_page_details}[input_first_name_txt]
    select from list by value       ${new_signup_page_details}[birth_day_elm]       ${user_details}[birth_day]
    select from list by label       ${new_signup_page_details}[birth_month_elm]     ${user_details}[birth_month]
    select from list by value       ${new_signup_page_details}[birth_year_elm]      ${user_details}[birth_year]

Mark checkboxes
    click element                   ${new_signup_page_details}[newsletter_elm]
    click element                   ${new_signup_page_details}[optin_elm]

Fill address information
    input text                      ${new_signup_page_details}[input_first_name_txt]    ${user_details}[first_name]
    input text                      ${new_signup_page_details}[input_last_name_txt]     ${user_details}[last_name]
    input text                      ${new_signup_page_details}[input_address_txt]       ${user_details}[address]
    select from list by label       ${new_signup_page_details}[country_elm]             ${user_details}[country]
    input text                      ${new_signup_page_details}[input_state_txt]         ${user_details}[state]
    input text                      ${new_signup_page_details}[input_city_txt]          ${user_details}[city]
    input text                      ${new_signup_page_details}[input_zipcode_txt]       ${user_details}[zipcode]
    input text                      ${new_signup_page_details}[input_mobile_txt]        ${user_details}[mobile_number]

Submit information
    Misc.Scroll to Element          ${new_signup_page_details}[subscribe_elm]
    click element                   ${new_signup_page_details}[create_acc_btn]