*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource    ../../Resources/Keywords.robot

*** Test Cases ***
PayrollMIS Report
    [Documentation]   Payroll MIS Report Testing
    [Tags]  admin Payroll MIS
    Keywords.Login to ERP Page
    Keywords.Salary Report
    Keywords.Arrear Report
    Keywords.Leave Encashment Report

   # Keywords.Verify Report