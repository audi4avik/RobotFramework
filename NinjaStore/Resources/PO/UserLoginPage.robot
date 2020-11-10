*** Settings ***
Documentation  This page deals with form elements of user login
Library  SeleniumLibrary
Resource  HeaderTopBar.robot

*** Variables ***
${LoginPageFlag} =  xpath=//h2[text()='Returning Customer']
${LoginEmail} =  css=input#input-email
${LoginPwd} =  css=input#input-password
${LoginBtn} =  xpath=//input[@value='Login']
${LoginFailureAlert} =  xpath=//div[contains(@class, 'alert-danger')and(contains(text(),'No match for E-Mail Address and/or Password'))]
${ForgotPaswrd} =  xpath=//a[contains(text(),'Forgotten Password')]

*** Keywords ***
Verify Login Page Title
    element text should be  ${LoginPageFlag}  Returning Customer

Fill Login Credentials
    [Arguments]  ${UserDetails}
    input text  ${LoginEmail}   ${UserDetails.Email}
    input password  ${LoginPwd}  ${UserDetails.Pwd}
    click element  ${LoginBtn}

Verify Logged In User
    ${LoggedUser}   run keyword and return status
                    ...  page should contain element  ${LogoutLink}

    run keyword if  ${LoggedUser} == True  LoginSuccess
    ...  ELSE                              LoginFailure

LoginSuccess
    log  Login Successful
    capture page screenshot  LoginSuccess.png
    HeaderTopBar.Click On Logout
    sleep  2s

LoginFailure
    ${LoginFailureAlertText}  get text  ${LoginFailureAlert}
    log  ${LoginFailureAlertText}

Click On Forgot Password Link
    click element  ${ForgotPaswrd}
    sleep  1s