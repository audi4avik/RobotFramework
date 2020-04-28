*** Settings ***
Documentation  This page contains the element for signin section
Library  SeleniumLibrary

*** Variables ***
${emailField} =  xpath=//input[@name='username']
${pwdField} =  xpath=//input[@name = 'password']
${loginBtn} =  xpath=//button[text() = 'Login']
${signupBtn} =  xpath=//a[@class='btn btn-success br25 btn-block form-group']

*** Keywords ***
Enter Login Creds
    [Arguments]  ${Login_Creds}
    sleep  2s
    input text      ${emailField}   ${Login_Creds}[0]
    input password  ${pwdField}     ${Login_Creds}[1]
    click element   ${loginBtn}
    sleep  2s

Enter Login Creds From Excel
    [Arguments]  ${username}  ${password}
    sleep  2s
    input text      ${emailField}   ${username}
    input password  ${pwdField}     ${password}
    click element   ${loginBtn}
    sleep  2s

Click On Signup
    click element  ${signupBtn}
    sleep  1s


