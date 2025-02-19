*** Settings ***
Documentation               Login/SignUp page objects and actions
Library                     SeleniumLibrary
Resource                    Resources/Misc/PO/Misc.robot
Variables                   Libraries/DynamicVariables.py
Variables                   Resources/Misc/PO/UserDetails.yaml
Variables                   Resources/Account/PO/LoginSignupPageDetails.yaml

*** Keywords ***

Verify the Login Page
    [Documentation]         Verify that the login page is loaded
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate element      ${login_signup_page_details}[login_txt]

Login with Correct Credentials
    [Documentation]         Enter the correct email and password to Login
    ${persistent_user_tc01}=    run keyword and return status       should contain any      ${TEST TAGS}        @{login_signup_page_details}[persistent_user_tc01]      ignore_case=True
    IF      ${persistent_user_tc01}
        set test variable    ${RANDOM_USER_TC}       ${RANDOM_USER_TC01}
        set test variable    ${RANDOM_EMAIL_TC}      ${RANDOM_EMAIL_TC01}
    END
    Enter Email and Password to Login       ${RANDOM_EMAIL_TC}     ${user_details}[personal_pass]

Enter Email and Password to Login
    [Arguments]             ${user_email}       ${user_password}
    TRY
        input text              ${login_signup_page_details}[login_email_css]       ${user_email}
        input text              ${login_signup_page_details}[login_pass_css]        ${user_password}
    EXCEPT
        log     Login failed
    END

Click Login Button
    [Documentation]         Click on the Login Button Element
    click element           ${login_signup_page_details}[login_btn_elm]

Verify the SignUp Page
    [Documentation]         Verify that the signup page is loaded
    Misc.Consent to cookies and Dismiss Alarms
    Misc.Try to locate element      ${login_signup_page_details}[signup_txt]

Enter Name And Email to SignUp
    [Documentation]         Enter the username and email to SignUp
    ${RANDOM_USER_TC}=      Misc.Generate Random Username
    ${RANDOM_EMAIL_TC}=     Misc.Generate Random Email     ${RANDOM_USER_TC}
    set test variable       ${RANDOM_USER_TC}
    set test variable       ${RANDOM_EMAIL_TC}
    ${persistent_user_tc01}=    run keyword and return status       should contain any      ${TEST TAGS}        @{login_signup_page_details}[persistent_user_tc01]      ignore_case=True
    IF      ${persistent_user_tc01}
        set suite variable    ${RANDOM_USER_TC01}       ${RANDOM_USER_TC}
        set suite variable    ${RANDOM_EMAIL_TC01}      ${RANDOM_EMAIL_TC}
    END
    input text              ${login_signup_page_details}[signup_name_css]       ${RANDOM_USER_TC}
    input text              ${login_signup_page_details}[signup_email_css]      ${RANDOM_EMAIL_TC}

Click Signup Button
    [Documentation]         Click on the Singup Button Element
    click element           ${login_signup_page_details}[signup_btn_elm]