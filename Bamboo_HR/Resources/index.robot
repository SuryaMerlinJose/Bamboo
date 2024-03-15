*** Settings ***
Library     SikuliLibrary
Library     RPA.Desktop
Library     RPA.Browser.Selenium
Variables   ../Variable/image.py

Library     RPA.Excel.Files



*** Variables ***
${URL}    https://quad.bamboohr.com/login.php?r=%2Fhome%2F
${screenshots}    ${CURDIR}${/}..\\Screenshots
${xlsx}   ${CURDIR}${/}..\\input\\emp_data.xlsx
${IMGDIR}    ${CURDIR}${/}..\\Images

*** Keywords ***

open chrome from desktop
    Log To Console    ${CURDIR}${/}..\\Images
    SikuliLibrary.Double Click    ${IMGDIR}/${chrome_icon}
    Sleep    2
    # SikuliLibrary.Click    ${maximize}
    # Sleep    1
    Sleep    3   
    ${is_exist}    SikuliLibrary.Exists    ${IMGDIR}/${maximize}
    
    IF     ${is_exist}==True
        Log    ${is_exist}
        SikuliLibrary.Double Click    ${top_bar}
        # RPA.Desktop.Press Keys    Windows    Up 
    END
    SikuliLibrary.Input Text    ${IMGDIR}/${url_bar}    ${URL}
    RPA.Desktop.Press Keys    ENTER

Logging into bamboo Bamboo_HR
    Sleep    5
    SikuliLibrary.Input Text    ${IMGDIR}/${email}    suryamerlinjose@gmail.com
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${IMGDIR}/${password}    Quad@123
    RPA.Desktop.Press Keys    ENTER

Add new employee
    [Arguments]    ${emp}
    Sleep    5
    SikuliLibrary.Click    ${IMGDIR}/${people_button}
    Sleep    5
    SikuliLibrary.Click    ${IMGDIR}/${add_new_employee}
    Sleep    3
    SikuliLibrary.Click    ${IMGDIR}/${emp_id}
    SikuliLibrary.Input Text    ${IMGDIR}/${emp_id}    ${emp}[employee_id]   
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${IMGDIR}/${first_name}    ${emp}[first_name]
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${IMGDIR}/${last_name}    ${emp}[last_name]
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Wheel Down    4
    SikuliLibrary.Click    ${IMGDIR}/${dob}
    SikuliLibrary.Input Text    ${IMGDIR}/${dob}    19/08/1999
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${IMGDIR}/${gender}    ${emp}[gender]
    RPA.Desktop.Press Keys    ENTER
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${IMGDIR}/${martial_status}    ${emp}[marital_status]
    RPA.Desktop.Press Keys    ENTER
    SikuliLibrary.Wheel Down    7
    SikuliLibrary.Click    ${IMGDIR}/${city}
    SikuliLibrary.Input Text    ${IMGDIR}/${city}    ${emp}[city]
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Click    ${IMGDIR}/${state}
    SikuliLibrary.Input Text    ${IMGDIR}/${state_search}   ${emp}[state] 
    RPA.Desktop.Press Keys    ENTER
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${IMGDIR}/${zip}    ${emp}[zip]
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Click     ${IMGDIR}/${country}    
    SikuliLibrary.Input Text    ${IMGDIR}/${country_search}    ${emp}[country]
    RPA.Desktop.Press Keys    ENTER
    SikuliLibrary.Click    ${IMGDIR}/${save}
    Sleep    8
    SikuliLibrary.Click    ${IMGDIR}/${screen_space}
    # ${path}    ${screenshots}/${emp}[employee_id].png
    # SikuliLibrary.Add Image Path    ${screenshots}/${emp}[employee_id].png
    # SikuliLibrary.Set Capture Folder    ${screenshots}/${emp}[employee_id].png
    ${path}=    SikuliLibrary.Capture Screen   
    Log    ${path} 

    # Capture Page Screenshot    ${screenshots}/${emp}[employee_id].png    #Error: Cannot capture screenshot because no browser is open.
    # Take Screenshot
    
    

Adding new employee
    Open Workbook    ${xlsx}
    ${employee}=    Read Worksheet As Table    header=True 
    FOR    ${emp}    IN    @{employee}
        Add new employee    ${emp}
          
    END
    








*** Tasks ***
bambo HR
    Sleep    2
    open chrome from desktop
    Logging into bamboo Bamboo_HR
    Adding new employee