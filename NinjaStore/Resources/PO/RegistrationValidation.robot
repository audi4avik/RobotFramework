*** Settings ***
Documentation  This page deals with registration process validation
Library  SeleniumLibrary
Resource  HeaderTopBar.robot


*** Variables ***
${SuccessMsgLocator} =  xpath=//p[contains(text(), 'successfully created')]
${FailureMsgLocator} =  xpath=//div[contains(@class, 'alert-danger') and contains(text(), 'E-Mail Address is already registered')]
${AlertMsg} =  xpath=//div[@class='text-danger']


*** Keywords ***
Verify Validation Message
    [Arguments]  ${UserDetails}
    sleep  2s
    ${Success}  run keyword and return status
                ...  element should be visible  ${SuccessMsgLocator}
    ${Failure}  run keyword and return status
                ...  element should be visible  ${FailureMsgLocator}
    run keyword if  ${Success} == True   VerifySuccessText
    ...  ELSE IF    ${Failure} == True   VerifyFailureText  ${UserDetails}
    ...  ELSE                            VerifyAlertText    ${UserDetails}

VerifyAlertText
    [Arguments]  ${UserDetails}
    log  Registration is not successful and AlertText: ${UserDetails.ValidateMsg}

VerifyFailureText
    [Arguments]   ${UserDetails}
    log  Registration failed as user is already registered and FailureText: ${UserDetails.ValidateMsg}

VerifySuccessText
    log  Registration is successful
    capture page screenshot  RegistrationSuccess.png
    HeaderTopBar.Click On Logout
    sleep  1s