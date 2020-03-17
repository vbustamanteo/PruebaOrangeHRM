*** Settings ***
Library    SeleniumLibrary    

*** Test Cases ***
OrangeHrmLogin
    Open Browser    ${URLLOGIN}    chrome
    Set Browser Implicit Wait    5
    Input Text    id:txtUsername    @{CREDENCIALES}[0]
    Input Password    id:txtPassword    &{LOGINDATA}[password]
    Click Button    id:btnLogin
    Log    Ingresando al sistema como &{LOGINDATA}[usuario]
    
OrangeHrmAdminSearchEditUserAdmin
    Click Link    id:menu_admin_viewAdminModule
    Click Link    id:menu_admin_UserManagement
    Click Link    id:menu_admin_viewSystemUsers    
    Input Text    id:searchSystemUser_userName    @{USER}[0]
    Click Button    id:searchBtn
    Click Link    saveSystemUser?userId=@{USER}[1]
    Sleep    2    
    Click Element    id:btnCancel
    Log    Se busco al usuario ${USER} y se visualizo
    
OrangeHrmLogout
    Sleep    2    
    Click Link    id:welcome    
    Click Link    link:Logout
    Close Browser
    Log    Logout Exitoso. Realizado por %{USER}

*** Variables ***
${URLLOGIN}    https://opensource-demo.orangehrmlive.com/index.php/auth/validateCredentials
@{CREDENCIALES}    Admin    admin123
&{LOGINDATA}    usuario=Admin    password=admin123
@{USER}    Admin    1
