*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    OperatingSystem
Resource   ../Common.robot

Test Setup    Common.Browser Open
Test Teardown    Common.Browser Close

*** Variables ***
${link} =           xpath=//div[@class='card mt-4 top-card'][1]
${tableLink} =      xpath=(//li[@id='item-3'])[1]
${addRecordBtn} =   id=addNewRecordButton
${modalBody} =      xpath=//div[@class='modal-content']
${modalTitle} =     id=registration-form-modal
${firstName} =      //input[@id='firstName']
${lastName} =       //input[@id='lastName']
${emailId} =        id=userEmail
${ageField} =       id=age
${salaryField} =    id=salary
${deptField} =      id=department
${submitBtn} =      //button[@id='submit']
${searchBox} =      id=searchBox
${fetchSalary} =     (//div[@class='rt-tr-group']//div[@class='rt-td'][5])
${deleteRecord} =    xpath=//div[@class='action-buttons']/span[2]
${uploadLink} =      https://demoqa.com/upload-download
${fileDwnldBtn} =    xpath=//a[@id='downloadButton']
${fileUpldBtn} =     xpath=//input[@id='uploadFile']
${dynamicPropertyLink} =    https://demoqa.com/dynamic-properties
${dynamicParagraph} =       xpath=//div[@class='container playgound-body']/div[@class='row']//p
${enableBtn} =    id=enableAfter
${visibleBtn} =   id=visibleAfter

*** Test Cases ***
Test Elements Handling
    [Tags]    elem
    Table Handling
    File Handling
    Dynamic Elements

*** Keywords ***
# Switch Window Tests
Table Handling
    click element    ${link}
    sleep    2 seconds
    execute javascript    window.scrollTo(0,150)
    click element    ${tableLink}
    sleep    1 seconds

    click button    ${addRecordBtn}
    sleep    1 seconds

    set focus to element    ${modalBody}
    ${modalHeaderTxt}      get text    ${modalTitle}
    should contain      ${modalHeaderTxt}         Registration Form

    input text    ${firstName}      Avik
    input text    ${lastName}       D
    ${email}    generate random string    6   [LOWER]
    input text    ${emailId}        ${email}@xyz.com
    ${age}      generate random string    2     [NUMBERS]
    input text    ${ageField}       ${age}
    input text    ${salaryField}    50000
    input text    ${deptField}      Information Technology
    click button    ${submitBtn}

    sleep      2 seconds

    input text    ${searchBox}      ${email}@xyz.com
    sleep    1 seconds
    ${expectedSal}      get text    ${fetchSalary}
    run keyword if    ${expectedSal} == 50000       Success keyword
    ...     ELSE      Oops Keyword

Success keyword
    log    inserted data on the table successfully!
    sleep   1 seconds
    click element      ${deleteRecord}
    reload page
    sleep   1 seconds
    set screenshot directory    ${screenshotDir}
    capture page screenshot

Oops Keyword
    log    something went wrong, please check the logs.


File Handling
    go to    ${uploadLink}
    wait until element is visible    ${fileDwnldBtn}

    click element    ${fileDwnldBtn}
    sleep   2 seconds
    get modified time   ${dwnldDir}
    ${fileList}     list files in directory    ${dwnldDir}
    list should contain value    ${fileList}    sampleFile.jpeg

    mouse over    ${fileUpldBtn}
    choose file      ${fileUpldBtn}     ${dwnldDir}sampleFile.jpeg
    sleep    2 seconds

    log    file handling was tested successfully!

Dynamic Elements
    go to    ${dynamicPropertyLink}
    wait until element is visible    ${dynamicParagraph}
    ${elemTxt}    get text    ${dynamicParagraph}
    should be equal    ${elemTxt}       This text has random Id
    ${elemId}       get element attribute    ${dynamicParagraph}     id

    wait until element is enabled    ${enableBtn}
    click element    ${enableBtn}

    sleep    1 seconds
    wait until element is visible    ${visibleBtn}
    mouse over    ${visibleBtn}

    log     dynamic elements test is successful!