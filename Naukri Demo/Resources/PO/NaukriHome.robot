*** Settings ***
Documentation   This page object deals with Naukri home page elements
Library  SeleniumLibrary

*** Variables ***
${profileName} =  xpath=//div[@class='user-name roboto-bold-text']
${mousehoverLink} =    xpath=//ul[@class='rghtSec fr menu logged']/li[2]
${editProfileLink} =    xpath=//a[@title='Edit Profile']

*** Keywords ***
Select Edit Profile
    element text should be   ${profileName}   Avik Datta
    mouse over  ${mousehoverLink}
    click element   ${editProfileLink}
    set selenium implicit wait  2s