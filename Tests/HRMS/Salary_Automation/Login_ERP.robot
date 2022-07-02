*** Settings ***
Library		SeleniumLibrary

*** Variables ***
${browser}      chrome
${url}          https://demoprojects.e-connectsolutions.com/eprash-dev
${UserName}     econnect
${Password}     admin

*** Test Cases ***
Salary_Cycle_Creation
    [Tags]  SalaryCycle
    Login_into_EPRASH
    Go To          ${Salary_Cycle_Url}
    #Rest of the Test Case Steps

*** Keywords ***
Login_into_EPRASH
    open browser    ${url}  ${browser}
    maximize browser window
    Input Text      id:LoginIdForShow       ${UserName}
    Input Text      id:PasswordForShow      ${Password}
    Click Button    id:btnLogin
    sleep   2
    title should be     RISL: Dashboard


