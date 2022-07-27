*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library      SeleniumScreenshots
Library      Screenshot
#Resource    ../../Resource/Keywords.robot (Circular import is a bad practice ;) )

*** Variables ***

${browser}  chrome
${url1}  https://demoprojects.e-connectsolutions.com/eprash-test
#Data folder moved from resource to Qmate
${groupdata}    Resource/Data/MIS.json
@{alldates}
${date_text}
${date}
${check}
${typestring}
${Locator1}
${Month}
${Year}
${Date1}

*** Keywords ***
Logintoapp3

    open browser    ${url1}     ${browser}
    Maximize browser window
    wait until page contains    Password
    input text  id:LoginIdForShow       kritika.rsmml
    input text  id:PasswordForShow    admin
    click element  xpath://*[@id="btnLogin"]

OpenAnnexurepage

    go to       ${object["Annexure C1"]["url"]}
    sleep   1s
    select from list by index       ${object["Annexure C1"]["Financial Year"]["Locator"]}       3

    #selecting date from and date to
    Selectdate   ${object["Annexure C1"]["Date From"]["Locator"]["Locator1"]}     Apr     2022    1
    Selectdate   ${object["Annexure C1"]["Date To"]["Locator"]["Locator1"]}     Apr     2022    30
    sleep   1s
    #selecting head office
    click element   ${object["Annexure C1"]["Location"]["Locator"]["Locator1"]}
    Wait until page contains element    ${object["Annexure C1"]["Location"]["Locator"]["Locator2"]}
    #click element      ${object["Annexure C1"]["Location"]["Locator"]["Locator2"]}

    input text      ${object["Annexure C1"]["Location"]["Locator"]["Locator2"]}       Head Office
    press keys        ${object["Annexure C1"]["Location"]["Locator"]["Locator2"]}     \ue007

    #selecting type
    click element    ${object["Annexure C1"]["Type"]["Locator"]["Locator1"]}
    click element   ${object["Annexure C1"]["Type"]["Locator"]["Locator3"]}
    input text      ${object["Annexure C1"]["Type"]["Locator"]["Locator2"]}     Salary
    click element   ${object["Annexure C1"]["Type"]["Locator"]["Locator4"]}

    #selecting salary head
    click element   ${object["Annexure C1"]["Salary Head"]["Locator"]["Locator1"]}
    input text      ${object["Annexure C1"]["Salary Head"]["Locator"]["Locator2"]}     Basic Pay
    click element   ${object["Annexure C1"]["Salary Head"]["Locator"]["Locator3"]}
    click element   ${object["Annexure C1"]["Checkbox"]["Locator"]}
    click element   ${object["Annexure C1"]["Viewbutton"]["Locator"]}
    switch window   Show Salary

VerifyAnnexure
    Wait Until Page Does Not Contain        No Record Found      15s
    Wait Until Element Is Not Visible       xpath://div[@id='LoadingImage']     timeout=120
    ${check} =   Get Text       xpath://*[@id="dttable"]/tbody/tr[1]/td[1]
    Run keyword If      '${check}' == '1'     Capture Page Screenshot



Selectdate
    [Arguments]  ${Locator1}    ${Month}     ${Year}    ${Date1}
    click element       ${Locator1}
    click element       ${object["Ledger Listing"]["Date From"]["Locator"]["Locator2"]}
    select from list by label   ${object["Ledger Listing"]["Date From"]["Locator"]["Locator2"]}     ${Month}
    click element       ${object["Ledger Listing"]["Date From"]["Locator"]["Locator3"]}
    select from list by label   ${object["Ledger Listing"]["Date From"]["Locator"]["Locator3"]}     ${Year}
    Get WebElement      ${object["Ledger Listing"]["Date From"]["Locator"]["Locator4"]}
    @{alldates} =   Get WebElements    ${object["Ledger Listing"]["Date From"]["Locator"]["Locator4"]}
    log many    @{alldates}
    FOR     ${date}     IN       @{all dates}
            ${date_text} =    Get Text   ${date}
            Run Keyword If        ${date_text} == ${Date1}   click element       //table[@class='ui-datepicker-calendar']//a[text()=${date_text}]
            Exit For Loop If    ${date_text} == ${Date1}
    END

Loadjson1
    ${data}     Get File    ${groupdata}
    ${object}=   Evaluate    json.loads('''${data}''')   json
    set global variable     ${object}
    Log Many    &{object}       console=yes