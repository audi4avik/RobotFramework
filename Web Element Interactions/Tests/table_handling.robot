*** Settings ***
Library    SeleniumLibrary
Library    Collections
Test Setup      Begin Test
Test Teardown    End Test

*** Variables ***
${browser} =    chrome
${baseUrl} =    https://www.w3schools.com/html/html_tables.asp
${tableTxt} =     //span[text()='Tables']
${tryBtn} =     //a[@class='w3-btn w3-margin-top w3-margin-bottom']
${tableHeader} =    //table[@id='customers']//th
${tableId} =    id=customers
@{headerList} =

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
    wait until element is visible    ${tableTxt}
    scroll element into view    ${tryBtn}

    # get all table data
    ${headerCount}    get element count    ${tableHeader}
    ${headerCount}    evaluate    ${headerCount}+1
    FOR     ${index}    IN RANGE    1    ${headerCount}
            ${columnHeader}    get text    xpath=//table[@id='customers']//th[${index}]
            append to list    ${headerList}     ${columnHeader}
    END

    ${tableHead}    Get Slice From List   ${headerList}

    table header should contain    ${tableId}    Company
    table row should contain       ${tableId}    4   Ernst Handel
    table column should contain    ${tableId}    2   Yoshi Tannamuri
    table cell should contain      ${tableId}    3   3    Mexico