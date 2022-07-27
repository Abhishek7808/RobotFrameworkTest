*** Settings ***
Library		SeleniumLibrary
Resource     ../../../Resource/Keywords.robot

*** Variables ***
${browser}      chrome
${url}          https://demoprojects.e-connectsolutions.com/eprash-test
${UserName}     kritika.rsmml
${Password}     admin

*** Test Cases ***
Report_Test
    [Tags]  reporttest
    Login_into_EPRASH
    Go To          https://demoprojects.e-connectsolutions.com/eprash-test/HRM/MIS/IncomeTaxDeductionIndex
    Sleep   5s
    Select From List by Value   //select[@id='ReportType']      1
    Sleep   5S
    Wait Until Page Contains Element  //div[@id='divCalculated']    60S
    Click Element   //div[@id='divCalculated']//a
    Wait Until Page Contains Element    //div[@class='modal-dialog']//div[@class='modal-content ui-draggable']
    Set Focus To Element        //div[@class='modal-dialog']//div[@class='modal-content ui-draggable']
    Wait Until Page Contains Element    //button[contains(text(),'OK')]
    Click Element   //button[contains(text(),'OK')]
    Infinite Loop
    Click Element   //input[@id='btnView']

*** Keywords ***
Login_into_EPRASH
    open browser    ${url}  ${browser}
    maximize browser window
    Input Text      id:LoginIdForShow       ${UserName}
    Input Text      id:PasswordForShow      ${Password}
    Click Button    id:btnLogin
    sleep   2
    #title should be     RISL: Dashboard

Infinite Loop
    FOR  ${i}   IN RANGE    10
        Go To          https://demoprojects.e-connectsolutions.com/eprash-test/HRM/MIS/IncomeTaxDeductionIndex
        Sleep   5s
        Select From List by Value   //select[@id='ReportType']      1
        Sleep   5S
        ${R_Emp}   Get Value     //label[@id='lblRemainingEmp']
        Exit For Loop If   ${R_Emp} == 3
    END



