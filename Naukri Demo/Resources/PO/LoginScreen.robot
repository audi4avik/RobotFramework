*** Settings ***
Documentation   This page holds the objects for login page and credentials
Library  SeleniumLibrary

*** Variables ***
${loginLink} =  xpath=//a[@title='Jobseeker Login']
${loginBtn} =   xpath=//div[@id='loginLBNew']//*[@class='blueBtn']
${inputEmail} =  xpath=//div[@id='loginLBNew']//*[@name='email']
${inputPwd} =   xpath=//div[@id='loginLBNew']//*[@name='PASSWORD']

*** Keywords ***
#Passing the variable to the Keywords
Login To Naukri
    [Arguments]  @{loginCreds}
    Click Login Link
    Enter User "Email"  @{loginCreds}
    Enter User "Password"  @{loginCreds}
    Click "Login" Button


Click Login Link
    click element   ${loginLink}
    wait until element is visible  ${loginBtn}
Enter User "Email"
    [Arguments]  @{loginCreds}
    input text  ${inputEmail}  @{loginCreds}[0]
    set browser implicit wait  1s
Enter User "Password"
    [Arguments]  @{loginCreds}
    input password  ${inputPwd}  @{loginCreds}[1]
    set browser implicit wait  1s
Click "Login" Button
    click button  ${loginBtn}
    set selenium implicit wait  2s





