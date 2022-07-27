*** Settings ***
Library  DatabaseLibrary

*** Test Cases ***
TestCase
    [Tags]  Database
   Connect To Database Using Custom Params  pymssql  'EPDEV', 'db2admin', 'passw0rd', '193.16.100.18:50000'
   @{S}  Execute Sql String  Select * from ACC_HEAD;