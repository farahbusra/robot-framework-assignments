*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
Login To Deriv
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element    dt_login_button
    Wait Until Page Contains Element    //input[@type='email']    10
    Input Text    //input[@type='email']    email
    Input Text    //input[@type='password']    password
    Click Element    //button[@type='submit']
    Wait Until Page Contains Element    dt_core_account-info_acc-info    30

Navigate To Demo Account
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]
    Click Element    dt_core_account-info_acc-info
    Click Element    //*[@id="dt_core_account-switcher_demo-tab"]
   # Wait Until Element Is Visible    //*[@id="dt_core_account-switcher_demo-tab"]
    Click Element    //*[@id='dt_VRTC6744793']