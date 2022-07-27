*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     DateTime
Resource    ../../Resources/Keywords.robot

*** Test Cases ***
IncomeTaxDetection Report
    [Documentation]   IncomeTaxDetection Report Testing

    Keywords.Go To ERP Page
    Keywords.Income Tax Report
