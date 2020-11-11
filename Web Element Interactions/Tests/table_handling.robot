*** Settings ***
Library    SeleniumLibrary
Library    Collections
Test Setup      Begin Test
Test Teardown    End Test

*** Variables ***
${browser} =    chrome
${baseUrl} =    https://www.techlistic.com/p/demo-selenium-practice.html
${headerTxt} =    Demo Web Table for Practicing Selenium Webdriver
${tableHeader} =    (//table/thead/tr/th)

*** Test Cases ***
Test Table Element Interaction
    [Tags]    table
    Validate Table Handling

*** Keywords ***
Begin Test
    open browser    about:blank     ${browser}
    maximize browser window

End Test
    close all browsers

Validate Table Handling

    go to   ${baseUrl}
    wait until page contains    ${headerTxt}

    # get all table data
    ${headerCount}    get element count    ${tableHeader}
    FOR     ${elem}    IN RANGE    ${headerCount}
            ${columnHeader}    get text    ${tableHeader}[${elem}]
    END

