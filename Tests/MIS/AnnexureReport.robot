*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource    ../../Resource/Keywords.robot

*** Test Cases ***
Annexure Report
    [Documentation]   Annexure Report Testing
    [Tags]  admin Annexure MIS
    Keywords.LoginForAnnexure
    Keywords.Open Annexure Report
    Keywords.Verify Annexure Report