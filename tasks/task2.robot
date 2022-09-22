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
    Click Element    //*[@id='dt_VRTC6744793']

Choose Underlying Contract
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]
    Wait Until Page Contains Element    //*[@class="cq-symbol-select-btn__container"]    20  #tab market dropdown menu
    Click Element    //*[@class="cq-symbol-select-btn__container"]
    Sleep    5
    Wait Until Page Contains Element    //*[@class="sc-mcd__filter"]    10
    Wait Until Page Contains Element    //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]    20     #synthetic indices tab
    Click Element    //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]
    Wait Until Page Contains Element    //div[@class='sc-mcd__item sc-mcd__item--1HZ10V ']    30     #volatility 10(1s) index tab
    Click Element    //div[@class='sc-mcd__item__name']

Choose Trade Type
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]
    Wait Until Page Contains Element    //div[@data-testid="dt_contract_dropdown"]    20
    Click Element    //div[@data-testid="dt_contract_dropdown"]
    Wait Until Page Contains Element    //div[@class="dc-vertical-tab__content-container"]    20
    Wait Until Page Contains Element    //div[@id="dt_contract_rise_fall_item"]    20
    Click Element    //div[@id="dt_contract_rise_fall_item"] 

Verify Duration Is 5 Ticks
    Wait Until Page Contains Element    //*[@class="sidebar__container desktop-only"]    20
    Wait Until Page Contains Element    //*[@data-testid="tick_step_5"]    20

Set Stake Amount to 10 USD
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]
    Click Element    //button[@id="dc_stake_toggle_item"]
    Click Element    //input[@id="dt_amount_input"]    
    Press Keys    //input[@id="dt_amount_input"]    CTRL+a+BACKSPACE
    Press Keys    //input[@id="dt_amount_input"]    \\10

Buy Rise Contract    
    Wait Until Page Contains Element    //button[@id="dt_purchase_call_button"]    20
    Click Element    //button[@id="dt_purchase_call_button"]
    