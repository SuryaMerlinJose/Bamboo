*** Settings ***
Documentation       Template robot main suite.


*** Tasks ***
Minimal task
    Log   ${CURDIR}      #c:\\Users\\Surya\\Documents\\GitHub\\Bamboo\\Bamboo_HR\\Test_cases
    Log   ..//${CURDIR}
    Log To Console     ${CURDIR}${/}..\\Images
