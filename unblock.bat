@echo off

set "file_host=%Systemdrive%\Windows\System32\drivers\etc\hosts"
set "file_host_tmp=%file_host%.tmp"
set "file_path=%temp%\temp\temp.bat"
set "err=0"

:admin
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
	echo: Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo: UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs" &	exit 
)
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"

>nul 2>&1 reg add hkcu\software\classes\.Admin\shell\runas\command /f /ve /d "cmd /x /d /r set \"f0=%%2\"& call \"%%2\" %%3"& set _= %*
>nul 2>&1 fltmc|| if "%f0%" neq "%~f0" (cd.>"%temp%\runas.Admin" & start "%~n0" /high "%temp%\runas.Admin" "%~f0" "%_:"=""%" & exit /b)
>nul 2>&1 reg delete hkcu\software\classes\.Admin\ /f
>nul 2>&1 del %temp%\runas.Admin /f /q 
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"

set _Args=%*
if "%~1" NEQ "" (
  set _Args=%_Args:"=%
)
fltmc 1>nul 2>nul || (
  cd /d "%~dp0"
  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~dp0"" && ""%~dpnx0"" ""%_Args%""", "", "runas", 1 > "%temp%\GetAdmin.vbs"
  "%temp%\GetAdmin.vbs"
  del /f /q "%temp%\GetAdmin.vbs" 1>nul 2>nul
  exit
)
REM fix file host
netsh advfirewall set allprofiles state off
takeown /f "%SystemRoot%\System32\drivers\etc\hosts" /a
icacls "%SystemRoot%\System32\drivers\etc\hosts" /grant administrators:F
attrib -h -r -s "%SystemRoot%\System32\drivers\etc\hosts"
cls

title Code By AKiet And TDung
:continue
setlocal enabledelayedexpansion
:loop
set "nonemptyline=0"
cls
for /f "delims=" %%a in ('type "%file_host%"') do (
    set "line=%%a"
    set "line=!line:127.0.0.1=!"
    set "line=!line:0.0.0.0=!"
    set "line=!line: =!"
    if "!line!" NEQ "" (
        echo !line!
        set "nonemptyline=1"
    )
)
if "%nonemptyline%"=="0" (
    echo ====================No Website Has Been Block====================
pause
goto :end
)
if "!err!"=="1" (
    echo ====================Website Doesn't Blocked====================
    set "err=0"
)
if "!err!"=="2" (
    echo ==========Unblock Website Which Contain The Letter %input_string%==========
    set "err=0"
)
if "!err!"=="3" (
    echo ====================Can Not Have Space====================
    set "err=0"
)
if "!err!"=="4" (
    echo ====================Enter Without 'http' Or 'https'====================
    set "err=0"
)
set /p "input_string=Enter Website You Want To Unblock From List Above(Press 0 To Exit): "
if "%input_string%"=="0" (
    goto :end
) else (
    if not "%input_string%"=="" (
        set "input_string=%input_string: =%"
        if "!input_string:~0,4!"=="http" (
            set "err=4"
            goto :loop
        )
        if "!input_string!"=="%input_string%" (
            findstr /C:"%input_string%" "%file_host%" >nul && (
                findstr /v /C:"%input_string%" "%file_host%" > "%file_host_tmp%"
                move /y "%file_host_tmp%" "%file_host%" >nul
                set "err=2"
            ) || (
                set "err=1"
            )
        ) else (
            set "err=3"
            goto :loop
        )
    )
    goto :loop
)

:end
echo. %file_host%
for /f "delims=" %%a in (%file_hosts_tmp%) do (
    echo 0.0.0.0 %%a >> "%file_host%"
)
cls
echo When Press 1, Computer Will Restart So You Should Make Sure That You Are Already Close All App.
echo When Press 0, Computer Will Continue Working And No Need To Restart.
echo File Downloads(bat) From: https://takisnoob.ddns.net/khkt/run.bat (Recommend)
echo                      alt: https://takisnoob.work.gd/khkt/run.bat (Alternative)
echo More Info: https://takisnoob.ddns.net/khkt
echo       alt: https://takisnoob.work.gd/khkt
echo Best Regards.
choice /C:10 /N
set choicend=%errorlevel%
if "%choicend%"=="1" goto :restart
if "%choicend%"=="0" goto :norestart

:norestart
cls
echo Good Bye.
echo See You Again.
color 6
pause
attrib +h +r +s "%SystemRoot%\system32\drivers\etc\hosts"
netsh advfirewall set allprofiles state on
del %file_path%
rmdir "%temp%\temp" 2>nul
exit

:restart
echo Good Bye.
echo See You Again.
color 6
pause
cls
color 3
echo         Coded 
echo                                     by
echo                                                             Tak
echo                                                                                        With
echo                                                                                                                 Love
pause
attrib +h +r +s "%SystemRoot%\system32\drivers\etc\hosts"
netsh advfirewall set allprofiles state on
shutdown /r /t 0
del %file_path%
rmdir "%temp%\temp" 2>nul
