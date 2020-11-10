*** Settings ***
Library    SeleniumLibrary
Resource   ../Common.robot

Test Setup    Common.Browser Open
Test Teardown    Common.Browser Close

*** Variables ***
${link} =    xpath=//div[@class='card mt-4 top-card'][3]
${alertLink} =    xpath=(//li[@id='item-1'])[2]
${alertBtn} =     xpath=//button[@id='alertButton']
${timeAlertBtn} =   id=timerAlertButton
${confirmAlert} =   id=confirmButton
${cnfrmTxt} =    xpath=//span[@id='confirmResult']
${promptAlert} =    id=promtButton
${promptTxt} =   xpath=//span[@id='promptResult']

*** Test Cases ***
Test Alert Handling
    [Tags]    alerts
    Handling Alerts

*** Keywords ***
# Switch Window Tests
Handling Alerts
    click element    ${link}
    sleep    2 seconds
    execute javascript    window.scrollTo(0,200)
    click element    ${alertLink}

    mouse over    ${alertBtn}
    click button    ${alertBtn}
    ${alertMsg}    handle alert    LEAVE
    sleep    2 seconds
    handle alert

    click element    ${timeAlertBtn}
    sleep    6 seconds
    ${alertMsg}     handle alert
    sleep    2 seconds

    click button    ${confirmAlert}
    sleep    2 seconds
    handle alert    DISMISS
    ${confirmationText}     get text    ${cnfrmTxt}
    should contain    ${confirmationText}   Cancel      ignore_case=True
    sleep    1 seconds

    click button    ${promptAlert}
    sleep    2 seconds
    input text into alert    Hi Alert!      ACCEPT
    wait until element is visible    ${promptTxt}
    sleep    1 seconds
    ${promptMessage}    get text    ${promptTxt}
    should contain    Alert!

    sleep   1 seconds
    log    alert tests are successful!









