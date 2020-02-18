*** Settings ***
Documentation   These are the test cases for NinjaStore ecommerce
Resource  ../Data/InputData.robot  # necessary for inputs
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/NinjaStoreApp.robot  # necessary for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
# Global variables, moved to InputData

# TODO - Modify these credentials to be feed from external file for different login scenarios and browsers

*** Test Cases ***

Guest User Should Be Able To Search Products
    [Documentation]  This is test 1 success scenario for searching products
    [Tags]  SearchProducts
    [Template]  Search For Multiple Products
    @{SearchStr}[0]
    @{SearchStr}[1]
    @{SearchStr}[2]
    @{SearchStr}[3]

Verify New User Registration Scenarios
    [Documentation]  This is test 2 for user registration scenarios
    [Tags]  UserReg
    [Template]  User Registration Steps
    ${ValidUserDetails}
    ${BlankFirstName}
    ${BlankLastName}
    ${BlankEmail}
    ${BlankTel}
    ${BlankPwd}
    ${BlankCnfPwd}
#    ${IncorrectEmail}
    ${IncorrectTel}
    ${LessPwd}
    ${ExcessPwd}

Verify User Login Scnearios
    [Documentation]  This is test 3 for user login scenarios
    [Tags]  UserLogin
    [Template]  User Login Steps
    ${ValidUserDetails}
    ${BlankEmail}
    ${BlankPwd}
    ${InvalidUsername}
    ${InvalidPassword}

Verify Forgot Password Scnearios
    [Documentation]  This is test 4 for user login scenarios
    [Tags]  ForgotPwd
    [Template]  Forgot Password Steps
    ${ValidUserDetails}
    ${InvalidUsername}

Verify Functionality Adding Multiple Items To Cart
    [Documentation]  This is test 5 for user login scenarios
    [Tags]  Cart
    [Template]  Forgot Password Steps
    ${ValidUserDetails}
    ${InvalidUsername}
