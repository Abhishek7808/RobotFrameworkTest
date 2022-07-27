*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Library     Screenshot
Resource    ../../Resources/Keywords.robot

*** Test Cases ***
GSTR1 Sales Report
    [Documentation]   GSTR1 Sales Report Testing
    [Tags]  admin GSTR1 Sales Report
    Keywords.Go to ERP 2
    Keywords.Open GSTR1 Sales Report
    Keywords.Verify Report