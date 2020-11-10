*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${url} =    https://demoqa.com/
${screenshotDir} =  C:/Users/SHIV/PycharmProjects/RobotFramework/Web Element Interactions/Output/
${dwnldDir} =   C:/Users/SHIV/Downloads/

*** Keywords ***
Browser Open
    remove files    ${screenshotDir}selenium-screenshot-1.png
    open browser    about:blank    chrome
    maximize browser window
    go to    ${url}
    sleep    2 seconds

Browser Close
    close browser