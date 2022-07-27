*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource    ../../Resource/Keywords.robot

*** Test Cases ***
Monthly Report Salary testcase
    [Documentation]   Monthly Report Testing
    [Tags]  Monthly MIS Report
    Keywords.Go to Loginpage
    Keywords.Open ReportOfSalary
    Keywords.Verify Salary Report
    Keywords.Open ReportOfArrear
    Keywords.Verify ReportOfArrear
    Keywords.Open LeaveEncashment
    Keywords.Verify LeaveEncashment
    Keywords.Open Bonus
    Keywords.Verify Bonus


