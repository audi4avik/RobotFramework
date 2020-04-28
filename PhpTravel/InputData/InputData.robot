*** Settings ***
Documentation  Input data for test cases


*** Variables ***
${URL} =  https://www.phptravels.net/home
@{Login_Creds} =  johnd@gmail.com    audia8
@{Invalid_Pwd_Creds} =  jdoe@gmail.com    audia7
@{Invalid_Uname_Creds} =   jdon@gmail.com    audia8

&{ValidUserDetails}  FirstName=John   LastName=Doe  Email=johnd@gmail.com  Tel=9100012345  Pwd=audia8  CnfPwd=audia8   ValidateMsg=successfully created

${CSV_File_Path} =  C:/Users/AvikDatta/PycharmProjects/RobotFramework/PhpTravel/InputData/inputdata.csv
