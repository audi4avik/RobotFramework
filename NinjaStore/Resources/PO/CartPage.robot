*** Settings ***
Documentation  This page holds the objects for cart page
Library  SeleniumLibrary
Library  String

*** Variables ***
${CartItems} =  xpath=//div[@class='table-responsive']//td[@class='text-left']/a
${CheckoutBtn} =  xpath=//a[text()='Checkout']

*** Keywords ***
Validate Cart Items
    ${ItemCount}  get element count  ${CartItems}
    run keyword if  ${ItemCount} > 1  Success  ${ItemCount}
    ...  ELSE                         Failure

Success
    [Arguments]  ${ItemCount}
    log  ${ItemCount} Items in Cart Validated Successfully


Failure
    log  Cart Item Unavailable

Click On Checkout Button
    scroll element into view  ${CheckoutBtn}
    click element  ${CheckoutBtn}
    sleep  1s