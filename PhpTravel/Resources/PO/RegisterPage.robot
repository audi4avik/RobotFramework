*** Settings ***
Documentation  This page contains the element for registration section
Library  SeleniumLibrary

*** Variables ***
${headingText} =    xpath=//h3[text()='Sign Up']
${firstName} =      xpath=//input[@name='firstname']
${lastName} =       xpath=//input[@name='lastname']
${mobile} =         css=input[name='phone']
${email} =          css=input[name='email']
${pwd} =            css=input[name='password']
${cnfpPwd} =        css=input[name='confirmpassword']
${registerBtn} =      css=button[class='signupbtn btn_full btn btn-success btn-block btn-lg']


*** Keywords ***
Enter Signup Credential
    [Arguments]  ${ValidUserDetails}
    element text should be  ${headingText}  Sign Up
    input text      ${firstName}    ${ValidUserDetails.FirstName}
    input text      ${lastName}     ${ValidUserDetails.LastName}
    input text      ${mobile}       ${ValidUserDetails.Tel}
    input text      ${email}        ${ValidUserDetails.Email}
    input text      ${pwd}          ${ValidUserDetails.Pwd}
    input text      ${cnfpPwd}      ${ValidUserDetails.CnfPwd}
    click button    ${registerBtn}

    sleep  2s
