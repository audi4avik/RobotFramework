*** Settings ***
Documentation  This is the test case file
#package: robotframework-csvlib
Library  CSVLib
Resource  ../InputData/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/PhpTravels.robot


Test Setup  Common.Begin Test
Test Teardown  Common.Begin Teardown

# Execution Options
# -s --suite name and -t --test name
# -i include tags, accepts regex
# -e exclude tags
# -S rerunfailed suites
# -R rerunfailed tests
# --reporttitle "my new report"
# --logtitle "my cool log"
# -c <tagname>  - To mark critical test cases
# -n <tagname>  - To mark non critical cases
# -T to differentiate test results with timestamps
# -v runtime variable value browser:firefox

*** Test Cases ***
Verify Successful Signup
    # TODO - I will add extrenal data file in future
    [Tags]  SuccessSignup
    [Documentation]  This one is for the successful Signup
    PhpTravels.Navigate To Landing Page
    PhpTravels.Perform Signup flow
    PhpTravels.Enter Details For Signup  ${ValidUserDetails}
    PhpTravels.Validate Signup Flow      ${ValidUserDetails}


Verify Login Scenarios With CSV File
    [Tags]  SuccessCSV
    ${csvlist} =  read csv as list  ${CSV_File_Path}  ,
    ${listLen} =  get length  ${csvlist}
    : For  ${index}  IN RANGE  ${listLen}
    \  PhpTravels.Validate Login Steps With CSV  ${csvlist}[${index}]