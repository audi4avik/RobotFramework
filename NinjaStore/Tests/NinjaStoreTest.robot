*** Settings ***
Library  String
Documentation   These are the test cases for NinjaStore ecommerce
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/NinjaStoreApp.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# Execution Options
# --reporttitle "my new report"
# --logtitle "my cool log"
# -c <tagname>  - To mark critical test cases
# -n <tagname>  - To mark non critical cases
# -T to differentiate test results with timestamps

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
    [Documentation]  This is test 5 for adding multiple items to cart
    [Tags]  Cart
    NinjaStoreApp.Add Multiple Products To Cart

Verify Checkout Functionality As Guest User
    [Documentation]  This is test 6 for checkout as a Guest user
    [Tags]  CheckoutGuest
    [Template]  NinjaStoreApp.Checkout As Logged In User Or Guest
    ${ValidUserDetails}     @{SearchStr}[3]

Verify Checkout Functionality As Logged In User
    [Documentation]  This is test 7 for checkout as a logged in user
    [Tags]  CheckoutLogin
    [Template]  NinjaStoreApp.Checkout As Logged In User Or Guest
    ${ValidUserDetails}     @{SearchStr}[4]




