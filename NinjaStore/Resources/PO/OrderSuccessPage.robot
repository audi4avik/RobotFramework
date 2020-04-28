*** Settings ***
Documentation  This page deals with post Order Success
Library  SeleniumLibrary

*** Variables ***
${SuccessMsg} =  xpath=//h1[text()='Your order has been placed!']

*** Keywords ***
Validate Success Message
    element text should be  ${SuccessMsg}  Your order has been placed!
    log  Guest User has successfully placed an order.
