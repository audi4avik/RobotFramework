*** Settings ***
Documentation  This page automates the functionality of uploading a resume and validation
Library  SeleniumLibrary
Resource  ../../Data/InputData.robot  # necessary for Setup & Teardown

*** Variables ***
${uploadButton} =   xpath=//input[@id='attachCV']
${updateDate} =  xpath=//span[@class='updateOn']

*** Keywords ***
Update Resume
    choose file  ${uploadButton}    ${file}
    sleep  2s
    ${uploadDate} =   get text  ${updateDate}
    log to console  ${uploadDate}

    set selenium implicit wait  2s