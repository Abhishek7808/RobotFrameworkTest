*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library     Screenshot
Library     SeleniumScreenshots

*** Variables ***
${browser}  chrome
${url}  https://demoprojects.e-connectsolutions.com/eprash-dev
#Data folder moved from resource to Qmate
${groupdata}    Resources/Data/MIS.json
@{alldates}
${date_text}
${date}
${check}

*** Keywords ***
Logintoapp
    open browser    ${url}     ${browser}
    wait until page contains    Password
    input text  id:LoginIdForShow       kritika.rsmml
    input text  id:PasswordForShow    admin
    click element  xpath://*[@id="btnLogin"]

Open Report
    go to       ${object["Payroll MIS"]["url"]}

Fill Salary Report
    Select From List By Index      ${object["Payroll MIS"]["Financial Year"]["Locator"]}    4
    Wait until page contains element    ${object["Payroll MIS"]["Financial Year"]["Locator"]}
    Select From List By Index      ${object["Payroll MIS"]["Cycle Type"]["Locator"]}  1
    sleep   3s
    Select From List By Index      ${object["Payroll MIS"]["Payroll Cycle"]["Locator"]}  1
    sleep   3s
    Select From List By Index      ${object["Payroll MIS"]["Payroll Status"]["Locator"]}  0
    Wait until page contains element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator1"]}
    click element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator1"]}
    Wait until page contains element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator2"]}
    click element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator2"]}
    sleep  5s
    click element    ${object["Payroll MIS"]["Employee Location"]["Locator"]["Locator1"]}
    Wait until page contains element    ${object["Payroll MIS"]["Employee Location"]["Locator"]["Locator2"]}
    click element    ${object["Payroll MIS"]["Employee Location"]["Locator"]["Locator2"]}
    sleep  5s
    #click element    ${object["Payroll MIS"]["Payment Location"]["Locator"]["Locator1"]}
    #Wait until page contains element    ${object["Payroll MIS"]["Payment Location"]["Locator"]["Locator2"]}
    #click element    ${object["Payroll MIS"]["Payment Location"]["Locator"]["Locator2"]}

    click element    ${object["Payroll MIS"]["Pay Group"]["Locator"]["Locator1"]}
    click element    ${object["Payroll MIS"]["Pay Group"]["Locator"]["Locator2"]}

View Button
    click element    ${object["Payroll MIS"]["View Button"]["Locator"]["Locator1"]}
    Wait Until Page Does not Contain   ${object["Payroll MIS"]["View Button"]["Locator"]["Locator2"]}

Fill Arrear Report

    Select From List By Index      ${object["Payroll MIS"]["Financial Year"]["Locator"]}    4
    Wait until page contains element    ${object["Payroll MIS"]["Financial Year"]["Locator"]}
    Select From List By Index      ${object["Payroll MIS"]["Cycle Type"]["Locator"]}  2
    sleep   3s
    Select From List By Index      ${object["Payroll MIS"]["Payroll Cycle"]["Locator"]}  1
    sleep   3s
    Select From List By Index      ${object["Payroll MIS"]["Payroll Status"]["Locator"]}  0
    Wait until page contains element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator1"]}
    click element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator1"]}
    Wait until page contains element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator2"]}
    click element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator2"]}
    sleep  5s
    click element    ${object["Payroll MIS"]["Employee Location"]["Locator"]["Locator1"]}
    Wait until page contains element    ${object["Payroll MIS"]["Employee Location"]["Locator"]["Locator2"]}
    click element    ${object["Payroll MIS"]["Employee Location"]["Locator"]["Locator2"]}
    sleep  5s
    click element    ${object["Payroll MIS"]["Pay Group"]["Locator"]["Locator1"]}
    click element    ${object["Payroll MIS"]["Pay Group"]["Locator"]["Locator2"]}

Fill Leave Encashment Report
    Select From List By Index      ${object["Payroll MIS"]["Financial Year"]["Locator"]}    4
    Wait until page contains element    ${object["Payroll MIS"]["Financial Year"]["Locator"]}
    Select From List By Index      ${object["Payroll MIS"]["Cycle Type"]["Locator"]}  3
    sleep   4s
    Select From List By Index      ${object["Payroll MIS"]["Payroll Status"]["Locator"]}  0
    Wait until page contains element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator1"]}
    click element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator1"]}
    Wait until page contains element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator2"]}
    click element    ${object["Payroll MIS"]["Office Type"]["Locator"]["Locator2"]}
    sleep  4s
    click element    ${object["Payroll MIS"]["Employee Location"]["Locator"]["Locator1"]}
    Wait until page contains element    ${object["Payroll MIS"]["Employee Location"]["Locator"]["Locator2"]}
    click element    ${object["Payroll MIS"]["Employee Location"]["Locator"]["Locator2"]}
    sleep  5s
    click element    ${object["Payroll MIS"]["Pay Group"]["Locator"]["Locator1"]}
    Wait until page contains element    ${object["Payroll MIS"]["Pay Group"]["Locator"]["Locator2"]}
    click element    ${object["Payroll MIS"]["Pay Group"]["Locator"]["Locator2"]}
    #select date   ${object["Payroll MIS"]["LE Application From"]["Locator"]["Locator1"]}  jun  2022  1
    #select date   ${object["Payroll MIS"]["To Date"]["Locator"]["Locator1"]}  jun  2022  10

#select date
   # [Arguments]     ${locator1}  ${month}  ${year}  ${date}
    click element    ${object["Payroll MIS"]["LE Application From"]["Locator"]["Locator1"]}
    select from list by index    ${object["Payroll MIS"]["LE Application From"]["Locator"]["Locator2"]}   3
    select from list by index    ${object["Payroll MIS"]["LE Application From"]["Locator"]["Locator3"]}   0
    Get WebElement      ${object["Payroll MIS"]["LE Application From"]["Locator"]["Locator4"]}
    @{alldates} =   Get WebElements    ${object["Payroll MIS"]["LE Application From"]["Locator"]["Locator4"]}
    log many   @{alldates}
    FOR     ${date}     IN       @{all dates}
            ${date_text} =    Get Text   ${date}
            Run Keyword If        ${date_text} == 1    Click element     //tbody/tr/td/a [text()=${date_text}]
            Exit For Loop If      ${date_text} == 1
    END

    click element    ${object["Payroll MIS"]["To Date"]["Locator"]["Locator1"]}
    select from list by index    ${object["Payroll MIS"]["To Date"]["Locator"]["Locator2"]}   3
    select from list by index    ${object["Payroll MIS"]["To Date"]["Locator"]["Locator3"]}   0
    Get WebElement      ${object["Payroll MIS"]["To Date"]["Locator"]["Locator4"]}
    @{alldates} =   Get WebElements    ${object["Payroll MIS"]["To Date"]["Locator"]["Locator4"]}
    log many   @{alldates}
    FOR     ${date}     IN       @{all dates}
            ${date_text} =    Get Text   ${date}
            Run Keyword If        ${date_text} == 5    Click element     //tbody/tr/td/a [text()=${date_text}]
            Exit For Loop If      ${date_text} == 5
    END

    ${currentdate}=  Get Current Date
    ${convert}=     Convert Date    ${currentdate}      result_format=%d-%b-%Y
    Log         ${convert}      console=yes

Clicktodate
    [Arguments]  ${date}
    click element       ${date}

Load json
    ${data}     Get File    ${groupdata}
    ${object}=   Evaluate    json.loads('''${data}''')   json
    set global variable     ${object}
    Log Many    &{object}       console=yes

Verify Report
    Wait Until Page Does Not Contain     Sorry, an error occurred while processing your request      15s
    #scroll element into view     xpath: /div[@id='LoadingImage']//img
    Wait Until Element Is Not Visible    xpath: /div[@id='LoadingImage']//img     timeout=240
    Wait Until Element Is Visible    xpath: //*[@id="tabletab1"]/tbody/tr[1]      timeout=240
    #scroll element into view    xpath: //*[@id="tabletab1"]/tbody/tr[1]
    #${check} =  Get Text   xpath: //*[@id="tabletab1"]/tbody/tr[1]
    #Run Keyword If   '${check}'  == '1'
    Capture Page Screenshot











