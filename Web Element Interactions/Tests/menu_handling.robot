*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    OperatingSystem
Library    DateTime
Resource   ../Common.robot

Test Setup    Common.Browser Open
Test Teardown    Common.Browser Close

*** Variables ***
${widgetLink} =     https://demoqa.com/widgets
${menuLink} =     xpath=(//li[@id='item-7'])[2]
${menuTwo} =      xpath=//a[contains(text(),'Item 2')]
${subMenuTwo} =    xpath=//a[contains(text(),'SUB SUB LIST')]
${subMenuThree} =       xpath=//a[contains(text(),'Sub Item 2')]
${selectLink} =     xpath=(//li[@id='item-8'])[2]
${selectHeader} =    xpath=//div[text()='Select Menu']
${selectValue} =     id=withOptGroup
${oldSelect} =     xpath=//select[@id='oldSelectMenu']
${multiSelect} =   xpath=(//div[@class=' css-1hwfws3'])[3]
${oldMultiSelect} =     id=cars

*** Test Cases ***
Test Widget Handling
    [Tags]    widget
    Menu
    Select

*** Keywords ***
# Switch Window Tests
Menu
    go to   ${widgetLink}
    sleep    2 seconds
    execute javascript    window.scrollTo(0,600)
    click element    ${menuLink}
    wait until element is visible      ${menuTwo}

    mouse over    ${menuTwo}
    mouse over    ${subMenuTwo}
    mouse over    ${subMenuThree}

    click element    ${subMenuThree}
    sleep    1 seconds

Select
    execute javascript    window.scrollTo(0,600)
    click element    ${selectLink}
    wait until element is visible    ${selectHeader}
    click element    ${selectValue}
    press keys       ${selectValue}     A root option      TAB
    sleep    1 seconds

    set selenium speed    0.5
    set focus to element    ${oldSelect}
    select from list by label    ${oldSelect}     Yellow
    select from list by value    ${oldSelect}     6
    sleep    1 seconds

    set focus to element    ${multiSelect}
    press keys    ${multiSelect}     green     TAB     blu     TAB     black       TAB
    sleep    1 seconds

    set focus to element    ${oldMultiSelect}
    select all from list    ${oldMultiSelect}
    ${listValues}       get selected list labels        ${oldMultiSelect}
    list should contain value   ${listValues}    Volvo
    set selenium speed    0

    log    All tests are successfully completed!







