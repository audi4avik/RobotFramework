*** Settings ***
Documentation  This page deals with search result page
Library  SeleniumLibrary

*** Variables ***
${SearchResult} =  xpath=//div[@class='caption']

*** Keywords ***
Validate Result
    [Arguments]  ${Credentials}
    scroll element into view  ${SearchResult}
    sleep  1s
    ${elementText} =  get text  ${SearchResult}
    should contain  ${elementText}  ${Credentials}  ignore_case=true