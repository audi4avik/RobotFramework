*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${MyAccountLink} =  xpath=//li[@class='dropdown']//a[@title='My Account']
${RegisterLink} =   xpath=//ul[@class='dropdown-menu dropdown-menu-right']//a[contains(text(), 'Register')]
${LoginLink} =  xpath=//li//a[text()='Login']
${LogoutLink} =  xpath=//li//a[text()='Logout']

*** Keywords ***
Click On Register Dropdown
    click element  ${MyAccountLink}
    click link  ${RegisterLink}
    set selenium implicit wait  2s

Click On Login Dropdown
     ${LoginSessionCheck}  run keyword and return status
                          ...  page should contain link  ${LoginLink}
     run keyword if  ${LoginSessionCheck} == True   Perform Login
     ...  ELSE                                      Skip Login

Perform Login
    click element  ${MyAccountLink}
    click link  ${LoginLink}
    set selenium implicit wait  2s

Skip Login
    log     User Already Logged In

Click On Logout
    click element  ${MyAccountLink}
    click link  ${LogoutLink}