*** Settings ***
Documentation  This page holds the objects for cart page
Library  SeleniumLibrary

*** Variables ***
${GuestRadioBtn} =     xpath=//input[@value='guest']
${GuestContinue} =     xpath=//input[@value='Continue']
${LoginEmail} =        id=input-email
${LoginPwd} =          id=input-password
${LoginBtn} =          id=button-login
${BillingFirstName} =  id=input-payment-firstname
${BillingLastName} =   id=input-payment-lastname
${BillingEmail} =      id=input-payment-email
${BillingTelephone} =  id=input-payment-telephone
${BillingAddress1} =   id=input-payment-address-1
${BillingAddress2} =   id=input-payment-address-2
${BillingCity} =       id=input-payment-city
${BillingPostCode} =   id=input-payment-postcode
${BillingCountry} =    id=input-payment-country
${BillingState} =      id=input-payment-zone
${BillingContinueBtn} =  xpath=//input[@id='button-shipping-address']
${BillingContinueBtnGuest} =  xpath=//*[@id='button-guest']
${DeliveryMethodBtn} =  xpath=//input[@id='button-shipping-method']
${PaymentMethodChkbox} =  xpath=//div[@class='pull-right']//input[@type='checkbox']
${PaymentMethodContinueBtn} =  id=button-payment-method
${ConfirmOrderBtn} =  id=button-confirm
${Session} =  Guest

*** Keywords ***
Check For Session
    [Arguments]   ${ValidUserDetails}
    run keyword if  '${Session}' == 'LoginUser'  Checkout As Logged In User    ${ValidUserDetails}
    ...  ELSE                                    Checkout As Guest  ${ValidUserDetails}

Checkout As Logged In User
    [Arguments]  ${ValidUserDetails}
    log  Checking out as logged in user
    input text  ${LoginEmail}   ${ValidUserDetails.Email}
    input password  ${LoginPwd}     ${ValidUserDetails.Pwd}
    click element   ${LoginBtn}
    set selenium implicit wait  1
    select radio button  payment_address  new
    set selenium implicit wait  1
    Enter Billing Details For Logged In User  ${ValidUserDetails}
    Perform Remaining Order Steps

Enter Billing Details For Logged In User
    [Arguments]  ${ValidUserDetails}
    input text  ${BillingFirstName}  ${ValidUserDetails.FirstName}
    input text  ${BillingLastName}   ${ValidUserDetails.LastName}
    input text  ${BillingAddress1}   HRBR layout, Kalyan Nagar
    input text  ${BillingAddress2}   Bangalore
    input text  ${BillingCity}       Bangalore
    input text  ${BillingPostCode}   560043
    select from list by value  ${BillingCountry}  99
    sleep  1
    select from list by value  ${BillingState}  1489
    click element  ${BillingContinueBtn}
    sleep  2

Perform Remaining Order Steps
    select radio button  shipping_address  existing
    click element  ${DeliveryMethodBtn}
    sleep  1
    click element  ${PaymentMethodChkbox}
    click element  ${PaymentMethodContinueBtn}
    sleep  1
    click element  ${ConfirmOrderBtn}
    set selenium implicit wait  2

Checkout As Guest
    [Arguments]  ${ValidUserDetails}
    log  Checking out as guest
    click element  ${GuestRadioBtn}
    click element  ${GuestContinue}
    sleep  1
    Enter Billing Details For Guest  ${ValidUserDetails}
    Perform Remaining Order Steps For Guest

Enter Billing Details For Guest
    [Arguments]  ${ValidUserDetails}
    input text  ${BillingFirstName}  ${ValidUserDetails.FirstName}
    input text  ${BillingLastName}   ${ValidUserDetails.LastName}
    input text  ${BillingEmail}      ${ValidUserDetails.Email}
    input text  ${BillingTelephone}  ${ValidUserDetails.Tel}
    input text  ${BillingAddress1}   HRBR layout, Kalyan Nagar
    input text  ${BillingAddress2}   Bangalore
    input text  ${BillingCity}       Bangalore
    input text  ${BillingPostCode}   560043
    select from list by value  ${BillingCountry}  99
    sleep  1
    select from list by value  ${BillingState}  1489
    click element  ${BillingContinueBtnGuest}
    sleep  2


Perform Remaining Order Steps For Guest
    click element  ${DeliveryMethodBtn}
    sleep  1
    click element  ${PaymentMethodChkbox}
    click element  ${PaymentMethodContinueBtn}
    sleep  1
    click element  ${ConfirmOrderBtn}
    set selenium implicit wait  2

