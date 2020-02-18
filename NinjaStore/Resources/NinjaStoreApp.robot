*** Settings ***
Documentation   This page connects to lower level page objects
Resource  ./PO/HeaderTopBar.robot
Resource  ./PO/SearchBox.robot
Resource  ./PO/LandingPage.robot
Resource  ./PO/SearchResultPage.robot
Resource  ./PO/UserRegistration.robot
Resource  ./PO/UserLoginPage.robot
Resource  ./PO/RegistrationValidation.robot
#Resource  ./PO/MyAccountPage.robot
Resource  ./PO/ForgotPassword.robot


*** Keywords ***
# Template High Level Keywords Section
Search For Multiple Products
    [Arguments]  ${SearchStr}
    Go to Landing Page
    Search Product Through Searchbox  ${SearchStr}
    Verify Search Result  ${SearchStr}

User Registration Steps
    [Arguments]  ${UserDetails}
    Go to Landing Page
    Click On Register
    Verify Registration Page Loaded
    Submit Personal Details  ${UserDetails}
    Verify Validation Message For All Registration  ${UserDetails}

User Login Steps
    [Arguments]  ${UserDetails}
    Go to Landing Page
    Click On Login
    Verify Login Page Loaded
    Enter Login Credential  ${UserDetails}
    Verify Validation Message For Login Tests

Forgot Password Steps
    [Arguments]  ${UserDetails}
    Go to Landing Page
    Click On Login
    Navigate To Forgot Password
    Verify Forgot Password Functionality    ${UserDetails}

# Lower Level Keywords Section
Go to Landing Page
    LandingPage.Navigate To

# Search Products Keywords
Search Product Through Searchbox
    [Documentation]  Perform search operation
    [Arguments]  ${SearchStr}
    SearchBox.Search For Product  ${SearchStr}

Verify Search Result
    [Documentation]  Validate the result from Search
    [Arguments]  ${Credentials}
    SearchResultPage.Validate Result    ${SearchStr}

# User Registration Keywords
Click On Register
    HeaderTopBar.Click On Register Dropdown

Verify Registration Page Loaded
    UserRegistration.Verify Registration Page Title

Submit Personal Details
    [Arguments]  ${UserDetails}
    UserRegistration.Fill Personal Details Fields   ${UserDetails}

Verify Validation Message For All Registration
    [Arguments]  ${UserDetails}
    RegistrationValidation.Verify Validation Message    ${UserDetails}

# User Login Keywords
Click On Login
    HeaderTopBar.Click On Login Dropdown

Verify Login Page Loaded
    UserLoginPage.Verify Login Page Title

Enter Login Credential
    [Arguments]  ${UserDetails}
    UserLoginPage.Fill Login Credentials    ${UserDetails}

Verify Validation Message For Login Tests
    UserLoginPage.Verify Logged In User

# Forgot Password Steps Keywords
Navigate To Forgot Password
    UserLoginPage.Click On Forgot Password Link

Verify Forgot Password Functionality
    [Arguments]  ${UserDetails}
    ForgotPassword.Validate Forgot Password   ${UserDetails}
    ForgotPassword.Validate Return Message
