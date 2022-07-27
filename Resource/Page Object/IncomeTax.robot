*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library     Screenshot
Library     SeleniumScreenshots

*** Variables ***
${browser}  chrome
${url}  https://demoprojects.e-connectsolutions.com/eprash-dev

*** Keywords ***
Logintoapp1
    open browser    ${url}     ${browser}
    wait until page contains    Password
    input text  id:LoginIdForShow       kritika.rsmml
    input text  id:PasswordForShow    admin
    click element  xpath://*[@id="btnLogin"]

Load json1
    ${data}     Get File    ${groupdata}
    ${object}=   Evaluate    json.loads('''${data}''')   json
    set global variable     ${object}
    Log Many    &{object}       console=yes


Income Tax Deduction
    go to   ${object['Income Tax Deduction']['url']}

    select from list by index   ${object['Income Tax Deduction']['Financial year']['Locator']}   ${object['Income Tax Deduction']['Financial year']['Value']}
    click element   ${object['Income Tax Deduction']['Location']['Locator']['Locator1']}
    click element   ${object['Income Tax Deduction']['Location']['Locator']['Locator2']}
    click element   ${object['Income Tax Deduction']['Pay Group']['Locator']['Locator1']}
    sleep  2s
    click element   ${object['Income Tax Deduction']['Pay Group']['Locator']['Locator2']}
    sleep  2s
    click element   ${object['Income Tax Deduction']['Division']['Locator']['Locator1']}
    #click element   ${object['Income Tax Deduction']['Division']['Locator']['Locator2']}
    #click element   ${object['Income Tax Deduction']['Division']['Locator']['Locator2']}
    click element   ${object['Income Tax Deduction']['Employee Name']['Locator']['Locator1']}
    click element   ${object['Income Tax Deduction']['Employee Name']['Locator']['Locator2']}
    sleep  1s
    select from list by index   ${object['Income Tax Deduction']['Report Type']['Locator']}   ${object['Income Tax Deduction']['Report Type']['Value']}
    click element   ${object['Income Tax Deduction']['Recalculate]['Locator']}

    click element   ${object['Income Tax Deduction']['View Button']['Locator']}


