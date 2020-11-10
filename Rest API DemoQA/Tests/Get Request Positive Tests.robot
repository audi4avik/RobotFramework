*** Settings ***
Documentation  This is the data driven test case for get weather info API
Library  RequestsLibrary
Library  Collections
Library  ExcelLibrary
Library  JSONLibrary
Library  String
Library  DataDriver  ../Input Data/TestData.xlsx  sheet_name=Get-Positive

Resource    ../Input Data/inputData.robot

Test Template  Verify Successful Retrieval Of Weather Info For Each City

*** Variables ***
# External CSV Data

*** Test Cases ***
Get Weather Info  ${TC_No}  ${cityName}
    [Tags]    Positive Tests

*** Keywords ***
Verify Successful Retrieval Of Weather Info For Each City
    [Arguments]  ${baseUrl}  ${getUrl}  ${cityName}  ${httpCode}  ${init_row}   ${init_column}
    create session  mysession  ${baseurl}
    ${response} =  get request  mysession  ${getUrl}${cityName}
    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #Validations
    ${statusCode} =  convert to string  ${response.status_code}
    should be equal  ${statusCode}  ${httpCode}

    ${response_body} =  convert to string  ${response.content}
    should contain  ${response_body}   ${cityName}

    ${jsonResponse} =  to json  ${response.content}
    ${tempValue} =  get value from json  ${jsonResponse}  Temperature
    ${tempStr} =  convert to string  ${tempValue}
    ${cityTemp} =  get substring  ${tempStr}  2  -17

    # Create a list of temperatures and pass it to the excel column
    append to list         ${tempList}  ${cityTemp}
    open excel document    ${excelPath}    useTempDir=True
    write excel column     ${init_column}    ${tempList}    row_offset=${init_row}    sheet_name=Get-Positive
    save excel document    ${excelPath}
    close current excel document

    ${content_type} =  get from dictionary  ${response.headers}  Content-Type
    should be equal  ${content_type}  application/json


