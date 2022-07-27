*** Settings ***
Library		SeleniumLibrary
Resource     ../../Resource/Keywords.robot
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Library     String
Library     RequestsLibrary
Library     DateTime
Library     OperatingSystem

*** Variables ***
${HrmsData}     Resource/Data/HrmsData.json


*** Keywords ***
TestJSONPath
    #${json}     Get File    HrmsData.json
    ${json}     Get File    ${HrmsData}
    # convert the data to a python object
    ${object}=  Evaluate  json.loads('''${json}''')  json
    #set Suite variable     ${object}
    Log Many    ${object}

Date
    ${currentDate}  get current date
    ${month}  convert date  ${currentDate}  result_format=%B
    Log Many     ${month}
    ${month}  strip string  ${month}
    ############
    ${month}  convert date  ${currentDate}  result_format=%m
    Log Many     ${month}
    ${month}  strip string  ${month}
