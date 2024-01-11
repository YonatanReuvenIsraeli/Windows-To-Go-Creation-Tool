@echo off
title Windows to Go Creation Tool
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
if /i "%install%"=="install.esd" goto :ESD
if /i "%install%"=="install.wim" goto :WIM
echo Invalid Syntax!
goto :Start

:ESD
echo.
set /p DriveLetter="What is your drive letter of you mounted Windows Disk Image? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto :DISMESD1
if /i "%DriveLetter%"=="B:" goto :DISMESD1
if /i "%DriveLetter%"=="C:" goto :DISMESD1
if /i "%DriveLetter%"=="D:" goto :DISMESD1
if /i "%DriveLetter%"=="E:" goto :DISMESD1
if /i "%DriveLetter%"=="F:" goto :DISMESD1
if /i "%DriveLetter%"=="G:" goto :DISMESD1
if /i "%DriveLetter%"=="H:" goto :DISMESD1
if /i "%DriveLetter%"=="I:" goto :DISMESD1
if /i "%DriveLetter%"=="J:" goto :DISMESD1
if /i "%DriveLetter%"=="K:" goto :DISMESD1
if /i "%DriveLetter%"=="L:" goto :DISMESD1
if /i "%DriveLetter%"=="M:" goto :DISMESD1
if /i "%DriveLetter%"=="N:" goto :DISMESD1
if /i "%DriveLetter%"=="O:" goto :DISMESD1
if /i "%DriveLetter%"=="P:" goto :DISMESD1
if /i "%DriveLetter%"=="Q:" goto :DISMESD1
if /i "%DriveLetter%"=="R:" goto :DISMESD1
if /i "%DriveLetter%"=="S:" goto :DISMESD1
if /i "%DriveLetter%"=="T:" goto :DISMESD1
if /i "%DriveLetter%"=="U:" goto :DISMESD1
if /i "%DriveLetter%"=="V:" goto :DISMESD1
if /i "%DriveLetter%"=="W:" goto :DISMESD1
if /i "%DriveLetter%"=="X:" goto :DISMESD1
if /i "%DriveLetter%"=="Y:" goto :DISMESD1
if /i "%DriveLetter%"=="Z:" goto :DISMESD1
echo Invalid Syntax!
goto :ESD

:DISMESD1
dism /Get-WimInfo /WimFile:%DriveLetter%\sources\install.esd || goto :ESD
goto :IndexESD

:IndexESD
echo.
set /p Index="Which index do you want? (1-7) "
if /i "%Index%"=="1" goto :IndexNumberESD
if /i "%Index%"=="2" goto :IndexNumberESD
if /i "%Index%"=="3" goto :IndexNumberESD
if /i "%Index%"=="4" goto :IndexNumberESD
if /i "%Index%"=="5" goto :IndexNumberESD
if /i "%Index%"=="6" goto :IndexNumberESD
if /i "%Index%"=="7" goto :IndexNumberESD
echo Invalid Syntax!
goto :IndexESD


:IndexNumberESD
echo.
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto :CreateESD
if /i "%IndexNumber%"=="No" goto :IndexESD
echo Invalid Syntax!
goto :IndexNumberESD

:CreateESD
echo.
echo Step 1. Please Use an external SSD or a WTG certified drive. You can use a regular USB drive but it will be very slow.
echo Step 2. Remove all partions on the disk you want to install Windows on.
echo Step 3. Convert the disk you want to install Windows on to MBR.
echo Step 4. Create on disk you want to install Windows on one FAT32 partition that is 350MB, name it System-Reserved and assign it an unused drive letter.
echo Step 5. Create on disk you want to install Windows on one NTFS partition that is >64GB, name it Windows and assign it an unused drive letter.
echo Step 6. Make the FAT32 partition on the drive Windows is installed on active.
echo Step 7. Press any key to continue.
pause
goto :WindowsDriveLetterESD

:WindowsDriveLetterESD
echo.
set /p WindowsDriveLetter="What is your drive letter of the NTFS partition you want to install windows on? (A:-Z:) "
if /i "%WindowsDriveLetter%"=="A:" goto :SureESD
if /i "%WindowsDriveLetter%"=="B:" goto :SureESD
if /i "%WindowsDriveLetter%"=="C:" goto :SureESD
if /i "%WindowsDriveLetter%"=="D:" goto :SureESD
if /i "%WindowsDriveLetter%"=="E:" goto :SureESD
if /i "%WindowsDriveLetter%"=="F:" goto :SureESD
if /i "%WindowsDriveLetter%"=="G:" goto :SureESD
if /i "%WindowsDriveLetter%"=="H:" goto :SureESD
if /i "%WindowsDriveLetter%"=="I:" goto :SureESD
if /i "%WindowsDriveLetter%"=="J:" goto :SureESD
if /i "%WindowsDriveLetter%"=="K:" goto :SureESD
if /i "%WindowsDriveLetter%"=="L:" goto :SureESD
if /i "%WindowsDriveLetter%"=="M:" goto :SureESD
if /i "%WindowsDriveLetter%"=="N:" goto :SureESD
if /i "%WindowsDriveLetter%"=="O:" goto :SureESD
if /i "%WindowsDriveLetter%"=="P:" goto :SureESD
if /i "%WindowsDriveLetter%"=="Q:" goto :SureESD
if /i "%WindowsDriveLetter%"=="R:" goto :SureESD
if /i "%WindowsDriveLetter%"=="S:" goto :SureESD
if /i "%WindowsDriveLetter%"=="T:" goto :SureESD
if /i "%WindowsDriveLetter%"=="U:" goto :SureESD
if /i "%WindowsDriveLetter%"=="V:" goto :SureESD
if /i "%WindowsDriveLetter%"=="W:" goto :SureESD
if /i "%WindowsDriveLetter%"=="X:" goto :SureESD
if /i "%WindowsDriveLetter%"=="Y:" goto :SureESD
if /i "%WindowsDriveLetter%"=="Z:" goto :SureESD
echo Invalid Syntax!
goto :WindowsDriveLetterESD

:SureESD
echo.
set /p SureNumber="Are you sure %WindowsDriveLetter% is the drive letter you want to install Windows on? (Yes/No) "
if /i "%SureNumber%"=="Yes" goto :BCDESD
if /i "%SureNumber%"=="No" goto :WindowsDriveLetterESD
echo Invalid Syntax!
goto :SureESD

:BCDESD
echo.
set /p FAT32="What is your drive letter of the FAT32 partition on the drive you want to install windows on? (A:-Z:) "
if /i "%FAT32%"=="A:" goto :SureBCDESD
if /i "%FAT32%"=="B:" goto :SureBCDESD
if /i "%FAT32%"=="C:" goto :SureBCDESD
if /i "%FAT32%"=="D:" goto :SureBCDESD
if /i "%FAT32%"=="E:" goto :SureBCDESD
if /i "%FAT32%"=="F:" goto :SureBCDESD
if /i "%FAT32%"=="G:" goto :SureBCDESD
if /i "%FAT32%"=="H:" goto :SureBCDESD
if /i "%FAT32%"=="I:" goto :SureBCDESD
if /i "%FAT32%"=="J:" goto :SureBCDESD
if /i "%FAT32%"=="K:" goto :SureBCDESD
if /i "%FAT32%"=="L:" goto :SureBCDESD
if /i "%FAT32%"=="M:" goto :SureBCDESD
if /i "%FAT32%"=="N:" goto :SureBCDESD
if /i "%FAT32%"=="O:" goto :SureBCDESD
if /i "%FAT32%"=="P:" goto :SureBCDESD
if /i "%FAT32%"=="Q:" goto :SureBCDESD
if /i "%FAT32%"=="R:" goto :SureBCDESD
if /i "%FAT32%"=="S:" goto :SureBCDESD
if /i "%FAT32%"=="T:" goto :SureBCDESD
if /i "%FAT32%"=="U:" goto :SureBCDESD
if /i "%FAT32%"=="V:" goto :SureBCDESD
if /i "%FAT32%"=="W:" goto :SureBCDESD
if /i "%FAT32%"=="X:" goto :SureBCDESD
if /i "%FAT32%"=="Y:" goto :SureBCDESD
if /i "%FAT32%"=="Z:" goto :SureBCDESD
echo Invalid Syntax!
goto :BCDESD

:SureBCDESD
echo.
set /p SureNumber="Are you sure %FAT32% is the drive letter you wan to install Windows on? (Yes/No) "
if /i "%SureNumber%"=="Yes" goto :DISMESD2
if /i "%SureNumber%"=="No" goto :SureBCDESD
echo Invalid Syntax!
goto :SureBCDESD

:DISMESD2
dism /Apply-Image /ImageFile:%DriveLetter%\sources\install.esd /Index:%Index% /ApplyDir:%WindowsDriveLetter% || goto :CreateESD
pause
bcdboot %WindowsDriveLetter%\Windows /s %FAT32% /f ALL
goto :Done

:WIM
echo.
set /p DriveLetter="What is your drive letter of you mounted Windows Disk Image? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto :DISMWIM1
if /i "%DriveLetter%"=="B:" goto :DISMWIM1
if /i "%DriveLetter%"=="C:" goto :DISMWIM1
if /i "%DriveLetter%"=="D:" goto :DISMWIM1
if /i "%DriveLetter%"=="E:" goto :DISMWIM1
if /i "%DriveLetter%"=="F:" goto :DISMWIM1
if /i "%DriveLetter%"=="G:" goto :DISMWIM1
if /i "%DriveLetter%"=="H:" goto :DISMWIM1
if /i "%DriveLetter%"=="I:" goto :DISMWIM1
if /i "%DriveLetter%"=="J:" goto :DISMWIM1
if /i "%DriveLetter%"=="K:" goto :DISMWIM1
if /i "%DriveLetter%"=="L:" goto :DISMWIM1
if /i "%DriveLetter%"=="M:" goto :DISMWIM1
if /i "%DriveLetter%"=="N:" goto :DISMWIM1
if /i "%DriveLetter%"=="O:" goto :DISMWIM1
if /i "%DriveLetter%"=="P:" goto :DISMWIM1
if /i "%DriveLetter%"=="Q:" goto :DISMWIM1
if /i "%DriveLetter%"=="R:" goto :DISMWIM1
if /i "%DriveLetter%"=="S:" goto :DISMWIM1
if /i "%DriveLetter%"=="T:" goto :DISMWIM1
if /i "%DriveLetter%"=="U:" goto :DISMWIM1
if /i "%DriveLetter%"=="V:" goto :DISMWIM1
if /i "%DriveLetter%"=="W:" goto :DISMWIM1
if /i "%DriveLetter%"=="X:" goto :DISMWIM1
if /i "%DriveLetter%"=="Y:" goto :DISMWIM1
if /i "%DriveLetter%"=="Z:" goto :DISMWIM1
echo Invalid Syntax!
goto :WIM

:DISMWIM1
dism /Get-WimInfo /WimFile:%DriveLetter%\sources\install.wim  || goto :WIM
goto :IndexWIM 

:IndexWIM
echo.
set /p Index="Which index do you want? (1-7) "
if /i "%Index%"=="1" goto :IndexNumberWIM
if /i "%Index%"=="2" goto :IndexNumberWIM
if /i "%Index%"=="3" goto :IndexNumberWIM
if /i "%Index%"=="4" goto :IndexNumberWIM
if /i "%Index%"=="5" goto :IndexNumberWIM
if /i "%Index%"=="6" goto :IndexNumberWIM
if /i "%Index%"=="7" goto :IndexNumberWIM
echo Invalid Syntax!
goto :IndexWIM


:IndexNumberWIM
echo.
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto :CreateWIM
if /i "%IndexNumber%"=="No" goto :IndexWIM
echo Invalid Syntax!
goto :IndexNumberWIM

:CreateWIM
echo.
echo Please follow these steps.
echo. 
echo Step 1. Please Use an external SSD or a WTG certified drive. You can use a regular USB drive but it will be very slow.
echo Step 2. Remove all partions on the disk you want to install Windows on.
echo Step 3. Convert the disk you want to install Windows on to MBR.
echo Step 4. Create on disk you want to install Windows on one FAT32 partition that is 350MB, name it System-Reserved and assign it an unused drive letter.
echo Step 5. Create on disk you want to install Windows on one NTFS partition that is >64GB, name it Windows and assign it an unused drive letter.
echo Step 6. Make the FAT32 partition on the drive Windows is installed on active.
echo Step 7. Press any key to continue.
pause
goto :WindowsDriveLetterWIM

:WindowsDriveLetterWIM
echo.
set /p WindowsDriveLetter="What is your drive letter of the NTFS partition you want to install windows on? (A:-Z:) "
if /i "%WindowsDriveLetter%"=="A:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="B:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="C:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="D:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="E:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="F:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="G:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="H:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="I:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="J:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="K:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="L:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="M:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="N:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="O:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="P:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="Q:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="R:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="S:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="T:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="U:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="V:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="W:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="X:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="Y:" goto :SureWIM
if /i "%WindowsDriveLetter%"=="Z:" goto :SureWIM
echo Invalid Syntax!
goto :WindowsDriveLetterWIM

:SureWIM
echo.
set /p SureNumber="Are you sure %WindowsDriveLetter% is the drive letter you wan to install Windows on? (Yes/No) "
if /i "%SureNumber%"=="Yes" goto :BCDWIM
if /i "%SureNumber%"=="No" goto :WindowsDriveLetterWIM
echo Invalid Syntax!
goto :SureESD

:BCDWIM
echo.
set /p FAT32="What is your drive letter of the FAT32 partition on the drive you want to install windows on? (A:-Z:) "
if /i "%FAT32%"=="A:" goto :SureBCDWIM
if /i "%FAT32%"=="B:" goto :SureBCDWIM
if /i "%FAT32%"=="C:" goto :SureBCDWIM
if /i "%FAT32%"=="D:" goto :SureBCDWIM
if /i "%FAT32%"=="E:" goto :SureBCDWIM
if /i "%FAT32%"=="F:" goto :SureBCDWIM
if /i "%FAT32%"=="G:" goto :SureBCDWIM
if /i "%FAT32%"=="H:" goto :SureBCDWIM
if /i "%FAT32%"=="I:" goto :SureBCDWIM
if /i "%FAT32%"=="J:" goto :SureBCDWIM
if /i "%FAT32%"=="K:" goto :SureBCDWIM
if /i "%FAT32%"=="L:" goto :SureBCDWIM
if /i "%FAT32%"=="M:" goto :SureBCDWIM
if /i "%FAT32%"=="N:" goto :SureBCDWIM
if /i "%FAT32%"=="O:" goto :SureBCDWIM
if /i "%FAT32%"=="P:" goto :SureBCDWIM
if /i "%FAT32%"=="Q:" goto :SureBCDWIM
if /i "%FAT32%"=="R:" goto :SureBCDWIM
if /i "%FAT32%"=="S:" goto :SureBCDWIM
if /i "%FAT32%"=="T:" goto :SureBCDWIM
if /i "%FAT32%"=="U:" goto :SureBCDWIM
if /i "%FAT32%"=="V:" goto :SureBCDWIM
if /i "%FAT32%"=="W:" goto :SureBCDWIM
if /i "%FAT32%"=="X:" goto :SureBCDWIM
if /i "%FAT32%"=="Y:" goto :SureBCDWIM
if /i "%FAT32%"=="Z:" goto :SureBCDWIM
echo Invalid Syntax!
goto :BCDWIM

:SureBCDWIM
echo.
set /p SureNumber="Are you sure %FAT32% is the drive letter you wan to install Windows on? (Yes/No) "
if /i "%SureNumber%"=="Yes" goto :DISMWIM2
if /i "%SureNumber%"=="No" goto :BCDWIM
echo Invalid Syntax!
goto :SureBCDESD

:DISMWIM2
dism /Apply-Image /ImageFile:%DriveLetter%\sources\install.wim /Index:%Index% /ApplyDir:%WindowsDriveLetter% || goto :CreateWIM
bcdboot %WindowsDriveLetter%\Windows /s %FAT32% /f ALL
goto :Done

:Done
echo.
echo Your Windows to Go is ready. It is Bootable with Legacy BIOS and UEFI. Press any key to exit Windows to Go Creation Tool.
endlocal
pause