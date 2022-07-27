*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library     Screenshot
Library     SeleniumScreenshots

*** Variables ***
${browser}  chrome
${url}  https://demoprojects.e-connectsolutions.com/eprash-test
#Data folder moved from resource to Qmate
${groupdata}    Resources/Data/MIS.json
@{alldates}
${date_text}
${date}
${check}
${i}

*** Keywords ***
Logintoapp
    open browser    ${url}     ${browser}
    wait until page contains    Password
    input text  id:LoginIdForShow       kritika.rsmml
    input text  id:PasswordForShow    admin
    click element  xpath://*[@id="btnLogin"]


Load json
    ${data}     Get File    ${groupdata}
    ${object}=   Evaluate    json.loads('''${data}''')   json
    set global variable     ${object}
    Log Many    &{object}       console=yes

Open Report
    go to  ${object["GSTR1"]["url"]}

Fill GSTR1 Report
    FOR     ${i}     IN RANGE     6
            select from list by index    ${object["GSTR1"]["GSTR Type"]["Locator"]}   ${i}
            #sleep   2s
            #click element    ${object["GSTR1"]["Unit"]["Locator"]["Locator1"]}
            #click element    ${object["GSTR1"]["Unit"]["Locator"]["Locator3"]}
            #sleep  2s
            #Input Text       //div[@id='select2-drop']//div[@class='select2-search']//input[@class='select2-input']    Head office

            #Press Keys        ${object["GSTR1"]["Unit"]["Locator"]["Locator2"]}  \ue007
            click element    ${object["GSTR1"]["From Date"]["Locator"]["Locator1"]}
            select from list by index    ${object["GSTR1"]["From Date"]["Locator"]["Locator2"]}   1
            select from list by index    ${object["GSTR1"]["From Date"]["Locator"]["Locator3"]}   0
            Get WebElement      ${object["GSTR1"]["From Date"]["Locator"]["Locator4"]}
            @{alldates} =   Get WebElements    ${object["GSTR1"]["From Date"]["Locator"]["Locator4"]}
            log many   @{alldates}
            FOR     ${date}     IN       @{all dates}
                    ${date_text} =    Get Text   ${date}
                    Run Keyword If        ${date_text} == 1    Click element     //tbody/tr/td/a [text()=${date_text}]
                    Exit For Loop If      ${date_text} == 1
            END
            sleep  2s
            click element    ${object["GSTR1"]["To Date"]["Locator"]["Locator1"]}
            select from list by index    ${object["GSTR1"]["To Date"]["Locator"]["Locator2"]}   2
            select from list by index    ${object["GSTR1"]["To Date"]["Locator"]["Locator3"]}   1
            Get WebElement      ${object["GSTR1"]["To Date"]["Locator"]["Locator4"]}
            @{alldates} =   Get WebElements    ${object["GSTR1"]["To Date"]["Locator"]["Locator4"]}
            log many   @{alldates}
            FOR     ${date}     IN       @{all dates}
                    ${date_text} =    Get Text   ${date}
                    Run Keyword If        ${date_text} == 5    Click element     //tbody/tr/td/a [text()=${date_text}]
                    Exit For Loop If      ${date_text} == 5
            END

            ${currentdate}=  Get Current Date
            ${convert}=     Convert Date    ${currentdate}      result_format=%d-%b-%Y
            Log         ${convert}      console=yes
            click element   ${object["GSTR1"]["Viewbutton"]["Locator"]}
            go to  ${object["GSTR1"]["url"]}
            #switch window   GSTR1(Sales)
            sleep    2
    END

Clicktodate
    [Arguments]  ${date}
    click element       ${date}