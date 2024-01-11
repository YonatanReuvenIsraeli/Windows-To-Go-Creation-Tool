@echo off
title Windows To Go Creation Tool1
echo Please run this batch file as an administrator.
echo.
echo Please download the Windows Disk Image then press any key to continue.
echo Download Windows 10 22H2 disk Image from here. ^-^-^> https://www.microsoft.com/en-us/software-download/windows10a
echo Download Windows 11 23H2 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows11
pause
echo.
echo Please mount your Windows Disk Image then press any key to continue.
pause
echo. 
echo Go to X:\sources, where X: is the drive letter of you monted disk image and look for install.esd or install.wim and then press any key to continue.
pause

:Start
echo.
set /p install="Do you have install.esd or install.wim? (install.esd/install.wim) "
if /i "%install%"=="install.esd" goto :DriveLetter
if /i "%install%"=="install.wim" goto :DriveLetter
echo Invalid Syntax!
goto :Start

:DriveLetter
echo.
set /p DriveLetter="What is your drive letter of you mounted Windows Disk Image? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto :ESDWIM1
if /i "%DriveLetter%"=="B:" goto :ESDWIM1
if /i "%DriveLetter%"=="C:" goto :ESDWIM1
if /i "%DriveLetter%"=="D:" goto :ESDWIM1
if /i "%DriveLetter%"=="E:" goto :ESDWIM1
if /i "%DriveLetter%"=="F:" goto :ESDWIM1
if /i "%DriveLetter%"=="G:" goto :ESDWIM1
if /i "%DriveLetter%"=="H:" goto :ESDWIM1
if /i "%DriveLetter%"=="I:" goto :ESDWIM1
if /i "%DriveLetter%"=="J:" goto :ESDWIM1
if /i "%DriveLetter%"=="K:" goto :ESDWIM1
if /i "%DriveLetter%"=="L:" goto :ESDWIM1
if /i "%DriveLetter%"=="M:" goto :ESDWIM1
if /i "%DriveLetter%"=="N:" goto :ESDWIM1
if /i "%DriveLetter%"=="O:" goto :ESDWIM1
if /i "%DriveLetter%"=="P:" goto :ESDWIM1
if /i "%DriveLetter%"=="Q:" goto :ESDWIM1
if /i "%DriveLetter%"=="R:" goto :ESDWIM1
if /i "%DriveLetter%"=="S:" goto :ESDWIM1
if /i "%DriveLetter%"=="T:" goto :ESDWIM1
if /i "%DriveLetter%"=="U:" goto :ESDWIM1
if /i "%DriveLetter%"=="V:" goto :ESDWIM1
if /i "%DriveLetter%"=="W:" goto :ESDWIM1
if /i "%DriveLetter%"=="X:" goto :ESDWIM1
if /i "%DriveLetter%"=="Y:" goto :ESDWIM1
if /i "%DriveLetter%"=="Z:" goto :ESDWIM1
echo Invalid Syntax!
goto :DriveLetter

:ESDWIM1
if /i "%install%"=="install.esd" goto :DISMESD1
if /i "%install%"=="install.wim" goto :DISMWIM1

:DISMESD1
dism /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.esd" || goto :Start
goto :Index

:DISMWIM1
dism /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.wim" || goto :Start
goto :Index

:Index
echo.
set /p Index="Which index do you want? (1-7/11) "
if /i "%Index%"=="1" goto :SureIndex
if /i "%Index%"=="2" goto :SureIndex
if /i "%Index%"=="3" goto :SureIndex
if /i "%Index%"=="4" goto :SureIndex
if /i "%Index%"=="5" goto :SureIndex
if /i "%Index%"=="6" goto :SureIndex
if /i "%Index%"=="7" goto :SureIndex
if /i "%Index%"=="8" goto :SureIndex
if /i "%Index%"=="9" goto :SureIndex
if /i "%Index%"=="10" goto :SureIndex
if /i "%Index%"=="11" goto :SureIndex
echo Invalid Syntax!
goto :Index


:SureIndex
echo.
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto :Create
if /i "%IndexNumber%"=="No" goto :Index
echo Invalid Syntax!
goto :SureIndex

:Create
echo.
echo Step 1. Please Use an external SSD or a WTG certified drive. You can use a regular USB drive but it will be very slow.
echo Step 2. Remove all partions on the disk you want to install Windows on.
echo Step 3. Convert the disk you want to install Windows on to MBR.
echo Step 4. Create on disk you want to install Windows on one FAT32 partition that is 350MB, name it System-Reserved and assign it an unused drive letter.
echo Step 5. Create on disk you want to install Windows on one NTFS partition that is >64GB, name it Windows and assign it an unused drive letter.
echo Step 6. Make the FAT32 partition on the drive Windows is installed on active.
echo Step 7. Press any key to continue.
pause
goto :WindowsDriveLetter

:WindowsDriveLetter
echo.
set /p WindowsDriveLetter="What is your drive letter of the NTFS partition you want to install windows on? (A:-Z:) "
if /i "%WindowsDriveLetter%"=="A:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="B:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="C:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="D:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="E:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="F:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="G:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="H:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="I:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="J:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="K:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="L:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="M:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="N:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="O:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="P:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="Q:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="R:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="S:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="T:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="U:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="V:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="W:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="X:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="Y:" goto :SureNTFS
if /i "%WindowsDriveLetter%"=="Z:" goto :SureNTFS
echo Invalid Syntax!
goto :WindowsDriveLetter

:SureNTFS
echo.
set /p SureNumber="Are you sure %WindowsDriveLetter% is the drive letter you want to install Windows on? (Yes/No) "
if /i "%SureNumber%"=="Yes" goto :BCD
if /i "%SureNumber%"=="No" goto :WindowsDriveLetter
echo Invalid Syntax!
goto :SureNTFS

:BCD
echo.
set /p FAT32="What is your drive letter of the FAT32 partition on the drive you want to install windows on? (A:-Z:) "
if /i "%FAT32%"=="A:" goto :SureFAT32
if /i "%FAT32%"=="B:" goto :SureFAT32
if /i "%FAT32%"=="C:" goto :SureFAT32
if /i "%FAT32%"=="D:" goto :SureFAT32
if /i "%FAT32%"=="E:" goto :SureFAT32
if /i "%FAT32%"=="F:" goto :SureFAT32
if /i "%FAT32%"=="G:" goto :SureFAT32
if /i "%FAT32%"=="H:" goto :SureFAT32
if /i "%FAT32%"=="I:" goto :SureFAT32
if /i "%FAT32%"=="J:" goto :SureFAT32
if /i "%FAT32%"=="K:" goto :SureFAT32
if /i "%FAT32%"=="L:" goto :SureFAT32
if /i "%FAT32%"=="M:" goto :SureFAT32
if /i "%FAT32%"=="N:" goto :SureFAT32
if /i "%FAT32%"=="O:" goto :SureFAT32
if /i "%FAT32%"=="P:" goto :SureFAT32
if /i "%FAT32%"=="Q:" goto :SureFAT32
if /i "%FAT32%"=="R:" goto :SureFAT32
if /i "%FAT32%"=="S:" goto :SureFAT32
if /i "%FAT32%"=="T:" goto :SureFAT32
if /i "%FAT32%"=="U:" goto :SureFAT32
if /i "%FAT32%"=="V:" goto :SureFAT32
if /i "%FAT32%"=="W:" goto :SureFAT32
if /i "%FAT32%"=="X:" goto :SureFAT32
if /i "%FAT32%"=="Y:" goto :SureFAT32
if /i "%FAT32%"=="Z:" goto :SureFAT32
echo Invalid Syntax!
goto :BCD

:SureFAT32
echo.
set /p SureNumber="Are you sure %FAT32% is the drive letter you wan to install Windows on? (Yes/No) "
if /i "%SureNumber%"=="Yes" goto :ESDWIM2
if /i "%SureNumber%"=="No" goto :BCD
echo Invalid Syntax!
goto :SureBCD

:ESDWIM2
if /i "%install%"=="install.esd" goto :DISMESD2
if /i "%install%"=="install.wim" goto :DISMWIM2

:DISMESD2
dism /Apply-Image /ImageFile:"%DriveLetter%\sources\install.esd" /Index:%Index% /ApplyDir:%WindowsDriveLetter% || goto :IndexESD
goto :Done

:DISMWIM2
dism /Apply-Image /ImageFile:"%DriveLetter%\sources\install.wim" /Index:%Index% /ApplyDir:%WindowsDriveLetter% || goto :IndexWIM
goto :Done

:Done
bcdboot %WindowsDriveLetter%\Windows /s %FAT32% /f ALL
echo.
echo Your Windows To Go is ready. It is Bootable with Legacy BIOS and UEFI. Press any key to exit Windows to Go Creation Tool.
endlocal
pause
