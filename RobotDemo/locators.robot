*** Settings ***
Library  SeleniumLibrary
Resource  inputData.robot

*** Variables ***
#Locators
${id} =     id=logo
${class} =  class=form-control
${xpath} =  xpath=//button[@class='btn btn-inverse btn-block btn-lg dropdown-toggle']
# xpath=//a[contains(text(),'Ninja')]
${css} =    css=input[name='search']
${name} =   search
${tag} =    tag=h1
${linktext} =  link=Cameras
${partiallinktext} =  partial link=Laptops &



*** Test Cases ***
This is a sample test case
    [Arguments]  @{browser_url}
    open browser  about:blank  @{browser_url}[0]
    maximize browser window
    go to  @{browser_url}[1]

    mouse over  ${id}
    sleep  2s

    click element  ${class}
    sleep  2s

    click element  ${xpath}
    sleep  2s

    click element  ${class}
    sleep  2s

    mouse over  ${tag}
    sleep  2s

    click element  ${name}
    sleep  2s

    mouse over  ${linktext}
    sleep  2s

    mouse over  ${partiallinktext}
    sleep  2s

    close browser