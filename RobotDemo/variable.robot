*** Settings ***
Documentation  This is a demo for understanding variable
Resource  inputData.robot

*** Variables ***

*** Test Cases ***
Logging to console
    [Arguments]  ${Var}  ${Num}   @{List1}
    log  ${Var}
    log  ${Num}
#    log  ${Spcl}

    log  @{List1}[0]
    log  @{List1}[1]
    log  @{List1}[2]
#
#    log  ${Dict.Fname}
#    log  ${Dict.Lname}
#    log  ${Dict.mob}


