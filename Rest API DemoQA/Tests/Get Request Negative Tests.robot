*** Settings ***
Documentation  This is the data driven test case for get weather info API
Library  RequestsLibrary
Library  Collections
Library  ExcelLibrary
Library  JSONLibrary
Library  String
Library  DataDriver  ../Input Data/TestData.xlsx  sheet_name=Get-Negative

Test Template  Verify Negative Scenarios For Weather Info API

*** Variables ***
# External CSV Data

*** Test Cases ***
Get Weather Info  ${TC_No}  ${cityName}
    [Tags]    Negative Tests

*** Keywords ***
Verify Negative Scenarios For Weather Info API
    [Arguments]  ${baseUrl}  ${getUrl}  ${cityName}  ${httpCode}   ${errorDesc}
    create session  mysession  ${baseurl}
    ${response} =  get request  mysession  ${getUrl}${cityName}
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #Validations
    ${statusCode} =  convert to string  ${response.status_code}
    should be equal  ${statusCode}  ${httpCode}