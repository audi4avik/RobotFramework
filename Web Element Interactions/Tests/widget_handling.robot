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
${accordionLink} =     xpath=(//li[@id='item-0'])[4]
${accordionHeader} =    //div[@class='card-header']
${autocompleteLink} =    xpath=(//li[@id='item-1'])[3]
${autoComplete} =        id=autoCompleteMultiple
${multipleInput} =    xpath=//div[@id='autoCompleteMultipleContainer']//div[@class='auto-complete__placeholder css-1wa3eu0-placeholder']
${singleInput} =      xpath=//div[@id='autoCompleteSingleContainer']//div[@class='auto-complete__placeholder css-1wa3eu0-placeholder']
${datePicker} =       xpath=(//li[@id='item-2'])[3]
${datetimeField} =    id=dateAndTimePickerInput
${spanYear} =       class=react-datepicker__year-read-view--down-arrow
${selectYear} =     xpath=//div[text()='2021']
${spanMonth} =      class=react-datepicker__month-read-view--down-arrow
${selectMonth} =    xpath=//div[text()='January']
${selectDate} =     xpath=//div[@aria-label='Choose Sunday, January 31st, 2021']
${selectTime} =     xpath=//li[text()='08:00']
${fieldTxt} =       id=dateAndTimePickerInput
${sliderLink} =     xpath=(//li[@id='item-3'])[3]
${rangeSlider} =    xpath=//input[@type='range']

*** Test Cases ***
Test Widget Handling
    [Tags]    widget
    Accordion
    Autocomplete
    Datepicker
    Slider

*** Keywords ***
# Switch Window Tests
Accordion
    go to   ${widgetLink}
    sleep    2 seconds
    execute javascript    window.scrollTo(0,300)
    click element    ${accordionLink}
    wait until element is visible       ${accordionHeader}

    ${accordionCount}       get element count    ${accordionHeader}
    FOR     ${index}    IN RANGE        1   ${accordionCount}+1
        click element    (//div[@class='card-header'])[${index}]
        log     This is accordion number: ${index}
        sleep    1 seconds
        execute javascript    window.scrollTo(0,300)
    END

    sleep    1 seconds

Autocomplete
    execute javascript    window.scrollTo(0,300)
    click element    ${autocompleteLink}
    wait until element is visible    ${autoComplete}
    set focus to element    ${multipleInput}
    press keys       ${multipleInput}     re   TAB      gree   TAB
    sleep    1 seconds

    set focus to element    ${singleInput}
    press keys    ${singleInput}      blu      TAB
    sleep    1 seconds

Datepicker
    ${currDate}     get current date       result_format=%d.%m.%Y
    ${setYear}      get substring     ${currDate}   -4
    ${setYear}      convert to integer      ${setYear}
    ${setYear}      evaluate    ${setYear}+1
    execute javascript    window.scrollTo(0,400)
    click element    ${datePicker}
    sleep    2 seconds
    click element    ${datetimeField}
    sleep    2 seconds
    # select year
    click element    ${spanYear}
    set focus to element    ${selectYear}
    click element       xpath=//div[text()='${setYear}']
    #select month
    click element    ${spanMonth}
    click element    ${selectMonth}
    sleep   1 seconds
    #select day
    click element    ${selectDate}
    #select time
    click element    ${selectTime}
    #verify date & time
    ${dateValue}    get element attribute    ${fieldTxt}      value
    should be equal    ${dateValue}     January 31, 2021 8:00 AM
    sleep    1 seconds

Slider
    execute javascript    window.scrollTo(0,400)
    click element    ${sliderLink}
    wait until element is visible    ${rangeSlider}
    ${sliderSize}     get element size    ${rangeSlider}
    ${sliderSize}   convert to integer    ${sliderSize}[0]
    ${moveX}   evaluate    ${sliderSize}/100*10
    set focus to element    ${rangeSlider}
    sleep    1 seconds
    drag and drop by offset     ${rangeSlider}   ${moveX}    0
    ${sliderAt}     get element attribute      ${rangeSlider}   value
    sleep    1 seconds