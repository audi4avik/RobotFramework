*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Library    pymysql

Suite Setup    Connect To Database    pymysql    ${dbName}    ${dbUser}    ${dbPass}    ${dbHost}    ${dbPort}
Suite Teardown    Disconnect From Database

*** Variables ***
${dbName}       mydb
${dbUser}       root
${dbPass}
${dbHost}       127.0.0.1
${dbPort}       3306

*** Test Cases ***
Create User Table
    [Tags]    create
    ${outputCreate} =  execute sql string    create table user_info(id integer,first_name varchar(20),last_name varchar(20));
    should be equal as strings    ${outputCreate}    None

Insert Into table
    # Single Record
    [Tags]    insert
    ${outputInsert} =    execute sql string    insert into user_info values(007,'James','Bond');
    should be equal as strings    ${outputInsert}     None

    # Multiple records with script
    ${outputInsert} =    execute sql script    ./TestData/insertData.sql
    should be equal as strings    ${outputInsert}    None

Validate Table And Records
    [Tags]    record
    table must exist    user_info
    check if exists in database    select * from user_info where first_name='Casey';
    check if not exists in database    select * from user_info where last_name='Goliath';

Verify Row Count
    [Tags]    row
    row count is 0    select * from user_info where last_name='Dennis';
    row count is equal to x    select * from user_info where id='7';    1
    row count is greater than x    select * from user_info;    4
    row count is less than x    select * from user_info where first_name='valentino';    2

Update Record In Table
    [Tags]  update
    ${output} =    execute sql string    update user_info set first_name='John' where id='104'
    should be equal as strings    ${output}    None

Retrieve Records From Table
    [Tags]    retrieve
    ${retrieveResult} =    query    select * from user_info;

Delete Record From Table
    [Tags]    delete
    execute sql string    delete from user_info;
    execute sql string    drop table user_info;
