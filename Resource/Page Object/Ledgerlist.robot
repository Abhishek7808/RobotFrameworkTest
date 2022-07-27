*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library      SeleniumScreenshots
Library      Screenshot
#Resource    ../../Resource/Keywords.robot (Circular import is a bad practice ;) )

*** Variables ***

${browser}  chrome
${url}  https://demoprojects.e-connectsolutions.com/eprash-dev
#Data folder moved from resource to Qmate
${groupdata}    Resource/Data/MIS.json
@{alldates}
${date_text}
${date}
${check}
${typestring}

*** Keywords ***
Logintoapp

    open browser    ${url}     ${browser}
    Maximize browser window
    wait until page contains    Password
    input text  id:LoginIdForShow       kritika.rsmml
    input text  id:PasswordForShow    admin
    click element  xpath://*[@id="btnLogin"]

Ledgerlisting
    go to       ${object["Ledger Listing"]["url"]}
    sleep   1s
    click element   ${object["Ledger Listing"]["Account Name"]["Locator"]["Locator1"]}
    click element   ${object["Ledger Listing"]["Account Name"]["Locator"]["Locator2"]}
    input text      ${object["Ledger Listing"]["Account Name"]["Locator"]["Locator2"]}       ${object["Ledger Listing"]["Account Name"]["Value"]}
    press keys        ${object["Ledger Listing"]["Account Name"]["Locator"]["Locator2"]}   \ue007
    click element    ${object["Ledger Listing"]["Voucher Type"]["Locator"]["Locator1"]}
    click element   ${object["Ledger Listing"]["Voucher Type"]["Locator"]["Locator2"]}      #${object["Ledger Listing"]["Voucher Type"]["Value"]}
    click element   ${object["Ledger Listing"]["Unit"]["Locator"]["Locator1"]}
    input text      ${object["Ledger Listing"]["Unit"]["Locator"]["Locator2"]}      ${object["Ledger Listing"]["Unit"]["Value"]}
    Press Keys       ${object["Ledger Listing"]["Unit"]["Locator"]["Locator2"]}      \ue007

    click element   ${object["Ledger Listing"]["Show Child Unit"]["Locator"]}
    Select From List By Label   ${object["Ledger Listing"]["Show Child Unit"]["Locator"]}       ${object["Ledger Listing"]["Show Child Unit"]["Value"]}
    click element   ${object["Ledger Listing"]["Status"]["Locator"]}
    Select From List By Label   ${object["Ledger Listing"]["Status"]["Locator"]}    Approved
    click element   ${object["Ledger Listing"]["View"]["Locator"]}
    Select From List By Label   ${object["Ledger Listing"]["View"]["Locator"]}      Ledger View


    #wait until page contains    Ledger List Report




Getdate

    click element       ${object["Ledger Listing"]["Date From"]["Locator"]["Locator1"]}
    click element       ${object["Ledger Listing"]["Date From"]["Locator"]["Locator2"]}
    select from list by label   ${object["Ledger Listing"]["Date From"]["Locator"]["Locator2"]}     Apr
    click element       ${object["Ledger Listing"]["Date From"]["Locator"]["Locator3"]}
    select from list by label   ${object["Ledger Listing"]["Date From"]["Locator"]["Locator3"]}     2022
    Get WebElement      ${object["Ledger Listing"]["Date From"]["Locator"]["Locator4"]}
    @{alldates} =   Get WebElements    ${object["Ledger Listing"]["Date From"]["Locator"]["Locator4"]}
    log many    @{alldates}
    FOR     ${date}     IN       @{all dates}
            ${date_text} =    Get Text   ${date}
            Run Keyword If        ${date_text} == 1   click element       //table[@class='ui-datepicker-calendar']//a[text()=${date_text}]
            Exit For Loop If    ${date_text} == 1
    END


    ${currentdate}=  Get Current Date   result_format=%d%m%Y
    #${convert}=     Convert Date    ${currentdate}      convert
    log many    ${currentdate}
    input text      ${object["Ledger Listing"]["Date To"]["Locator"]}       ${currentdate}
    sleep   1s

#Clicktodate
    #[Arguments]  ${date}
    #click element       ${date}

    #sleep   3s
Load json
    ${data}     Get File    ${groupdata}
    ${object}=   Evaluate    json.loads('''${data}''')   json
    set global variable     ${object}
    Log Many    &{object}       console=yes

Viewbutton
     click element       ${object["Ledger Listing"]["Viewbutton"]["Locator"]}
     sleep  1s
     switch window      LedgerList Report


check error

    Wait Until Page Does Not Contain        Sorry, an error occurred while processing your request      15s
    ${check} =   Get Text    xpath://body[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/div[2]/div[1]/table[2]/tbody[1]/tr[2]/td[1]
    Run keyword If      '${check}' == '1'     Capture Page Screenshot







