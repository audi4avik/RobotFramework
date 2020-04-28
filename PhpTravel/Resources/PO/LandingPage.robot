*** Settings ***
Documentation  This page contains the element for landing page
Library  SeleniumLibrary
Resource  ../../InputData/InputData.robot

*** Variables ***
${myAccountDiv} =  //div[@class='dropdown dropdown-login dropdown-tab']
${loginLink} =     xpath=//a[text() = 'Login']


*** Keywords ***
Go To Landing Page
    go to  ${URL}
    sleep  2s

Go To Login Section
    click element   ${myAccountDiv}
    sleep   1s
    click element   ${loginLink}
    sleep  2s