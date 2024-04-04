@echo off
setlocal
title Windows To Go Creation Tool
echo Windows To Go Creation Tool v1.0.0
echo.
echo Please run this batch file as an administrator.
goto Start

:Start
echo.
set Windows=
set /p Windows="Do you want Windows 10 22H2 or Windows 11 23H2? (10/11) "
if /i "%Windows%"=="10" goto 10
if /i "%Windows%"=="11" goto 11
echo Invalid Syntax!
goto Start

:10
echo.
echo Download Windows 10 22H2 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows10
echo Press any key to open the Website.
pause >nul
start https://www.microsoft.com/en-us/software-download/windows10a
goto Mount

:11
echo.
echo Download Windows 11 23H2 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows11
echo Press any key to open the Website.
pause >nul
start https://www.microsoft.com/software-download/windows11
goto Mount

:Mount
echo.
echo Please mount your Windows Disk Image then press any key to continue.
pause >nul
goto DriveLetter

:DriveLetter
echo.
set DriveLetter=
set /p DriveLetter="What is the drive letter of your mounted Windows Disk Image? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto SureDriveLetter
if /i "%DriveLetter%"=="B:" goto SureDriveLetter
if /i "%DriveLetter%"=="C:" goto SureDriveLetter
if /i "%DriveLetter%"=="D:" goto SureDriveLetter
if /i "%DriveLetter%"=="E:" goto SureDriveLetter
if /i "%DriveLetter%"=="F:" goto SureDriveLetter
if /i "%DriveLetter%"=="G:" goto SureDriveLetter
if /i "%DriveLetter%"=="H:" goto SureDriveLetter
if /i "%DriveLetter%"=="I:" goto SureDriveLetter
if /i "%DriveLetter%"=="J:" goto SureDriveLetter
if /i "%DriveLetter%"=="K:" goto SureDriveLetter
if /i "%DriveLetter%"=="L:" goto SureDriveLetter
if /i "%DriveLetter%"=="M:" goto SureDriveLetter
if /i "%DriveLetter%"=="N:" goto SureDriveLetter
if /i "%DriveLetter%"=="O:" goto SureDriveLetter
if /i "%DriveLetter%"=="P:" goto SureDriveLetter
if /i "%DriveLetter%"=="Q:" goto SureDriveLetter
if /i "%DriveLetter%"=="R:" goto SureDriveLetter
if /i "%DriveLetter%"=="S:" goto SureDriveLetter
if /i "%DriveLetter%"=="T:" goto SureDriveLetter
if /i "%DriveLetter%"=="U:" goto SureDriveLetter
if /i "%DriveLetter%"=="V:" goto SureDriveLetter
if /i "%DriveLetter%"=="W:" goto SureDriveLetter
if /i "%DriveLetter%"=="X:" goto SureDriveLetter
if /i "%DriveLetter%"=="Y:" goto SureDriveLetter
if /i "%DriveLetter%"=="Z:" goto SureDriveLetter
echo Invalid Syntax!
goto DriveLetter

:SureDriveLetter
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure %DriveLetter% is the drive letter of your Windows Disk Image? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto CheckExist
if /i "%SureDriveLetter%"=="No" goto DriveLetter
echo Invalid Syntax!
goto SureDriveLetter

:CheckExist
if not exist "%DriveLetter%" goto NotExist
goto BitDetection

:NotExist
echo %DriveLetter% does not exist. Please try again.
goto DriveLetter

:BitDetection
if exist %DriveLetter%\sources goto ESDSWMWIM1
goto Bit1

:Bit1
echo.
set Bit=
set /p Bit="Do you want 32-bit or 64-bit version of Windows? (32/64) "
if /i "%Bit%"=="32" goto SureBit
if /i "%Bit%"=="64" goto SureBit
echo Invalid Syntax!
goto Bit1

:SureBit
echo.
set SureBit=
set /p SureBit="Are you sure you want a %Bit%-bit version of Windows? "
if /i "%SureBit%"=="Yes" goto Bit2
if /i "%SureBit%"=="No" goto Bit1
echo Invalid Syntax!
goto SureBit

:Bit2
if /i "%Bit%"=="32" goto 32ESDSWMWIM1
if /i "%Bit%"=="64" goto 64ESDSWMWIM1

:ESDSWMWIM1
if exist "%DriveLetter%\sources\install.esd" goto DISMESD1
if exist "%DriveLetter%\sources\install.swm" goto DISMSWM1
if exist "%DriveLetter%\sources\install.wim" goto DISMWIM1
echo Invalid Drive Letter!
goto DriveLetter

:32ESDSWMWIM1
if exist "%DriveLetter%\x86\sources\install.esd" goto 32DISMESD1
if exist "%DriveLetter%\x86\sources\install.swm" goto 32DISMSWM1
if exist "%DriveLetter%\x86\sources\install.wim" goto 32DISMWIM1
echo Invalid Drive Letter!
goto DriveLetter

:64ESDSWMWIM1
if exist "%DriveLetter%\x64\sources\install.esd" goto 64DISMESD1
if exist "%DriveLetter%\x64\sources\install.swm" goto 64DISMSWM1
if exist "%DriveLetter%\x64\sources\install.wim" goto 64DISMWIM1
echo Invalid Drive Letter!
goto DriveLetter

:DISMESD1
set install=install.esd
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.esd"
if errorlevel 1 goto DriveLetter
goto Index

:DISMSWM1
set install=install.swm
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.swm"
if errorlevel 1 goto DriveLetter
goto Index

:DISMWIM1
set install=install.wim
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.wim"
if errorlevel 1 goto DriveLetter
goto Index

:32DISMESD1
set install=install.esd
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\install.esd"
if errorlevel 1 goto DriveLetter
goto Index

:32DISMSWM1
set install=install.swm
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\install.swm"
if errorlevel 1 goto DriveLetter
goto Index

:32DISMWIM1
set install=install.wim
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\install.wim"
if errorlevel 1 goto DriveLetter
goto Index

:64DISMESD1
set install=install.esd
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\install.esd"
if errorlevel 1 goto DriveLetter
goto Index

:64DISMSWM1
set install=install.swm
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\install.swm"
if errorlevel 1 goto DriveLetter
goto Index

:64DISMWIM1
set install=install.wim
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\install.wim"
if errorlevel 1 goto DriveLetter
goto Index

:Index
echo.
set Index=
set /p Index="Which index do you want? (1-7/11) "
if /i "%Index%"=="1" goto SureIndex
if /i "%Index%"=="2" goto SureIndex
if /i "%Index%"=="3" goto SureIndex
if /i "%Index%"=="4" goto SureIndex
if /i "%Index%"=="5" goto SureIndex
if /i "%Index%"=="6" goto SureIndex
if /i "%Index%"=="7" goto SureIndex
if /i "%Index%"=="8" goto SureIndex
if /i "%Index%"=="9" goto SureIndex
if /i "%Index%"=="10" goto SureIndex
if /i "%Index%"=="11" goto SureIndex
echo Invalid Syntax!
goto Index


:SureIndex
echo.
set IndexNumber=
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto Create
if /i "%IndexNumber%"=="No" goto Index
goto SureIndex

:Create
echo.
echo Please follow these steps in order.
echo.
echo Step 1. Please Use an external SSD or a WTG certified drive. You can use a regular USB drive but it will be very slow.
echo Step 2. Remove all partions on the disk you want to install Windows on.
echo Step 3. Convert the disk you want to install Windows on to MBR.
echo Step 4. Create on disk you want to install Windows on one FAT32 partition that is 350 MB, name it SYSTEM and assign it an unused drive letter.
echo Step 5. Create on disk you want to install Windows on one NTFS partition that is greater than or is equal to 64 GB, name it Windows and assign it an unused drive letter.
echo Step 6. Make the FAT32 partition on the drive Windows is installed on active.
echo Step 7. Press any key to continue.
pause
goto NTFS

:NTFS
echo.
set NTFS=
set /p NTFS="What is your drive letter of the NTFS partition you want to install windows on? (A:-Z:) "
if /i "%NTFS%" EQU "%DriveLetter%" goto SameDriveLetterNTFS
if /i "%NTFS%"=="A:" goto SureNTFS
if /i "%NTFS%"=="B:" goto SureNTFS
if /i "%NTFS%"=="C:" goto SureNTFS
if /i "%NTFS%"=="D:" goto SureNTFS
if /i "%NTFS%"=="E:" goto SureNTFS
if /i "%NTFS%"=="F:" goto SureNTFS
if /i "%NTFS%"=="G:" goto SureNTFS
if /i "%NTFS%"=="H:" goto SureNTFS
if /i "%NTFS%"=="I:" goto SureNTFS
if /i "%NTFS%"=="J:" goto SureNTFS
if /i "%NTFS%"=="K:" goto SureNTFS
if /i "%NTFS%"=="L:" goto SureNTFS
if /i "%NTFS%"=="M:" goto SureNTFS
if /i "%NTFS%"=="N:" goto SureNTFS
if /i "%NTFS%"=="O:" goto SureNTFS
if /i "%NTFS%"=="P:" goto SureNTFS
if /i "%NTFS%"=="Q:" goto SureNTFS
if /i "%NTFS%"=="R:" goto SureNTFS
if /i "%NTFS%"=="S:" goto SureNTFS
if /i "%NTFS%"=="T:" goto SureNTFS
if /i "%NTFS%"=="U:" goto SureNTFS
if /i "%NTFS%"=="V:" goto SureNTFS
if /i "%NTFS%"=="W:" goto SureNTFS
if /i "%NTFS%"=="X:" goto SureNTFS
if /i "%NTFS%"=="Y:" goto SureNTFS
if /i "%NTFS%"=="Z:" goto SureNTFS
echo Invalid Syntax!
goto CheckExistNTFS

:SureNTFS
echo.
set SureNTFS=
set /p SureNTFS="Are you sure %NTFS% is the drive letter you want to install Windows on? (Yes/No) "
if /i "%SureNTFS%"=="Yes" goto CheckExistNTFS
if /i "%SureNTFS%"=="No" goto NTFS
echo Invalid Syntax!
goto SureNTFS

:SameDriveLetterNTFS
pause
echo NTFS partition drive letter same as mounted Windows Disk Image drive letter. Please try again.
goto NTFS

:CheckExistNTFS
if not exist "%NTFS%" goto NotExistNTFS
goto FAt32

:NotExistNTFS
echo %NTFS% does not exist. Please try again.
goto NTFS

:FAT32
echo.
set FAT32=
set /p FAT32="What is your drive letter of the FAT32 partition on the drive you want to install windows on? (A:-Z:) "
if /i "%FAT32%" EQU "%DriveLetter%" goto SameDriveLetterFAT32
if /i "%FAT32%" EQU "%NTFS%" goto SameDriveLetterFAT32NTFS
if /i "%FAT32%"=="A:" goto SureFAT32
if /i "%FAT32%"=="B:" goto SureFAT32
if /i "%FAT32%"=="C:" goto SureFAT32
if /i "%FAT32%"=="D:" goto SureFAT32
if /i "%FAT32%"=="E:" goto SureFAT32
if /i "%FAT32%"=="F:" goto SureFAT32
if /i "%FAT32%"=="G:" goto SureFAT32
if /i "%FAT32%"=="H:" goto SureFAT32
if /i "%FAT32%"=="I:" goto SureFAT32
if /i "%FAT32%"=="J:" goto SureFAT32
if /i "%FAT32%"=="K:" goto SureFAT32
if /i "%FAT32%"=="L:" goto SureFAT32
if /i "%FAT32%"=="M:" goto SureFAT32
if /i "%FAT32%"=="N:" goto SureFAT32
if /i "%FAT32%"=="O:" goto SureFAT32
if /i "%FAT32%"=="P:" goto SureFAT32
if /i "%FAT32%"=="Q:" goto SureFAT32
if /i "%FAT32%"=="R:" goto SureFAT32
if /i "%FAT32%"=="S:" goto SureFAT32
if /i "%FAT32%"=="T:" goto SureFAT32
if /i "%FAT32%"=="U:" goto SureFAT32
if /i "%FAT32%"=="V:" goto SureFAT32
if /i "%FAT32%"=="W:" goto SureFAT32
if /i "%FAT32%"=="X:" goto SureFAT32
if /i "%FAT32%"=="Y:" goto SureFAT32
if /i "%FAT32%"=="Z:" goto SureFAT32
echo Invalid Syntax!
goto CheckExistFAT32

:SureFAT32
echo.
set SureFAT32=
set /p SureFAT32="Are you sure %FAT32% is the drive letter you wan to install Windows on? (Yes/No) "
if /i "%SureFAT32%"=="Yes" goto CheckExistFat32
if /i "%SureFAT32%"=="No" goto FAT32
echo Invalid Syntax!
goto SureFAT32

:SameDriveLetterFAT32
echo FAT32 partition drive letter same as mounted Windows Disk Image drive letter. Please try again.
goto NTFS

:SameDriveLetterFAT32NTFS
echo FAT32 partition drive letter same as mounted NTFS partition drive letter. Please try again.
goto NTFS

:CheckExistFat32
if not exist "%FAT32%" goto NotExistFAT32
goto Bit3

:NotExistFAT32
echo %FAT32% does not exist. Please try again.
goto DriveLetter

:Bit3
if /i "%Bit%"=="32" goto 32ESDSWMWIM2
if /i "%Bit%"=="64" goto 64ESDSWMWIM2
goto ESDSWMWIM2

:ESDSWMWIM2
if /i "%install%"=="install.esd" goto DISMESD2
if /i "%install%"=="install.swm" goto DISMSWM2
if /i "%install%"=="install.wim" goto DISMWIM2

:32ESDSWMWIM2
if /i "%install%"=="install.esd" goto 32DISMESD2
if /i "%install%"=="install.swm" goto 32DISMSWM2
if /i "%install%"=="install.wim" goto 32DISMWIM2

:64ESDSWMWIM2
if /i "%install%"=="install.esd" goto 64DISMESD2
if /i "%install%"=="install.swm" goto 64DISMSWM2
if /i "%install%"=="install.wim" goto 64DISMWIM2

:DISMESD2
DISM /Apply-Image /ImageFile:"%DriveLetter%\sources\install.esd" /Index:%Index% /ApplyDir:%NTFS%
if errorlevel 1 goto Index
goto Done

:DISMSWM2
DISM /Apply-Image /ImageFile:"%DriveLetter%\sources\install.swm" /Index:%Index% /ApplyDir:%NTFS%
if errorlevel 1 goto Index
goto Done

:DISMWIM2
DISM/Apply-Image /ImageFile:"%DriveLetter%\sources\install.wim" /Index:%Index% /ApplyDir:%NTFS%
if errorlevel 1 goto Index
goto Done

:32DISMESD2
DISM /Apply-Image /ImageFile:"%DriveLetter%\x86\sources\install.esd" /Index:%Index% /ApplyDir:%NTFS%
if errorlevel 1 goto Index
goto Done

:32DISMSWM2
DISM /Apply-Image /ImageFile:"%DriveLetter%\x86\sources\install.swm" /Index:%Index% /ApplyDir:%NTFS%
if errorlevel 1 goto Index
goto Done

:32DISMWIM2
DISM/Apply-Image /ImageFile:"%DriveLetter%\x86\sources\install.wim" /Index:%Index% /ApplyDir:%NTFS%
if errorlevel 1 goto Index
goto Done

:64DISMESD2
DISM /Apply-Image /ImageFile:"%DriveLetter%\x64\sources\install.esd" /Index:%Index% /ApplyDir:%NTFS%
if errorlevel 1 goto Index
goto Done

:64DISMSWM2
DISM /Apply-Image /ImageFile:"%DriveLetter%\x64\sources\install.swm" /Index:%Index% /ApplyDir:%NTFS%
if errorlevel 1 goto Index
goto Done

:64DISMWIM2
DISM/Apply-Image /ImageFile:"%DriveLetter%\x64\sources\install.wim" /Index:%Index% /ApplyDir:%NTFS%
if errorlevel 1 goto Index
goto Done

:Done
BCDBoot %NTFS%\Windows /s %FAT32% /f ALL
endlocal
echo.
echo Your Windows To Go is ready. It is Bootable with Legacy BIOS and UEFI. Press any key to close this batch file.
pause >nul
exit
