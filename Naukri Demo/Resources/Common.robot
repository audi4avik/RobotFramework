*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Begin Web Test
    # Global variable called from test page. Even though it shows reference unresolved, it works!
    open browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    close browser