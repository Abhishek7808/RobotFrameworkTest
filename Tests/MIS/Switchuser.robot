*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}  chrome
${url1}  https://demoprojects.e-connectsolutions.com/eprash-test
@{allusers}
${user}
${SelectUser}
${i}=   0
${inputuser}

*** Keywords ***
Login
    open browser    ${url1}     ${browser}
    Maximize browser window
    wait until page contains    Password
    input text  id:LoginIdForShow       econnect
    input text  id:PasswordForShow    admin
    click element  xpath://*[@id="btnLogin"]
    Wait Until Page Contains     RISL

Switch
    [Arguments]   ${inputuser}
    click element   xpath://*[@id="content"]/div[1]/div[4]/div/a/span/span[2]/span[2]
    click element   xpath://ul[@class="dropdown-menu pull-right"]//li//a[@onclick='SwithcUser(event);']
    sleep   2s
    Get Webelement      xpath://tbody//tr//td[2]
    @{allusers} =   Get WebElements     xpath://tbody//tr//td[2]
    log many    @{allusers}
    FOR     ${user}     IN       @{allusers}
            ${SelectUser} =    Get Text   ${user}
            ${i}    Evaluate    ${i}+1
            log many    ${i}
            Run Keyword If        '${SelectUser}' == '${inputuser}'   click element       //tbody//tr[${i}]//td[7]
            Exit For Loop If    '${SelectUser}' == '${inputuser}'
    END

*** Test Cases ***

testswitch
    Login
    Switch      RSMML [104]


