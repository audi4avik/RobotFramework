*** Settings ***
Documentation   This page connects to lower level page objects
Resource  ./PO/LoginScreen.robot
Resource  ./PO/NaukriHome.robot
Resource  ./PO/NaukriLanding.robot
Resource  ./PO/UploadResume.robot
Resource  ./PO/Logout.robot

*** Keywords ***
Login Steps
    [Documentation]  Perform login scenarios
    #Capturing arguments from test case page and passing the variable to the PO
    [Arguments]  ${naukriURL}   #63256
    NaukriLanding.Navigate To Naukri Landing Page   ${naukriURL}
    NaukriLanding.Verify Page Loaded
    LoginScreen.Login To Naukri  @{loginCreds}

Upload Resume
    [Documentation]  Perform upload resume operation
    NaukriHome.Select Edit Profile
    UploadResume.Update Resume

Perform Logout
    [Documentation]  Perform logout operation
    Logout.Click On Logout

