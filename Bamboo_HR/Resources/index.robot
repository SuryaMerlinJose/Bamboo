*** Settings ***
Library     SikuliLibrary
Library     RPA.Desktop
Library     RPA.Browser.Selenium
Variables   C:\\Users\\Surya\\Documents\\GitHub\\Bamboo\\Bamboo_HR\\Variables\\image.py
Library     RPA.Excel.Files



*** Variables ***
${URL}    https://quad.bamboohr.com/login.php?r=%2Fhome%2F
${screenshots}    C:\\Users\\Surya\\Documents\\GitHub\\Bamboo\\Bamboo_HR\\Screenshots
${xlsx}    C:\\Users\\Surya\\Documents\\GitHub\\Bamboo\\Bamboo_HR\\input\\emp_data.xlsx
*** Keywords ***

open chrome from desktop
    # Log    ${CURDIR}
    SikuliLibrary.Double Click    ${chrome_icon}
    Sleep    2
    # SikuliLibrary.Click    ${maximize}
    # Sleep    1
    SikuliLibrary.Input Text    ${url_bar}    ${URL}
    RPA.Desktop.Press Keys    ENTER

Logging into bamboo Bamboo_HR
    Sleep    5
    SikuliLibrary.Input Text    ${email}    suryamerlinjose@gmail.com
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${password}    Quad@123
    RPA.Desktop.Press Keys    ENTER

Add new employee
    [Arguments]    ${emp}
    Sleep    5
    SikuliLibrary.Click    ${people_button}
    Sleep    5
    SikuliLibrary.Click    ${add_new_employee}
    Sleep    3
    SikuliLibrary.Click    ${emp_id}
    SikuliLibrary.Input Text    ${emp_id}    ${emp}[employee_id]   
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${first_name}    ${emp}[first_name]
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${last_name}    ${emp}[last_name]
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Wheel Down    4
    SikuliLibrary.Click    ${dob}
    SikuliLibrary.Input Text    ${dob}    19/08/1999
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${gender}    ${emp}[gender]
    RPA.Desktop.Press Keys    ENTER
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${martial_status}    ${emp}[marital_status]
    RPA.Desktop.Press Keys    ENTER
    SikuliLibrary.Wheel Down    7
    SikuliLibrary.Click    ${city}
    SikuliLibrary.Input Text    ${city}    ${emp}[city]
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Click    ${state}
    SikuliLibrary.Input Text    ${state_search}   ${emp}[state] 
    RPA.Desktop.Press Keys    ENTER
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Input Text    ${zip}    ${emp}[zip]
    RPA.Desktop.Press Keys    TAB
    SikuliLibrary.Click     ${country}    
    SikuliLibrary.Input Text    ${country_search}    ${emp}[country]
    RPA.Desktop.Press Keys    ENTER
    SikuliLibrary.Click    ${save}
    Sleep    8
    SikuliLibrary.Click    ${screen_space}
    # ${path}    ${screenshots}/${emp}[employee_id].png
    SikuliLibrary.Add Image Path    ${screenshots}/${emp}[employee_id].png
    # SikuliLibrary.Set Capture Folder    ${screenshots}/${emp}[employee_id].png
    SikuliLibrary.Capture Screen        
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