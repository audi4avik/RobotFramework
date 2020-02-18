*** Settings ***
Documentation   This page holds the objects Landing Page
Library  SeleniumLibrary
Resource  ../../Data/InputData.robot

*** Variables ***
${pageTitle} =  The Ninja Store

*** Keywords ***
Navigate To
    go to   ${NinjaHomeURL}

Verify Page Loaded
    get title   should be equal  ${pageTitle}
