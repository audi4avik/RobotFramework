*** Settings ***
Documentation  This page contains the element for My Account page
Library  SeleniumLibrary
Library  String

*** Variables ***
${loggedUserText} =  xpath=//div[@class='col-md-8']//h3
${myAccountDiv} =  //div[@class='dropdown dropdown-login dropdown-tab']
${logoutLink} =      xpath=//a[text()='Logout']

*** Keywords ***
Validate Signup Successful
    [Arguments]  ${ValidUserDetails}
    ${usernameStatus}  run keyword and return status
    ...  element text should be  ${loggedUserText}  Hi, ${ValidUserDetails.FirstName} ${ValidUserDetails.LastName}
    run keyword if  ${usernameStatus} == True   Validate Signup Success
    ...  ELSE                                   Validate Signup Failure

Validate Signup Success
    log  Signup is successful

Validate Signup Failure
    log  Signup has failed

Validate Login
     ${LoginSessionCheck}  run keyword and return status
     ...  page should contain element  ${loggedUserText}
     run keyword if  ${LoginSessionCheck} == True   Validate User Name
#     ...  ELSE IF    ${LoginSessionCheck} == False   Do Something Else
     ...  ELSE                                      Validate Failure Login


Validate User Name
    element text should be  ${loggedUserText}   Hi, John Doe
    click element  ${myAccountDiv}
    sleep  1s
    click element  ${logoutLink}
    log  User Validation Successful
    sleep  1s
    

Validate Failure Login
    log  User validation has failed
