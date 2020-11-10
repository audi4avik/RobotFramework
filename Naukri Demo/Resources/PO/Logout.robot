*** Settings ***
Documentation  This page performs the functionality logout
Library  SeleniumLibrary

*** Variables ***
${mousehoverLink} =    xpath=//ul[@class='rghtSec fr menu logged']/li[2]
${logoutLink} =  xpath=//div[@class='subMenu c2']//a[@title='Logout']

*** Keywords ***
Click On Logout
    mouse over  ${mousehoverLink}
    click link  ${logoutLink}
    sleep  2s