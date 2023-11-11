@echo off

REM get admin
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
CLS

REM fix file host
netsh advfirewall set allprofiles state off
takeown /f "%SystemRoot%\System32\drivers\etc\hosts" /a
icacls "%SystemRoot%\System32\drivers\etc\hosts" /grant administrators:F
attrib -h -r -s "%SystemRoot%\System32\drivers\etc\hosts"
cls

REM coded block website
set file_path=%temp%\temp\temp.bat
title Code By AKiet And TDung
setlocal enabledelayedexpansion
cls
set "file_host=%Systemdrive%\Windows\System32\drivers\etc\hosts"
setlocal enabledelayedexpansion	

REM Website need to block
set "web[1]=win79d.com"
set "web[2]=taixiu.asia"
set "web[3]=cacuocso.com"
set "web[4]=nhacai247.com"
set "web[5]=onenhacai.com"
set "web[6]=nhacaiuytinvip.net"
set "web[7]=thethaoso247.win"
set "web[8]=nhacai247.net"
set "web[9]=tinnhacai.com"
set "web[10]=bet88.vn"
set "web[11]=bet88.ph"
set "web[12]=bet88.net"
set "web[13]=bet88.vip"
set "web[14]=bet88.ink"
set "web[15]=bet88.group"
set "web[16]=fb88hi.com"
set "web[17]=fb88th.com"
set "web[18]=fb88v.com"
set "web[19]=fb88live.com"
set "web[20]=fb88.win"
set "web[21]=fb88vietnam.com"
set "web[22]=hit22.club"
set "web[23]=hitclub8.com"
set "web[24]=hit32.io"
set "web[25]=hitclub.li"
set "web[26]=hitclub247.com"
set "web[27]=hitclub.vc"
set "web[28]=hitclub.fans"
set "web[29]=hitclub.space"
set "web[30]=hit28.link"
set "web[31]=go88.direct"
set "web[32]=go88vn.ac"
set "web[33]=go88x.app"
set "web[34]=go88.app"
set "web[35]=go88.credit"
set "web[36]=go88j.top"
set "web[37]=tai.go88j.top"
set "web[38]=google222.com"
set "web[39]=win79a.pro"
set "web[40]=win79.vn"
set "web[41]=win79vn.com"
set "web[42]=win79.la"
set "web[43]=linkwin79.com"
set "web[44]=win79club.win"
set "web[45]=pornhub.run"
set "web[46]=play-b52.club"
set "web[47]=gamebaislot.online"
set "web[48]=doithuong.click"
set "web[49]=78win.group"
set "web[50]=hi888.today"
set "web[51]=gamedoithuonghot.com"
set "web[52]=naplau.com"
set "web[53]=win66.com"
set "web[54]=m.win66.com"
set "web[55]=napgamelau.com"
set "web[56]=k8.plus"
set "web[57]=quayhudanhbai.top"
set "web[58]=soicaumobi247.com"
set "web[59]=nhacaiuytin.in"
set "web[60]=sb888.live"
set "web[61]=sb888.wiki"
set "web[62]=winbet9.live"
set "web[63]=www.fb88hi.com"
for /L %%i in (1,1,63) do (
  set "web_name=!web[%%i]!"
  findstr /C:"!web_name!" "%file_host%" >nul && (
    echo Website !web_name! Already Blocked.
  ) || (
    echo 0.0.0.0  !web_name!>> %file_host%
    echo Blocking Website !web_name!
  )
)
echo Coded Blocking Pack
pause
cls

:blocklist
cls
echo Press 1 To Go To Block Pack.
echo Press 0 To Skip.
set /p "choic1=Enter Your Choice: "
if "%choic1%"=="1" goto :pack
if "%choic1%"=="0" goto :custom
echo Invaild Choice.
echo Wait 2 Seconds to Do It Again.
timeout /t 2 >nul
goto :blocklist

:pack
cls
echo Press 1 For Block All Website Which Support Search.(bing,google,duckduckgo,yahoo).
echo Press 2 Block All Website Which Support Study.(vietjack, hoctot, loigiaihay,...).
echo Press 0 To Skip.
set /p "choic2=Enter Your Choice: "
if "%choic2%"=="1" goto :pack1
if "%choic2%"=="2" goto :pack2
if "%choic2%"=="0" goto :custom
echo Invaild Choice.
echo Wait 2 Seconds to Do It Again.
timeout /t 2 >nul
goto :pack

:pack1
cls
set "web[1]=vietjack.com"
set "web[2]=khoahoc.vietjack.com"
set "web[3]=vietjack.me"
set "web[4]=vietjack.net.vn"
set "web[5]=hoctot.nam.name.vn"
set "web[6]=hoctot.com"
set "web[7]=hoctot.net.vn"
set "web[8]=hoctot.hocmai.vn"
set "web[9]=dayhoctot.com"
set "web[10]=dehoctot.edu.vn"
set "web[11]=loigiaihay.com"
set "web[12]=m.loigiaihay.com"
set "web[13]=loigiaihay.edu.vn"
set "web[14]=cp.loigiaihay.com"
set "web[15]=hoidap247.com"
set "web[16]=lazi.vn"
set "web[17]=vndoc.com"
set "web[18]=www.mathway.com"
set "web[19]=mathway.com"
set "web[20]=fqa.vn"
set "web[21]=giaibaitap123.com"
set "web[22]=giaibai.com"
for /L %%i in (1,1,22) do (
  set "web_name=!web[%%i]!"
  findstr /C:"!web_name!" "%file_host%" >nul && (
    echo Website !web_name! Already Blocked.
  ) || (
    echo 0.0.0.0  !web_name!>> %file_host%
    echo Blocking Website !web_name!
  )
)
echo Block All Website Which Support Study.
echo Press Any Button To Go Back.
pause
goto :pack

:pack2
cls
set "web[1]=www.bing.com"
set "web[2]=bing.com"
set "web[3]=google.com"
set "web[4]=www.google.com"
set "web[5]=duckduckgo.com"
set "web[6]=duckduckgo-com.com"
set "web[7]=www.wikipedia.org"
set "web[8]=vi.wikipedia.org"
set "web[9]=wikipedia.org"
set "web[10]=search.yahoo.com"
set "web[11]=yahoo.com"
set "web[12]=vn.search.yahoo.com"
set "web[13]=www.yahoo.com"
set "web[14]=uk.search.yahoo.com"
set "web[15]=search.yahoo.com"
set "web[16]=in.search.yahoo.com"
set "web[17]=www.taobao.com"
set "web[18]=taobao.com"
set "web[19]=www.baidu.com"
set "web[20]=baidu.com"
set "web[21]=coccoc.com"
set "web[22]=m.coccoc.com"
for /L %%i in (1,1,22) do (
  set "web_name=!web[%%i]!"
  findstr /C:"!web_name!" "%file_host%" >nul && (
    echo Website !web_name! Already Blocked.
  ) || (
    echo 0.0.0.0  !web_name!>> %file_host%
    echo Blocking Website !web_name!
  )
)
echo Block All Website Which Support Search.
echo Press Any Button To Go Back.
pause
goto :pack

:custom
cls
echo DO NOT BLOCK takisnoob.ddns.net.
:loop
setlocal enabledelayedexpansion
set /p "input_string=Enter Website You Want To Block (Press 0 To Exit): "
if "%input_string%"=="0" (
    goto :end1
) else (
    set "input_string=!input_string: =!"
    if "!input_string!"=="%input_string%" (
        if /I "!input_string:~0,4!"=="http" (
            echo Enter Without 'https' Or 'http'.
            goto :loop
        ) else (
            echo Validating Website
            ping -n 1 !input_string! >nul
            if errorlevel 1 (
                echo Website !input_string! Isn't Valid
                goto :loop
            ) else (
                findstr /I /C:"!input_string!" "%file_host%" >nul
                if not errorlevel 1 (
                    echo Website !input_string! Already Blocked.
                    goto :loop
                ) else (
                    echo 0.0.0.0 !input_string!>> %file_host%
                    echo Blocking Website !input_string!.
                    goto :loop
                )
            )
        )
    ) else (
        echo Can Not Have Space.
        goto :loop
    )
)

:end1
cls
echo This Step Make Sure Your Computer Apply All Change.
echo Press 1 To Apply All Change (Will Close All Browsers.).
echo Press 0 To Skip (Need Restart Later).
echo Enter Your Choice
choice /C:10 /N
set cache=%errorlevel%
if "%cache%"=="1" (
	echo Refreshing Cache...
	ipconfig /flushdns >nul
	echo Closing Browser...
	RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351 >nul 
	taskkill /f /im msedge.exe >nul
	taskkill /f /im firefox.exe >nul
	taskkill /f /im chrome.exe >nul
	taskkill /f /im iexplore.exe >nul
	taskkill /f /im msedge.exe >nul
	taskkill /f /im firefox.exe >nul
	taskkill /f /im chrome.exe >nul
	taskkill /f /im iexplore.exe >nul
	echo Done. Reopening Browser.
  :reopen
  echo Press 1 To open Microsoft Edge.
  echo Press 2 To Open Chrome.
  echo Press 3 To Open Fire Fox.
  echo Press 0 To Exit.
  set /p "reopen=Enter Your Choice: "
  if "%reopen%"=="1" goto :ms
  if "%reopen%"=="2" goto :gg
  if "%reopen%"=="3" goto :ff
  if "%reopen%"=="0" goto :done
  echo Invaild Choice.
  echo Do It Again.
  pause
  cls
  goto :reopen
  :gg
	start chrome --restore-last-session >nul
  goto :done
  :ms
	start msedge --restore-last-session >nul
  goto :done
  :ff
	start firefox -sessionstore-restore-last-session >nul
  goto :done
  :done
	cls
	echo Done.
	echo Press Any Button To Continue.
	pause
	goto :end
)
if "%cache%"=="0" goto :end
echo Invaild Choice. Do It Again.
pause
goto :end1

REM ending
:end
cls
echo When Press 1, Computer Will Restart So You Should Make Sure That You Are Already Close All App.
echo When Press 0, Computer Will Continue Working.
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
exit /b

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
netsh advfirewall set allprofiles state on
attrib +h +r +s "%SystemRoot%\system32\drivers\etc\hosts"
shutdown /r /t 0
del %file_path%
rmdir "%temp%\temp" 2>nul
