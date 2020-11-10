*** Settings ***
Documentation  This is the test data file

*** Variables ***
#Scalar var
${Var} =  This is a string
${Num} =  12.001
${Spcl} =  '#$%$^@$^'

#List var
@{List1} =  160  Avik  %^&
@{browser_url} =  chrome  http://tutorialsninja.com/demo/

#Dictionary
&{Dict}  Fname=Avik  Lname=D