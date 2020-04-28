*** Settings ***
Documentation  Custom keywords for phptravels
Resource  ./PO/LandingPage.robot
Resource  ./PO/SigningPage.robot
Resource  ./PO/RegisterPage.robot
Resource  ./PO/MyAccount.robot

*** Keywords ***
# Example with external CSV
Validate Login Steps With CSV
    [Arguments]  ${Login_Creds}
    Navigate To Landing Page
    Perform The Login Flow  ${Login_Creds}
    Validate Login Scenario

# Lower Level Keywords
Navigate To Landing Page
    LandingPage.Go To Landing Page
    LandingPage.Go To Login Section

Perform Signup flow
    SigningPage.Click On Signup

Enter Details For Signup
    [Arguments]  ${ValidUserDetails}
    RegisterPage.Enter Signup Credential    ${ValidUserDetails}

Validate Signup Flow
    [Arguments]  ${ValidUserDetails}
    MyAccount.Validate Signup Successful    ${ValidUserDetails}

Perform The Login Flow
    [Arguments]  ${Login_Creds}
    SigningPage.Enter Login Creds    ${Login_Creds}

Validate Login Scenario
    MyAccount.Validate Login

Perform The Login Flow For Excel Data
    [Arguments]  ${username}  ${password}
    SigningPage.Enter Login Creds From Excel   ${username}  ${password}