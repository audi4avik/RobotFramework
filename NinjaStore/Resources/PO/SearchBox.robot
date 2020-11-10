*** Settings ***
Documentation   This page holds the objects for top search box
Library  SeleniumLibrary

*** Variables ***
${Search_box} =   xpath=//input[@name='search']
${Search_btn} =   xpath=//span[@class='input-group-btn']

*** Keywords ***
Search For Product
    [Arguments]  ${SearchStr}
    Click On Searchbox
    Enter Search Text   ${SearchStr}
    Hit Search


Click On Searchbox
    click element  ${Search_box}

Enter Search Text
    [Arguments]  ${SearchStr}
    input text  ${Search_box}   ${SearchStr}

Hit Search
    click element  ${Search_btn}
    sleep   2s