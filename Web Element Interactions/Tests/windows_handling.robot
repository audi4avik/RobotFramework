*** Settings ***
Library    SeleniumLibrary
Resource   ../Common.robot

Test Setup    Common.Browser Open
Test Teardown    Common.Browser Close

*** Variables ***
${link} =           xpath=//div[@class='card mt-4 top-card'][3]
${windowLink} =     xpath=(//li[@id='item-0'])[3]
${newTab} =         id=tabButton
${newWindow} =      id=windowButton
${newWindowMsg} =   id=messageWindowButton
${bodyTxt} =        /html/body
${modalLink} =      xpath=(//li[@id='item-4'])[2]
${smallModal} =     id=showSmallModal
${modalBody} =      xpath=//div[@class='modal-dialog modal-sm']//div[@class='modal-body']
${smallModalClose} =    id=closeSmallModal
${largeModal} =     id=showLargeModal
${largeModalClose} =    id=closeLargeModal


*** Test Cases ***
Test Switch Windows
    [Tags]    switch window
    Switching Windows

Test Modal Handling
    [Tags]    modal
    Modal Handling

*** Keywords ***
# Switch Window Tests
Switching Windows
    click element    ${link}
    sleep    2 seconds
    click element    ${windowLink}
    wait until element is visible       ${newTab}

    click button    ${newTab}
    ${windowHandles}    get window handles

    set selenium speed    0.5
    switch window   ${windowHandles}[1]
    ${url}    get location
    should contain    ${url}    demoqa.com/sample
    sleep    1 seconds
    close window
    switch window   ${windowHandles}[0]

    click button    ${newWindow}
    ${windowTitles}     get window titles
    sleep    1 seconds

    click button    ${newWindowMsg}
    sleep    1 seconds
    close window

    log    windows handling test is successful!

Modal Handling
    click element    ${link}
    sleep    2 seconds
    execute javascript    window.scrollTo(0,300)
    click element    ${modalLink}
    wait until element is visible       ${smallModal}

    mouse over    ${smallModal}
    sleep    1 seconds
    click element   ${smallModal}
    sleep    2 seconds

    ${smallModalTxt}       get text     ${modalBody}
    should contain    ${smallModalTxt}      This is a small modal. It has very less content       ignore_case=True

    click element       ${smallModalClose}
    sleep   2 seconds

    mouse over    ${largeModal}
    sleep       1 seconds
    click element    ${largeModal}
    sleep    2 seconds
    click button    ${largeModalClose}
    sleep    1 seconds
    log     modal handling test is successful!
