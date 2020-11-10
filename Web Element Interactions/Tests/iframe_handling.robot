*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../Common.robot

Test Setup    Common.Browser Open
Test Teardown    Common.Browser Close

*** Variables ***
${link} =    xpath=//div[@class='card mt-4 top-card'][3]
${iframeLink} =    xpath=(//li[@id='item-2'])[2]
${iframe1} =    //iframe[@id='frame1']
${h1} =     id=sampleHeading
${iframe2} =     //iframe[@id='frame2']
${spanText} =   //span[text()='Automation Tools Tutorial']
${nestedIframe} =    xpath=(//li[@id='item-3'])[2]
${nestedParentFrame} =    xpath=//iframe[@id='frame1']
${parentText} =    xpath=//body[contains(.,'Parent frame')]
${nestedChildFrame} =    xpath=//body[contains(.,'Child Iframe')]

*** Test Cases ***
Test Iframe Interactions
    [Tags]    iframe
    Select Iframes

*** Keywords ***
# Handle IFrame Tests
Select Iframes
    click element    ${link}
    sleep    2 seconds
    execute javascript    window.scrollTo(0,200)
    click element    ${iframeLink}
    sleep    2 seconds

    select frame    ${iframe1}
    ${h1Text}       get text    ${h1}
    should be equal    ${h1Text}    This is a sample page
    unselect frame
    sleep    2 seconds

    execute javascript    window.scrollTo(0,300)
    select frame    ${iframe2}

    set selenium speed    0.5
    execute javascript    window.scrollTo(0,document.body.scrollHeight)
    execute javascript    window.scrollTo(document.body.scrollWidth,0)

    unselect frame
    set selenium speed    0
    execute javascript    window.scrollTo(0,300)

    click element    ${nestedIframe}
    wait until element is visible       ${nestedParentFrame}
    select frame    ${nestedParentFrame}

    ${text}    get text    ${parentText}
    ${text}    convert to lower case       ${text}
    should be equal    ${text}      parent frame

    log    iFrame test successful!
