*** Settings ***
Documentation  This is the test case file
#packages robotframework-datadriver & xlrd
Library  DataDriver  ../InputData/loginData.xlsx  sheet_name=login creds

Resource  ../Resources/Common.robot
Resource  ../Resources/PhpTravels.robot

Test Setup  Common.Begin Test
Test Teardown  Common.Begin Teardown
Test Template  Verify Login Scenarios With Excel Data

*** Test Cases ***
Verify Login Scenarios  ${username}  ${password}

*** Keywords ***
Verify Login Scenarios With Excel Data
    [Arguments]  ${username}  ${password}
    Navigate To Landing Page
    Perform The Login Flow For Excel Data  ${username}  ${password}
    Validate Login Scenario