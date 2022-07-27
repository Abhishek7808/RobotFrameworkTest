*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem

*** Variables ***
${HrmsData}     Resource/Data/HrmsData.json

*** Test Cases ***
Salary_Cycle_Creation
    [Tags]  SalaryCycle
    Login_into_EPRASH
    Go To          ${OBJECT["Salary_Cycle"]["URL"]}
    Input Text      ${OBJECT["Salary_Cycle"]["Description"]["Locator"]}    Apr 22
    Select From List By Label       ${OBJECT["Salary_Cycle"]["Financial_Year"]["Locator"]}       ${OBJECT["Salary_Cycle"]["Financial_Year"]["Value"]}

RUN_BEFORE_ANY_TEST_EXECUTION
    [Tags]  JSON Data Set
    Load JSON

*** Keywords ***
Load JSON
    ${json}     Get File    ${HrmsData}
    # convert the data to a python object
    ${OBJECT}=  Evaluate  json.loads('''${json}''')  json
    Set Global Variable     ${OBJECT}




