*** Settings ***
Documentation   This page holds the objects Landing Page
Library  SeleniumLibrary
Resource  ../../Data/InputData.robot

*** Variables ***
${pageTitle} =  The Ninja Store
${CartLink} =  xpath=//span[text()='Shopping Cart']
${Carousal} =  xpath=//div[@class='swiper-viewport']
${Macbook_Add_Cart} =  xpath=//div[starts-with(@class,'product-layout')][1]//span[contains(text(), 'Add to Cart')]
${IPhone_Add_Cart} =  xpath=//div[starts-with(@class,'product-layout')][2]//span[contains(text(), 'Add to Cart')]

*** Keywords ***
Navigate To
    go to   ${NinjaHomeURL}

Verify Page Loaded
    get title   should be equal  ${pageTitle}

Add Items To Shopping Cart
    scroll element into view  ${Carousal}
    click element  ${Macbook_Add_Cart}
    sleep  1s
    click element  ${IPhone_Add_Cart}
    sleep  1s
    click element  ${CartLink}
    sleep  2s
