*** Settings ***
Documentation  This is the data driven test case for POST DemoQA Register API
Library  RequestsLibrary
Library  Collections
Library  ExcelLibrary
Library  String
Library  DataDriver  ../Input Data/TestData.xlsx  sheet_name=Post-Positive

#Resource    ../Input Data/inputData.robot

Test Template    Verify Successful Registration For Customers

*** Variables ***
# Extrenal csv

*** Test Cases ***
Verify Registration API With Customer Data
    [Tags]    Registration Success

*** Keywords ***
Verify Successful Registration For Customers
    [Arguments]    ${baseUrl}  ${relativeUrl}    ${firstName}	${lastName}	 ${userName}    ${password}    ${email}	 ${httpCode}    ${successCode}    ${respMessage}

    run keyword if    '${userName}' == 'new user'    Keyword 1    ${baseUrl}  ${relativeUrl}    ${firstName}	${lastName}	 ${userName}    ${password}    ${email}	 ${httpCode}    ${successCode}    ${respMessage}
    ...    ELSE     Keyword 2   ${baseUrl}  ${relativeUrl}    ${firstName}	${lastName}	 ${userName}    ${password}    ${email}	 ${httpCode}    ${successCode}    ${respMessage}


Keyword 1
    [Arguments]    ${baseUrl}  ${relativeUrl}    ${firstName}	${lastName}	 ${userName}    ${password}    ${email}	 ${httpCode}    ${successCode}    ${respMessage}

    ${userName} =    generate random string    8    [LOWER]
    ${email} =    catenate    SEPARATOR=	${userName}    @ymail.com

    create session    postSession    ${baseUrl}
    ${header} =   create dictionary    Content-Type=application/json
    ${body} =    create dictionary    FirstName=${firstName}    LastName=${lastName}    UserName=${userName}    Password=${password}    Email=${email}
    ${response} =    post request    postSession    ${relativeUrl}  headers=${header}  data=${body}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${statusCode} =    convert to string    ${response.status_code}
    should be equal    ${statusCode}    ${httpCode}

    ${responseBody} =    convert to string   ${response.content}
    should contain    ${responseBody}    ${successCode}
    should contain    ${responseBody}    ${respMessage}

Keyword 2
    [Arguments]    ${baseUrl}  ${relativeUrl}    ${firstName}	${lastName}	 ${userName}    ${password}    ${email}	 ${httpCode}    ${successCode}    ${respMessage}

    create session    postSession    ${baseUrl}
    ${header} =   create dictionary    Content-Type=application/json
    ${body} =    create dictionary    FirstName=${firstName}    LastName=${lastName}    UserName=${userName}    Password=${password}    Email=${email}
    ${response} =    post request    postSession    ${relativeUrl}  headers=${header}  data=${body}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${statusCode} =    convert to string    ${response.status_code}
    should be equal    ${statusCode}    ${httpCode}

    ${responseBody} =    convert to string   ${response.content}
    should contain    ${responseBody}    ${successCode}
    should contain    ${responseBody}    ${respMessage}
