*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ../Common.robot

Test Setup    Common.Browser Open
Test Teardown    Common.Browser Close

*** Variables ***
${formLink} =    xpath=//div[@class='card mt-4 top-card'][2]
${practiceForm} =    xpath=//span[text()='Practice Form']
${filepath} =    C:/Users/SHIV/PycharmProjects/RobotFramework/Web Element Interactions/Input/jd.png
${firstName} =   id=firstName
${lastName} =    id=lastName
${emailField} =    id=userEmail
${genderRadio} =    //label[contains(text(),'Male')]
${mobileNumber} =   id=userNumber
${datePicker} =    id=dateOfBirthInput
${selectYear} =    class=react-datepicker__year-select
${selectMonth} =    class=react-datepicker__month-select
${selectDay} =    xpath=//div[@class='react-datepicker__day react-datepicker__day--010']
${inputSubject} =   //div[@class='subjects-auto-complete__placeholder css-1wa3eu0-placeholder']
${subjectList} =    class=subjects-auto-complete__menu css-2613qy-menu
${hobbyChkbox} =    //input[@type='checkbox']
${uploadPhoto} =    id=uploadPicture
${addressTxt} =     id=currentAddress
${selectDrpDwn} =   xpath=//div[@class=' css-1wa3eu0-placeholder']
${selectCity} =     class= css-1wa3eu0-placeholder
${submitBtn} =      id=submit
${modalLocator} =   //div[@class='fade modal show']
${modalTxt} =       //div[@id='example-modal-sizes-title-lg']
${modalCloseBtn} =    id=closeLargeModal

*** Test Cases ***
Test Form Elements
    [Tags]    inputform
    Input Into Form Elements

*** Keywords ***
# Input Into Form Elements
Input Into Form Elements
    click element    ${formLink}
    sleep    2 seconds
    click element    ${practiceForm}

    input text    ${firstName}    John
    input text    ${lastName}     Doe

    ${email}    generate random string    5     [LOWER]
    input text    ${emailField}     ${email}@gmail.com

    click element    ${genderRadio}

    input text    ${mobileNumber}   9000012345

    click element    ${datePicker}
    ${defaultSpeed} =    get selenium speed
    set selenium speed    0.5
    select from list by value   ${selectYear}    1990
    select from list by label    ${selectMonth}    January
    click element    ${selectDay}

    set selenium speed    0 seconds

    set focus to element    ${inputSubject}
    press keys    ${inputSubject}   Computer Science    TAB
    sleep    1 seconds

    ${chkboxCount} =    get element count  ${hobbyChkbox}
    FOR    ${index}    IN RANGE    1    ${chkboxCount}+1
           click element    //div[@class='custom-control custom-checkbox custom-control-inline'][${index}]/label
    END
    sleep    1 seconds


    execute javascript    window.scrollTo(0,100)

    choose file    ${uploadPhoto}   ${filepath}
    sleep    1 seconds
    execute javascript    window.scrollTo(0,200)

    input text      ${addressTxt}       Electronic City, Bangalore, Karnataka
    execute javascript    window.scrollTo(0,300)

    set focus to element   ${selectDrpDwn}
    press keys     ${selectDrpDwn}      NCR     TAB
    wait until element is enabled    ${selectCity}
    press keys     ${selectDrpDwn}      Delhi     TAB

    click button    ${submitBtn}

    sleep    2 seconds

    set focus to element    ${modalLocator}
    ${welcomeTxt}       get text    ${modalTxt}
    should be equal    ${welcomeTxt}        Thanks for submitting the form

    click element    ${modalCloseBtn}

    sleep    2 seconds
    log    Input Form Test Has Been Successful!

