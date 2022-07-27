*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource    ../../Resource/Keywords.robot

*** Test Cases ***
Ledger Listing Report
    [Documentation]   Ledger Listing Report Testing
    [Tags]  admin Ledger Listing MIS
    Keywords.Go to ERP
    Keywords.Open Ledger Listing Report
    Keywords.Verify Report
