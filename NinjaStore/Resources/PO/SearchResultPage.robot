*** Settings ***
Documentation  This page deals with search result page
Library  SeleniumLibrary

*** Variables ***
${SearchResult} =  xpath=//div[@class='caption']
${AddToCart} =  xpath=//span[text()='Add to Cart']
${ShoppingCartLink} =  xpath=//span[text()='Shopping Cart']

*** Keywords ***
Validate Result
    [Arguments]  ${Credentials}
    scroll element into view  ${SearchResult}
    sleep  1s
    ${elementText} =  get text  ${SearchResult}
    should contain  ${elementText}  ${Credentials}  ignore_case=true

Add Searched Items To Cart
    click element  ${AddToCart}
    sleep  1s

Click On Shopping Cart Link
    click element  ${ShoppingCartLink}