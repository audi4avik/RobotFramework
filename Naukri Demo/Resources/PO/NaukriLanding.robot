*** Settings ***
Documentation  This page deals with Naukri landing page elements
Library  SeleniumLibrary

*** Keywords ***
Navigate To Naukri Landing Page
    [Arguments]  ${naukriURL}
    Go To   ${naukriURL}

Verify Page Loaded
    Wait Until Page Contains  Login