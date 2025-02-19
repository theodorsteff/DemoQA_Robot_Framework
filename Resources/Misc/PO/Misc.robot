*** Settings ***
Documentation               Misc objects and actions
Library                     SeleniumLibrary
Library                     Dialogs
Library                     DateTime
Library                     String
Variables                   Resources/Misc/PO/MiscDetails.yaml

*** Keywords ***
Consent to cookies and Dismiss Alarms
    sleep                   2
    Check Web Server Error
    Consent to cookies
    Dismiss Alarms
    Dismiss iFrame Ads

Check Web Server Error
    ${web_server_error_txt}     run keyword and return status       page should contain     ${web_server_error_txt}
    IF                      ${web_server_error_txt}
        log                 reloading page
        reload page
    END

Consent to cookies
    [Documentation]         Click on consent button for cookies
    ${cookies_window}=      run keyword and return status    element should be visible    ${misc_details}[consent_btn]
    IF                      ${cookies_window}
        log                 Cookies are visible
        click button        ${misc_details}[consent_btn]
        ELSE
            log             Cookies not visible
    END

Dismiss Alarms
    [Documentation]         Dismiss Alarm popups
    ${alert_window}=        run keyword and return status    handle alert    LEAVE   3
    IF                      ${alert_window}
        log                 Alert window present
        handle alert        DISMISS
        ELSE
            log             Alert window not present
    END

Dismiss iFrame Ads
    [Documentation]                 Dismiss iFrame Ads
    ${iframes1}=                    Get WebElements         ${misc_details}[ad_iframe]
    FOR     ${iframe1}              IN      @{iframes1}
        unselect frame
        log                         iframe level1 detected: ${iframe1}
        ${selecting_frame1}         run keyword and return status       select frame    ${iframe1}
        ${iframes2}=                Get WebElements         ${misc_details}[ad_iframe]
        FOR     ${iframe2}          IN      @{iframes2}
            log                     iframe level2 detected: ${iframe2}
            ${selecting_frame2}     run keyword and return status       select frame    ${iframe2}
            ${iframes3}=            Get WebElements         ${misc_details}[ad_iframe]
            FOR     ${iframe3}      IN      @{iframes3}
                log                 iframe level3 detected: ${iframe3}
                ${selecting_frame3}     run keyword and return status       select frame    ${iframe3}
                ${button_found}         Search for the Dismiss Button within the iFrame     level3
                ${selecting_frame1}     run keyword and return status       select frame    ${iframe1}
                ${selecting_frame2}     run keyword and return status       select frame    ${iframe2}
            END
            ${button_found}         Search for the Dismiss Button within the iFrame     level2
            ${selecting_frame1}     run keyword and return status       select frame    ${iframe1}
        END
        ${button_found}             run keyword and return status        Search for the Dismiss Button within the iFrame     level1
    END

Search for the Dismiss Button within the iFrame
    [Documentation]         Helper Keyword for searching the dismiss button
    [Arguments]             ${frame_level}
    ${button_found}     run keyword and return status       page should contain button      ${misc_details}[dismiss_button]
    IF      ${button_found}
        ${element_clicked}  run keyword and return status       Dismiss ads via Click element   ${frame_level}
    END
    unselect frame
    RETURN              ${button_found}

Dismiss ads via Click element
    [Documentation]         Helper Keyword for dismissing ads via button clicking
    [Arguments]             ${frame_level}
        TRY
            click element    ${misc_details}[dismiss_button]
        EXCEPT
            log             couldn't dismiss ${frame_level} iframe
        END

Dismiss ads via Javascript
    [Documentation]         Helper Keyword for dismissing ads via javascript
    TRY
        ${dismiss_button}=  execute javascript  document.getElementById("dismiss-button")
        ${dismiss_action}=  execute javascript  ${dismiss_button}.click()
        log                 dismiss action result: ${dismiss_action}
    EXCEPT
        log                 javascript execution failed
    END

Try to locate element
    [Documentation]         Helper Keyword for interracting with elements that might not be visible due to overlayed windows/dialogs
    [Arguments]             ${locator}
    set local variable      ${locator_to_be_found}      ${True}
    WHILE                   ${locator_to_be_found}      limit=3
        TRY
            page should contain element     ${locator}
            set local variable              ${locator_to_be_found}      ${False}
        EXCEPT
            log             element ${locator} not found
            Consent to cookies and Dismiss Alarms
            pause execution     Try to locate element
        END
    END

Try to locate text
    [Documentation]         Helper Keyword for interracting with elements that might not be visible due to overlayed windows/dialogs
    [Arguments]             ${locator}
    set local variable      ${locator_to_be_found}      ${True}
    WHILE           ${locator_to_be_found}      limit=3
        TRY
            page should contain     ${locator}
            set local variable      ${locator_to_be_found}      ${False}
        EXCEPT
            log     element ${locator} not found
            Consent to cookies and Dismiss Alarms
            pause execution     Try to locate text
        END
    END

Scroll to Element
    [Documentation]         Helper Keyword for scrolling to a particular element
    [Arguments]             ${locator}
    ${x}=                   Get Horizontal Position     ${locator}
    ${y}=                   Get Vertical Position       ${locator}
    execute javascript      window.scrollTo(${x}, ${y})

Get Child Webelements
    [Documentation]         Helper Keyword for detecting children of a webelement
    [Arguments]             ${locator}
    ${element}              Get WebElement    ${locator}
    ${children}             Call Method
    ...                         ${element}
    ...                         find_elements
    ...                         by=xpath    value=child::*

    RETURN                  ${children}

Get Parent Webelement
    [Documentation]         Helper Keyword for detecting parent of a webelement
    [Arguments]             ${locator}
    ${element}              Get WebElement    ${locator}
    ${parent}               Call Method
    ...                         ${element}
    ...                         find_element
    ...                         by=xpath    value=parent::*

    RETURN                  ${parent}

Get Text of Parent
    [Documentation]         Helper Keyword for detecting the text of a parent webelement
    [Arguments]             ${locator}
    ${parent}=              Misc.Get Parent Webelement      ${locator}
    ${parent_text}=         get text    ${parent}
    RETURN                  ${parent_text}

Generate Random Email
    [Documentation]         Generate a random Email
    [Arguments]             ${username}
    ${random_domain}=       generate random string      10      [LOWER]
    RETURN                  ${username}@${random_domain}.com

Generate Random Username
    [Documentation]         Generate a random String based on the current date and time
    ${epoch_time}=          get current date        result_format=epoch     exclude_millis=yes
    ${random_string}=       convert to string       ${epoch_time}
    RETURN                  ${random_string}
