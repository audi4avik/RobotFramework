*** Settings ***
Documentation  This page deals with form elements of user login
Library  SeleniumLibrary

*** Variables ***
${ForgotPaswrdPageFlag} =  xpath=//ul[@class='breadcrumb']//li[3]/a
${EnterEmail} =  css=input#input-email
${ContinueBtn} =  xpath=//input[@value='Continue']
${EmailAlert} =  css=div.alert-danger
${EmailSuccess} =  css=div.alert-success

*** Keywords ***
Validate Forgot Password
    [Arguments]  ${UserDetails}
    ${PageLoadStatus}  run keyword and return status
                       ...  page should contain element  ${ForgotPaswrdPageFlag}
    run keyword if  ${PageLoadStatus} == True  Enter Email Address To Recover Password  ${UserDetails}
    ...  ELSE                                  log Forgot Password page is not loaded or broken

Enter Email Address To Recover Password
    [Arguments]  ${UserDetails}
    input text  ${EnterEmail}  ${UserDetails.Email}
    click element  ${ContinueBtn}

Validate Return Message
    ${Status}  run keyword and return status
               ...  page should contain element  ${EmailSuccess}
    run keyword if  ${Status} == True  Password Recovery Successful
    ...  ELSE                          Password Recovery Failed

Password Recovery Successful
    ${SuccessText}  get text  ${EmailSuccess}

Password Recovery Failed
    ${AlertText}  get text  ${EmailAlert}