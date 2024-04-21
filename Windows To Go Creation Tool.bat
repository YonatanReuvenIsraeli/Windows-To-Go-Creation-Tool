@echo off
setlocal
title Windows To Go Creation Tool
echo Program Name: Windows To Go Creation Tool
echo Version: 3.1.3
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
net session > nul 2>&1
if not "%errorlevel%"=="0" goto NotAdministrator
goto Start

:NotAdministrator
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto Close

:Close
endlocal
exit

:Start
echo.
echo [1] Download Windows 10 22H2 Windows Disk Image.
echo [2] Download Windows 10 23H2 Windows Disk Image.
echo [3] Already have downloaded Windows 10 22H2 Windows Disk Image or Windows 11 23H2 Windows Disk Image.
set Windows=
set /p Windows="What do you want to do? (1-3) "
if /i "%Windows%"=="1" goto 10
if /i "%Windows%"=="2" goto 11
if /i "%Windows%"=="3" goto Mount
echo Invalid Syntax
goto Start

:10
echo.
echo Download Windows 10 22H2 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows10
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows10
echo.
echo Press any key to continue once you have downloaded the Windows 10 Disk Image.
pause > nul 2>&1
goto Mount

:11
echo.
echo Download Windows 11 23H2 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows11
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows11
echo.
echo Press any key to continue once you have downloaded the Windows 11 Disk Image.
pause > nul 2>&1
goto Mount

:Mount
echo.
echo Please mount your Windows Disk Image then press any key to continue.
pause > nul 2>&1
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
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows Disk Image? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto CheckExistDriveLetter
if /i "%SureDriveLetter%"=="No" goto DriveLetter
echo Invalid Syntax!
goto SureDriveLetter

:CheckExistDriveLetter
if not exist "%DriveLetter%" goto NotExist
goto BitDetection

:NotExist
echo "%DriveLetter%" does not exist. Please try again.
goto DriveLetter

:BitDetection
if exist "%DriveLetter%\sources" goto ESDSWMWIM1
if exist "%DriveLetter%\x86\sources" goto Bit1
if exist "%DriveLetter%\x64\sources" goto Bit1
echo Invalid Drive Letter!
goto DriveLetter

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
set /p SureBit="Are you sure you want a %Bit%-bit version of Windows? (Yes/No) "
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

:32ESDSWMWIM1
if exist "%DriveLetter%\x86\sources\install.esd" goto 32DISMESD1
if exist "%DriveLetter%\x86\sources\install.swm" goto 32DISMSWM1
if exist "%DriveLetter%\x86\sources\install.wim" goto 32DISMWIM1

:64ESDSWMWIM1
if exist "%DriveLetter%\x64\sources\install.esd" goto 64DISMESD1
if exist "%DriveLetter%\x64\sources\install.swm" goto 64DISMSWM1
if exist "%DriveLetter%\x64\sources\install.wim" goto 64DISMWIM1

:DISMESD1
set install=install.esd
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.esd"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:DISMSWM1
set install=install.swm
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.swm"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:DISMWIM1
set install=install.wim
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\install.wim"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:32DISMESD1
set install=install.esd
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\install.esd"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:32DISMSWM1
set install=install.swm
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\install.swm"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:32DISMWIM1
set install=install.wim
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\install.wim"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:64DISMESD1
set install=install.esd
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\install.esd"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:64DISMSWM1
set install=install.swm
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\install.swm"
if not "%errorlevel%"=="0" goto DriveLetter
goto Index

:64DISMWIM1
set install=install.wim
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\install.wim"
if not "%errorlevel%"=="0" goto DriveLetter
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
if /i "%IndexNumber%"=="Yes" goto AttachDisk
if /i "%IndexNumber%"=="No" goto Index
goto SureIndex

:AttachDisk
echo.
echo Please attach an external SSD or a WTG certifed drive then press any key to continue.
pause > nul 2>&1
goto Disk

:Disk
if exist "%cd%\DiskPart.txt" goto DiskPartExist
echo list disk %Disk% > "%cd%\DiskPart.txt"
echo exit >> "%cd%\DiskPart.txt"
DiskPart /s "%cd%\DiskPart.txt"
del "%cd%\DiskPart.txt"
echo.
set Disk=
set /p Disk="What is the disk number of the drive you attached to this PC? (0-?) "
goto SureDisk

:DiskPartExist
set DiskPart=True
echo.
echo Please temporary rename or temporary move to another location "%cd%\DiskPart.txt" in order for this batch file to proceed. Press any key to continue when "%cd%\DiskPart.txt" is renamed or moved to another location.
pause > nul 2>&1
goto Disk

:SureDisk
echo.
set SureDisk=
set /p SureDisk="All data on disk %Disk% will be deleted! Are you sure disk %Disk% is the correct disk number? (Yes/No) "
if /i "%SureDisk%"=="Yes" goto FAT32
if /i "%SureDisk%"=="No" goto Disk
echo Invalid Syntax!
goto SureDisk

:FAT32
echo.
set FAT32=
set /p FAT32="Please enter an unused drive letter. (A:-Z:) "
if exist "%FAT32%" goto ExistFAT32
if /i "%FAT32%"=="A:" goto NTFS
if /i "%FAT32%"=="B:" goto NTFS
if /i "%FAT32%"=="C:" goto NTFS
if /i "%FAT32%"=="D:" goto NTFS
if /i "%FAT32%"=="E:" goto NTFS
if /i "%FAT32%"=="F:" goto NTFS
if /i "%FAT32%"=="G:" goto NTFS
if /i "%FAT32%"=="H:" goto NTFS
if /i "%FAT32%"=="I:" goto NTFS
if /i "%FAT32%"=="J:" goto NTFS
if /i "%FAT32%"=="K:" goto NTFS
if /i "%FAT32%"=="L:" goto NTFS
if /i "%FAT32%"=="M:" goto NTFS
if /i "%FAT32%"=="N:" goto NTFS
if /i "%FAT32%"=="O:" goto NTFS
if /i "%FAT32%"=="P:" goto NTFS
if /i "%FAT32%"=="Q:" goto NTFS
if /i "%FAT32%"=="R:" goto NTFS
if /i "%FAT32%"=="S:" goto NTFS
if /i "%FAT32%"=="T:" goto NTFS
if /i "%FAT32%"=="U:" goto NTFS
if /i "%FAT32%"=="V:" goto NTFS
if /i "%FAT32%"=="W:" goto NTFS
if /i "%FAT32%"=="X:" goto NTFS
if /i "%FAT32%"=="Y:" goto NTFS
if /i "%FAT32%"=="Z:" goto NTFS
echo Invalid Syntax!
goto FAT32

:ExistFAT32
echo "%FAT32%" exists! Please try again.
goto FAT32

:NTFS
echo.
set NTFS=
set /p NTFS="Please enter another unused drive letter. (A:-Z:) "
if /i "%NTFS%" EQU "%FAT32%" goto SameDriveLetterNTFS
if exist "%NTFS%" goto ExistNTFS
if /i "%NTFS%"=="A:" goto DiskPart
if /i "%NTFS%"=="B:" goto DiskPart
if /i "%NTFS%"=="C:" goto DiskPart
if /i "%NTFS%"=="D:" goto DiskPart
if /i "%NTFS%"=="E:" goto DiskPart
if /i "%NTFS%"=="F:" goto DiskPart
if /i "%NTFS%"=="G:" goto DiskPart
if /i "%NTFS%"=="H:" goto DiskPart
if /i "%NTFS%"=="I:" goto DiskPart
if /i "%NTFS%"=="J:" goto DiskPart
if /i "%NTFS%"=="K:" goto DiskPart
if /i "%NTFS%"=="L:" goto DiskPart
if /i "%NTFS%"=="M:" goto DiskPart
if /i "%NTFS%"=="N:" goto DiskPart
if /i "%NTFS%"=="O:" goto DiskPart
if /i "%NTFS%"=="P:" goto DiskPart
if /i "%NTFS%"=="Q:" goto DiskPart
if /i "%NTFS%"=="R:" goto DiskPart
if /i "%NTFS%"=="S:" goto DiskPart
if /i "%NTFS%"=="T:" goto DiskPart
if /i "%NTFS%"=="U:" goto DiskPart
if /i "%NTFS%"=="V:" goto DiskPart
if /i "%NTFS%"=="W:" goto DiskPart
if /i "%NTFS%"=="X:" goto DiskPart
if /i "%NTFS%"=="Y:" goto DiskPart
if /i "%NTFS%"=="Z:" goto DiskPart
echo Invalid Syntax!
goto NTFS

:SameDriveLetterNTFS
echo First unused drive letter ("%NTFS%") same as second unused drive letter ("%DriveLetter%"). Please try again.
goto NTFS

:ExistNTFS
echo "%NTFS%" exists! Please try again.
goto NTFS

:DiskPart
echo.
echo Partitioning and formating disk %Disk%.
echo sel disk %Disk% > "%cd%\DiskPart.txt"
echo clean >> "%cd%\DiskPart.txt"
echo convert mbr >> "%cd%\DiskPart.txt"
echo create partition Primary size=350 >> "%cd%\DiskPart.txt"
echo format fs=FAT32 label="SYSTEM" quick >> "%cd%\DiskPart.txt"
echo assign letter=%FAT32% >> "%cd%\DiskPart.txt"
echo active >> "%cd%\DiskPart.txt"
echo create partition Primary >> "%cd%\DiskPart.txt"
echo format fs=NTFS label="Windows" quick >> "%cd%\DiskPart.txt"
echo assign letter=%NTFS% >> "%cd%\DiskPart.txt"
echo exit >> "%cd%\DiskPart.txt"
DiskPart /s "%cd%\DiskPart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto DiskPartError
del "%cd%\DiskPart.txt"
echo Disk %Disk% partitioned and formated.
goto Bit3

:DiskPartError
echo.
echo %Disk% does not exist!
goto Disk

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
echo.
echo Installing Windows.
DISM /Apply-Image /ImageFile:"%DriveLetter%\sources\install.esd" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto BitDetection
echo Windows installed.
goto Done

:DISMSWM2
echo.
echo Installing Windows.
DISM /Apply-Image /ImageFile:"%DriveLetter%\sources\install.swm" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto BitDetection
echo Windows installed.
goto Done

:DISMWIM2
echo.
echo Installing Windows.
DISM/Apply-Image /ImageFile:"%DriveLetter%\sources\install.wim" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto BitDetection
echo Windows installed.
goto Done

:32DISMESD2
echo.
echo Installing Windows.
DISM /Apply-Image /ImageFile:"%DriveLetter%\x86\sources\install.esd" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto BitDetection
echo Windows installed.
goto Done

:32DISMSWM2
echo.
echo Installing Windows.
DISM /Apply-Image /ImageFile:"%DriveLetter%\x86\sources\install.swm" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto BitDetection
echo Windows installed.
goto Done

:32DISMWIM2
echo.
echo Installing Windows.
DISM/Apply-Image /ImageFile:"%DriveLetter%\x86\sources\install.wim" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto BitDetection
echo Windows installed.
goto Done

:64DISMESD2
echo.
echo Installing Windows.
DISM /Apply-Image /ImageFile:"%DriveLetter%\x64\sources\install.esd" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto BitDetection
echo Windows installed.
goto Done

:64DISMSWM2
echo.
echo Installing Windows.
DISM /Apply-Image /ImageFile:"%DriveLetter%\x64\sources\install.swm" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto BitDetection
echo Windows installed.
goto Done

:64DISMWIM2
echo.
echo Installing Windows.
DISM/Apply-Image /ImageFile:"%DriveLetter%\x64\sources\install.wim" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto BitDetection
echo Windows installed.
goto Bootloader

:Bootloader
echo.
echo Creating bootloader.
BCDBoot "%NTFS%\Windows" /s "%FAT32%" /f ALL > nul 2>&1
if not "%errorlevel%"=="0" goto BootloaderError
echo sel vol %FAT32% > "%cd%\DiskPart.txt"
echo remove letter=%FAT32% >> "%cd%\DiskPart.txt"
echo exit >> "%cd%\DiskPart.txt"
DiskPart /s "%cd%\DiskPart.txt" > nul 2>&1
del "%cd%\DiskPart.txt"
echo Bootloader created.
if "%DiskPart%"=="True" goto DiskPartDone
goto Done

:BootloaderError
echo.
echo Error creating the bootloader! You can try again.
goto DriveLetter

:DiskPartDone
echo.
echo You can now rename or move back the file back to "%cd%\DiskPart.txt".
goto Done

:Done
endlocal
echo.
echo Your Windows To Go is ready! It is Bootable with Legacy BIOS and UEFI. Press any key to close this batch file.
pause > nul 2>&1
exit
