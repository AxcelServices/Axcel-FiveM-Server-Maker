@echo off
TITLE Axcel ^| FiveM Server Maker ^| Version: 1.0
color 0f
mode con cols=80 lines=25
chcp 65001 >nul
cls

CALL :LOGO
echo]
echo]
echo   [90m^>  [97mCFX Default 1
echo   [90m^>  [97mESX Legacy 2
echo   [90m^>  [97mRequired apps 3
echo]
SET selection=
SET /P selection=

IF /I '%selection%' == '1' GOTO cfx-default
IF /I '%selection%' == '2' GOTO esx-legacy
IF /I '%selection%' == '3' GOTO req-apps



:cfx-default
cls
TITLE Axcel ^| FiveM Server Maker ^| Version: 1.0 ^| CFX Default
color 0f
mode con cols=100 lines=25
echo.
echo          [96m██[96m██[96m██[97m╗[96m██[96m██[96m███[97m╗[96m██[97m╗  [96m██[97m╗    [96m██[96m██[96m██[97m╗ [96m██[96m██[96m███[97m╗[96m██[96m██[96m███[97m╗ [96m██[96m███[97m╗ [96m██[97m╗   [96m██[97m╗[96m██[97m╗  [96m██[96m██[96m██[96m██[97m╗
echo         [96m██[97m╔[97m═[97m═[97m═[97m═[97m╝[96m██[97m╔[97m═[97m═[97m═[97m═[97m╝[97m╚[96m██[97m╗[96m██[97m╔[97m╝    [96m██[97m╔[97m═[97m═[96m██[97m╗[96m██[97m╔[97m═[97m═[97m═[97m═[97m╝[96m██[97m╔[97m═[97m═[97m═[97m═[97m╝[96m██[97m╔[97m═[97m═[96m██[97m╗[96m██[97m║   [96m██[97m║[96m██[97m║  [97m╚[97m═[97m═[96m██[97m╔[97m═[97m═[97m╝
echo         [96m██[97m║     [96m██[96m███[97m╗   [97m╚[96m███[97m╔[97m╝     [96m██[97m║  [96m██[97m║[96m██[96m███[97m╗  [96m██[96m███[97m╗  [96m██[96m██[96m███[97m║[96m██[97m║   [96m██[97m║[96m██[97m║     [96m██[97m║   
echo         [96m██[97m║     [96m██[97m╔[97m═[97m═[97m╝   [96m██[97m╔[96m██[97m╗     [96m██[97m║  [96m██[97m║[96m██[97m╔[97m═[97m═[97m╝  [96m██[97m╔[97m═[97m═[97m╝  [96m██[97m╔[97m═[97m═[96m██[97m║[96m██[97m║   [96m██[97m║[96m██[97m║     [96m██[97m║   
echo         [97m╚[96m██[96m██[96m██[97m╗[96m██[97m║     [96m██[97m╔[97m╝ [96m██[97m╗    [96m██[96m██[96m██[97m╔[97m╝[96m██[96m██[96m███[97m╗[96m██[97m║     [96m██[97m║  [96m██[97m║[97m╚[96m██[96m██[96m██[97m╔[97m╝[96m██[96m██[96m███[97m╗[96m██[97m║   
echo          [97m╚[97m═[97m═[97m═[97m═[97m═[97m╝[97m╚[97m═[97m╝     [97m╚[97m═[97m╝  [97m╚[97m═[97m╝    [97m╚[97m═[97m═[97m═[97m═[97m═[97m╝ [97m╚[97m═[97m═[97m═[97m═[97m═[97m═[97m╝[97m╚[97m═[97m╝     [97m╚[97m═[97m╝  [97m╚[97m═[97m╝ [97m╚[97m═[97m═[97m═[97m═[97m═[97m╝ [97m╚[97m═[97m═[97m═[97m═[97m═[97m═[97m╝[97m╚[97m═[97m╝   
echo]
echo]
echo    You have selected number '1'. We will create a CFX Default Server for you.
echo    If you selected the wrong number, press CTRL + C to exit the program.
echo    If your selection is correct, press any key to continue. & pause >nul
cls
echo    Put your desktop path
SET desktoppath=
SET /P desktoppath=
cls
echo Downloading...

REM DOWNLOADING FIVEM SERVER

set "DESKTOP=%desktoppath%"
set "AXCEL_SERVER_FOLDER=%DESKTOP%\Axcel_CFX_Server"
set "ARTIFACT_FOLDER=%AXCEL_SERVER_FOLDER%\artifacts"
set "SCRIPTS_FOLDER=%AXCEL_SERVER_FOLDER%\scripts"

if not exist "%AXCEL_SERVER_FOLDER%" (
    mkdir "%AXCEL_SERVER_FOLDER%"
)

if not exist "%ARTIFACT_FOLDER%" (
    mkdir "%ARTIFACT_FOLDER%"
)

if not exist "%SCRIPTS_FOLDER%" (
    mkdir "%SCRIPTS_FOLDER%"
)

set "URL=https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/7290-a654bcc2adfa27c4e020fc915a1a6343c3b4f921/server.7z"
set "DURL=https://cdn.discordapp.com/attachments/991449152380747886/1260345302150549605/server-cfx.zip?ex=668efb88&is=668daa08&hm=170bb65c7fb74ee7de3dd8f1c12911feda9ae5521f35e62242543be56571bd50&"
set "DNAME=server-cfx.zip"
set "FILENAME=server.7z"

:: Downloading server.7z
curl -o "%FILENAME%" "%URL%"
:: Downloading server-cfx.zip
curl -o "%DNAME%" "%DURL%"

:: Unzipping server-cfx.zip into scripts folder
if exist "%DNAME%" (
    if exist "%ProgramFiles%\7-Zip\7z.exe" (
        "%ProgramFiles%\7-Zip\7z.exe" x "%DNAME%" -o"%SCRIPTS_FOLDER%"
    ) else (
        if exist "%ProgramFiles%\WinRAR\WinRAR.exe" (
            "%ProgramFiles%\WinRAR\WinRAR.exe" x "%DNAME%" "%SCRIPTS_FOLDER%"
        ) else (
            echo Neither 7-Zip nor WinRAR is available to unzip the file.
            exit /b 1
        )
    )
    del "%DNAME%"
) else (
    echo Failed to download %DNAME%.
)

:: Unzipping server.7z into artifacts folder
if exist "%FILENAME%" (
    if exist "%ProgramFiles%\7-Zip\7z.exe" (
        "%ProgramFiles%\7-Zip\7z.exe" x "%FILENAME%" -o"%ARTIFACT_FOLDER%"
    ) else (
        if exist "%ProgramFiles%\WinRAR\WinRAR.exe" (
            "%ProgramFiles%\WinRAR\WinRAR.exe" x "%FILENAME%" "%ARTIFACT_FOLDER%"
        ) else (
            echo Neither 7-Zip nor WinRAR is available to unzip the file.
            exit /b 1
        )
    )
    del "%FILENAME%"
) else (
    echo Failed to download %FILENAME%.
)
cls
echo [92mWe have successfully downloaded [97mthe CFX Default server
echo Press any button to continue...
pause >nul
goto TutoSec
start "" "%USERPROFILE%\Desktop\Axcel_CFX_Server\scripts"
REM FINISHED DOWNLOADING FIVEM SERVER







:esx-legacy
cls
TITLE Axcel ^| FiveM Server Maker ^| Version: 1.0 ^| ESX Legacy
color 0f
mode con cols=100 lines=25
echo.
echo         [96m██[96m██[96m███[97m╗[96m██[96m██[96m███[97m╗[96m██[97m╗  [96m██[97m╗    [96m██[97m╗     [96m██[96m██[96m███[97m╗ [96m██[96m██[96m██[97m╗  [96m██[96m███[97m╗  [96m██[96m██[96m██[97m╗[96m██[97m╗   [96m██[97m╗
echo         [96m██[97m╔════[97m╝[96m██[97m╔════[97m╝╚[96m██[97m╗[96m██[97m╔[97m╝    [96m██[97m║     [96m██[97m╔════[97m╝[96m██[97m╔════[97m╝ [96m██[97m╔══[96m██[97m╗[96m██[97m╔════[97m╝╚[96m██[97m╗ [96m██[97m╔[97m╝
echo         [96m██[96m███[97m╗  [96m██[96m██[96m███[97m╗ ╚[96m███[97m╔[97m╝     [96m██[97m║     [96m██[96m███[97m╗  [96m██[97m║  [96m███[97m╗[96m██[96m██[96m███[97m║[96m██[97m║      ╚[96m██[96m██[97m╔[97m╝ 
echo         [96m██[97m╔══[97m╝  ╚════[96m██[97m║ [96m██[97m╔[96m██[97m╗     [96m██[97m║     [96m██[97m╔══[97m╝  [96m██[97m║   [96m██[97m║[96m██[97m╔══[96m██[97m║[96m██[97m║       ╚[96m██[97m╔[97m╝  
echo         [96m██[96m██[96m███[97m╗[96m██[96m██[96m███[97m║[96m██[97m╔[97m╝ [96m██[97m╗    [96m██[96m██[96m███[97m╗[96m██[96m██[96m███[97m╗╚[96m██[96m██[96m██[97m╔[97m╝[96m██[97m║  [96m██[97m║╚[96m██[96m██[96m██[97m╗   [96m██[97m║   
echo         ╚══════[97m╝╚══════[97m╝╚═[97m╝  ╚═[97m╝    ╚══════[97m╝╚══════[97m╝ ╚═════[97m╝ ╚═[97m╝  ╚═[97m╝ ╚═════[97m╝   ╚═[97m╝   
echo]
echo]
echo    You have selected number '2'. We will create a ESX Legacy Server for you.
echo    If you selected the wrong number, press CTRL + C to exit the program.
echo    If your selection is correct, press any key to continue. & pause >nul
cls
echo    Put your desktop path
SET desktoppath=
SET /P desktoppath=
cls
echo Downloading...

REM DOWNLOADING FIVEM SERVER

set "DESKTOP=%desktoppath%"
set "AXCEL_SERVER_FOLDER=%DESKTOP%\Axcel_ESX_Server"
set "ARTIFACT_FOLDER=%AXCEL_SERVER_FOLDER%\artifacts"
set "SCRIPTS_FOLDER=%AXCEL_SERVER_FOLDER%\scripts"

if not exist "%AXCEL_SERVER_FOLDER%" (
    mkdir "%AXCEL_SERVER_FOLDER%"
)

if not exist "%ARTIFACT_FOLDER%" (
    mkdir "%ARTIFACT_FOLDER%"
)

if not exist "%SCRIPTS_FOLDER%" (
    mkdir "%SCRIPTS_FOLDER%"
)

set "URL=https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/7290-a654bcc2adfa27c4e020fc915a1a6343c3b4f921/server.7z"
set "DEURL=https://cdn.discordapp.com/attachments/991449152380747886/1260364072399011860/esx_legacy_axcel.zip?ex=668f0d03&is=668dbb83&hm=b4a78b678322f5d8f2cc8fe4655424255f2bdfc78a11c18df2a3f7e4cb0dbf3b&"
set "DEURLNAME=esx_legacy_axcel.zip"
set "FILENAME=server.7z"

curl -o "%FILENAME%" "%URL%"
curl -o "%DEURLNAME%" "%DEURL%"


if exist "%DEURLNAME%" (
    if exist "%ProgramFiles%\7-Zip\7z.exe" (
        "%ProgramFiles%\7-Zip\7z.exe" x "%DEURLNAME%" -o"%SCRIPTS_FOLDER%"
    ) else (
        if exist "%ProgramFiles%\WinRAR\WinRAR.exe" (
            "%ProgramFiles%\WinRAR\WinRAR.exe" x "%DEURLNAME%" "%SCRIPTS_FOLDER%"
        ) else (
            echo Neither 7-Zip nor WinRAR is available to unzip the file.
            exit /b 1
        )
    )
    del "%DEURLNAME%"
) else (
    echo Failed to download %DEURLNAME%.
)

:: Unzipping server.7z into artifacts folder
if exist "%FILENAME%" (
    if exist "%ProgramFiles%\7-Zip\7z.exe" (
        "%ProgramFiles%\7-Zip\7z.exe" x "%FILENAME%" -o"%ARTIFACT_FOLDER%"
    ) else (
        if exist "%ProgramFiles%\WinRAR\WinRAR.exe" (
            "%ProgramFiles%\WinRAR\WinRAR.exe" x "%FILENAME%" "%ARTIFACT_FOLDER%"
        ) else (
            echo Neither 7-Zip nor WinRAR is available to unzip the file.
            exit /b 1
        )
    )
    del "%FILENAME%"
) else (
    echo Failed to download %FILENAME%.
)
cls
echo [92mWe have successfully downloaded [97mthe ESX Legacy server
echo Press any button to continue...
pause >nul
goto TutoSec
start "" "%USERPROFILE%\Desktop\Axcel_ESX_Server\scripts"
REM FINISHED DOWNLOADING FIVEM SERVER





:TutoSec
cls
TITLE Axcel ^| FiveM Server Maker ^| Version: 1.0 ^| Tutorial Section
echo.

CALL :LOGO
echo.
echo   [90m^>  [97mShow how to create a KeyMaster Key 1
echo   [90m^>  [97mShow how to get your Steam Web Api Key 2
echo   [90m^>  [97mExit 3
echo]

SET selection=
SET /P selection=

IF /I '%selection%' == '1' GOTO KeyMasterTuto
IF /I '%selection%' == '2' GOTO SteamWebTuto
IF /I '%selection%' == '3' exit


:KeyMasterTuto
TITLE Axcel ^| FiveM Server Maker ^| Version: 1.0 
cls
CALL :LOGO
echo.
echo Create a key on KeyMaster
start https://keymaster.fivem.net
echo.
echo How to create a key on KeyMaster:
echo.
echo 1. Log in with your Cfx.re account on KeyMaster.
echo 2. Click the button on the left side labeled 'New server.'
echo 3. Enter a Display name (can be any name).
echo 4. Enter your IP address.
echo 5. Set server type to 'Other/Home hosted.'
echo 6. Set provider to 'localhost.'
echo.
echo Finally, click 'Generate' and copy your key.
echo.
echo Where do you enter the KeyMaster key?
echo.
echo 1. Open the server.cfg file.
echo 2. Find where it says 'sv_licenseKey changeme.'
echo 3. Replace 'changeme' with your key.
echo Press any button to continue...
pause >nul
goto TutoSec

:SteamWebTuto
TITLE Axcel ^| FiveM Server Maker ^| Version: 1.0 
start https://steamcommunity.com/dev/apikey
cls
CALL :LOGO
echo.
echo How to get your Steam Web API Key?
echo.
echo On this page, copy your Steam Web API Key (You must spend a minimum of 5 euros on Steam).
echo.
echo Where to place the Steam Web API Key?
echo.
echo 1. Open the server.cfg file.
echo 2. Find where it says 'set steam_webApiKey ""'.
echo 3. Replace ^"" with your Steam Web API key.^"

echo Press any button to continue...
pause >nul
goto TutoSec

:req-apps
cls
echo.
CALL :LOGO
echo.
echo   [90m^>  [97mHeidiSQL 1
echo   [90m^>  [97mXAMPP 2
echo   [90m^>  [97mExit 3
echo]

SET selection=
SET /P selection=

IF /I '%selection%' == '1' GOTO hsql-download
IF /I '%selection%' == '2' GOTO xampp-download
IF /I '%selection%' == '3' exit

:hsql-download
start https://www.heidisql.com/installers/HeidiSQL_12.7.0.6850_Setup.exe
cls
echo.
echo         [92m██[97m╗  [92m██[97m╗[92m██[92m██[92m███[97m╗[92m██[97m╗[92m██[92m██[92m██[97m╗ [92m██[97m╗    [92m██[92m██[92m███[97m╗ [92m██[92m██[92m██[97m╗ [92m██[97m╗     
echo         [92m██[97m║  [92m██[97m║[92m██[97m╔════╝[92m██[97m║[92m██[97m╔══[92m██[97m╗[92m██[97m║    [92m██[97m╔════╝[92m██[97m╔═══[92m██[97m╗[92m██[97m║     
echo         [92m██[92m██[92m███[97m║[92m██[92m███[97m╗  [92m██[97m║[92m██[97m║  [92m██[97m║[92m██[97m║    [92m██[92m██[92m███[97m╗[92m██[97m║   [92m██[97m║[92m██[97m║     
echo         [92m██[97m╔══[92m██[97m║[92m██[97m╔══╝  [92m██[97m║[92m██[97m║  [92m██[97m║[92m██[97m║    ╚════[92m██[97m║[92m██[97m║[92m▄▄ [92m██[97m║[92m██[97m║     
echo         [92m██[97m║  [92m██[97m║[92m██[92m██[92m███[97m╗[92m██[97m║[92m██[92m██[92m██[97m╔╝[92m██[97m║    [92m██[92m██[92m███[97m║╚[92m██[92m██[92m██[97m╔╝[92m██[92m██[92m███[97m╗
echo         ╚═╝  ╚═╝╚══════╝╚═╝╚═════╝ ╚═╝    ╚══════╝ ╚══[92m▀▀[97m═╝ ╚══════╝
echo.
echo Press any button to continue & pause >nul
goto req-apps
:xampp-download
cls
echo.
echo         [38;5;208m██[97m╗  [38;5;208m██[97m╗ [38;5;208m██[38;5;208m███[97m╗ [38;5;208m███[97m╗   [38;5;208m███[97m╗[38;5;208m██[38;5;208m██[38;5;208m██[97m╗ [38;5;208m██[38;5;208m██[38;5;208m██[97m╗ 
echo         ╚[38;5;208m██[97m╗[38;5;208m██[97m╔╝[38;5;208m██[97m╔[97m═[97m═[38;5;208m██[97m╗[38;5;208m██[38;5;208m██[97m╗ [38;5;208m██[38;5;208m██[97m║[38;5;208m██[97m╔[97m═[97m═[38;5;208m██[97m╗[38;5;208m██[97m╔[97m═[97m═[38;5;208m██[97m╗
echo          ╚[38;5;208m███[97m╔╝ [38;5;208m██[38;5;208m██[38;5;208m███[97m║[38;5;208m██[97m╔[38;5;208m██[38;5;208m██[97m╔[38;5;208m██[97m║[38;5;208m██[38;5;208m██[38;5;208m██[97m╔╝[38;5;208m██[38;5;208m██[38;5;208m██[97m╔╝
echo          [38;5;208m██[97m╔[38;5;208m██[97m╗ [38;5;208m██[97m╔[97m═[97m═[38;5;208m██[97m║[38;5;208m██[97m║╚[38;5;208m██[97m╔╝[38;5;208m██[97m║[38;5;208m██[97m╔[97m═[97m═[97m═╝ [38;5;208m██[97m╔[97m═[97m═[97m═╝ 
echo         [38;5;208m██[97m╔╝ [38;5;208m██[97m╗[38;5;208m██[97m║  [38;5;208m██[97m║[38;5;208m██[97m║ ╚[97m═╝ [38;5;208m██[97m║[38;5;208m██[97m║     [38;5;208m██[97m║     
echo         ╚[97m═╝  ╚[97m═╝╚[97m═╝  ╚[97m═╝╚[97m═╝     ╚[97m═╝╚[97m═╝     ╚[97m═╝     
echo.
start https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/8.0.30/xampp-windows-x64-8.0.30-0-VS16-installer.exe
echo Press any button to continue & pause >nul
goto req-apps

REM LOGOS

:LOGO 
echo.
echo                     [96m██[96m███[97m╗ [96m██[97m╗  [96m██[97m╗ [96m██[96m██[96m██[97m╗[96m██[96m██[96m███[97m╗[96m██[97m╗     
echo                    [96m██[97m╔══[96m██[97m╗╚[96m██[97m╗[96m██[97m╔╝[96m██[97m╔════╝[96m██[97m╔════╝[96m██[97m║     
echo                    [96m██[96m██[96m███[97m║ ╚[96m███[97m╔╝ [96m██[97m║     [96m██[96m███[97m╗  [96m██[97m║     
echo                    [96m██[97m╔══[96m██[97m║ [96m██[97m╔[96m██[97m╗ [96m██[97m║     [96m██[97m╔══╝  [96m██[97m║     
echo                    [96m██[97m║  [96m██[97m║[96m██[97m╔╝ [96m██[97m╗╚[96m██[96m██[96m██[97m╗[96m██[96m██[96m███[97m╗[96m██[96m██[96m███[97m╗
echo                    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝
