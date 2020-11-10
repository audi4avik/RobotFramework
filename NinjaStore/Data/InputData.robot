*** Settings ***
Library  DateTime
Library  String
*** Variables ***
# Configuration
${BROWSER} =    chrome
${NinjaHomeURL} =  http://tutorialsninja.com/demo/

# Search Input Data
@{SearchStr} =  imac  iphone  Galaxy Tab  D300  Samsung Syncmaster

# User Registration/Login Data
&{ValidUserDetails}  FirstName=John   LastName=Doe  Email=janed@gmail.com  Tel=9100012345  Pwd=AudiR8V10  CnfPwd=AudiR8V10   ValidateMsg=successfully created
&{BlankFirstName}  FirstName=   LastName=Doe  Email=jdoe@bmail.com  Tel=9100012345  Pwd=AudiR8V10  CnfPwd=AudiR8V10  ValidateMsg=First Name must be between 1 and 32 characters
&{BlankLastName}  FirstName=John   LastName=  Email=jdoe@cmail.com  Tel=9100012345  Pwd=AudiR8V10  CnfPwd=AudiR8V10  ValidateMsg=Last Name must be between 1 and 32 characters
&{BlankEmail}  FirstName=John   LastName=Doe  Email=  Tel=9100012345  Pwd=AudiR8V10  CnfPwd=AudiR8V10  ValidateMsg=E-Mail Address does not appear to be valid
&{BlankTel}  FirstName=John   LastName=Doe  Email=jdoe@dmail.com  Tel=  Pwd=AudiR8V10  CnfPwd=AudiR8V10  ValidateMsg=Telephone must be between 3 and 32 characters
&{BlankPwd}  FirstName=John   LastName=Doe  Email=jdoe@email.com  Tel=9100012345  Pwd=  CnfPwd=AudiR8V10  ValidateMsg=Password must be between 4 and 20 characters
&{BlankCnfPwd}  FirstName=John   LastName=Doe  Email=jdoe@fmail.com  Tel=9100012345  Pwd=AudiR8V10  CnfPwd=  ValidateMsg=Password confirmation does not match password
# &{IncorrectEmail}  FirstName=John   LastName=Doe  Email=jdoeymail.com  Tel=9100012345  Pwd=AudiR8V10  CnfPwd=AudiR8V10  ValidateMsg=successfully created
&{IncorrectTel}  FirstName=John   LastName=Doe  Email=jdoe@gmail.com  Tel=XXX123XXX4  Pwd=AudiR8V10  CnfPwd=AudiR8V10  ValidateMsg=Telephone must be between 3 and 32 characters
&{LessPwd}  FirstName=John   LastName=Doe  Email=jdoe@hmail.com  Tel=9100012345  Pwd=aud  CnfPwd=aud  ValidateMsg=Password must be between 4 and 20 characters
&{ExcessPwd}  FirstName=John   LastName=Doe  Email=jdoe@imail.com  Tel=9100012345  Pwd=AudiR8V10Ferrari599GTAudiR8V10Ferrari599GT  CnfPwd=AudiR8V10Ferrari599GTAudiR8V10Ferrari599GT  ValidateMsg=Password must be between 4 and 20 characters
&{AlreadyRegisteredUser}  FirstName=John   LastName=Doe  Email=jdoe@amail.com  Tel=9100012345  Pwd=AudiR8V10  CnfPwd=AudiR8V10   ValidateMsg=E-Mail Address is already registered
&{InvalidUsername}  Email=adoe@amail.com   Pwd=AudiR8V10
&{InvalidPassword}  Email=jdoe@gmail.com   Pwd=audir8v10
