*** Settings ***
Library  SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Library           RequestsLibrary

*** Variables ***
${browser}      chrome
${url}          https://demoprojects.e-connectsolutions.com/eprash-dev
${UserName}     econnect
${Password}     admin
${Salary_Cycle_Url}     https://demoprojects.e-connectsolutions.com/eprash-dev/HRM/SalaryCycle
${Manual_Attendance_Url}     https://demoprojects.e-connectsolutions.com/eprash-dev/HRM/ManualAttendance
${String}       20222023

*** Test Cases ***
Salary_Cycle_Creation
    [Tags]  SalaryCycle
    Login_into_EPRASH
    Go To          ${Salary_Cycle_Url}
    Wait Until Page Contains Element      //a[@id='modals-bootbox-custom']
    Click Link    //a[@id='modals-bootbox-custom']
    Input Text      name:DESCRIPTION    Apr 22
    Select From List By Label       name:FINYEAR       2022-23
    Select From List By Label       name:TYPE       Salary
    Input Text      id:START_DATE       01/04/2022
    Input Text      id:END_DATE       30/04/2022
    Click Element       id:VISIBLE
    Input Text      id:VISIBLE        Y
    Click Button        btnSave
    Check_Salary_Cycle_On_List
    Close Browser

Ledger Edit
    [Tags]  Ledger
    Login_into_EPRASH
    Go To   https://demoprojects.e-connectsolutions.com/eprash-dev/ACC/Ledger
    Wait Until Page Contains Element     //input[@id='SearchText']
    Input Text   //input[@id='SearchText']   11361
    Click Element   //button[@id='BtnSearchfilter']
    Sleep   2
    Wait Until Page Contains Element     //div[@class='btn-group btn-group-xs']//a[@class='btn btn-sm btn-danger deleteLink']
    Click Element      //div[@class='btn-group btn-group-xs']//a[@class='btn btn-sm btn-danger deleteLink']
    Sleep   3s
    Wait Until Page Contains Element    //button[@class='btn btn-primary' and text()='OK']
    Click Element       //button[@class='btn btn-primary' and text()='OK']

TESTING
    [Tags]  Testing
    ${First}    Split String    ${String}    20
    Log Many    ${First}[0]
    Log Many    ${First}[1]
    Log Many    ${First}[2]

*** Keywords ***
Login_into_EPRASH
    open browser    ${url}  ${browser}
    maximize browser window
    Input Text      id:LoginIdForShow       ${UserName}
    Input Text      id:PasswordForShow      ${Password}
    Click Button    id:btnLogin
    sleep   2
    title should be     RISL: Dashboard
    #title should be     AVVNL: Dashboard

Check_Salary_Cycle_On_List
    Wait Until Page Contains Element        //td[contains(text(),'Apr 22')]




