*** Settings ***
Documentation  This page deals with form elements of user registration
Library  SeleniumLibrary

*** Variables ***
${RegistrationPageFlag} =  xpath=//ul[@class='breadcrumb']/li[3]/a
${FirstName} =  xpath=//input[@id='input-firstname']
${LastName} =  css=input#input-lastname
${Email} =  id=input-email
${Tel} =  name=telephone
${Pwd} =  xpath=//input[@id='input-password']
${CnfPwd} =  css=input#input-confirm
${SubNewsletter} =  xpath=//input[@name='newsletter'][@value='0']
${AcceptCheckBox} =  xpath=//input[@name='agree']
${SubmitDetails} =  xpath=//input[@type='submit'][@value='Continue']

*** Keywords ***
Verify Registration Page Title
    element text should be  ${RegistrationPageFlag}  Register

Fill Personal Details Fields
    [Arguments]  ${UserDetails}
    input text  ${FirstName}  ${UserDetails.FirstName}
    input text  ${LastName}  ${UserDetails.LastName}
    input text  ${Email}  ${UserDetails.Email}
    input text  ${Tel}  ${UserDetails.Tel}
    input password  ${Pwd}  ${UserDetails.Pwd}
    input password  ${CnfPwd}  ${UserDetails.CnfPwd}

    sleep   1s
    scroll element into view  ${AcceptCheckBox}

    click element  ${SubNewsletter}
    click element  ${AcceptCheckBox}
    click element  ${SubmitDetails}