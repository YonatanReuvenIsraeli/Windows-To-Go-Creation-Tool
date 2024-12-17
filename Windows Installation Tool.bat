@echo off
setlocal
title Windows Installation Tool
echo Program Name: Windows Installation Tool
echo Version: 5.0.1
echo Developer: @YonatanReuvenIsraeli
echo Website: https://www.yonatanreuvenisraeli.dev
echo License: GNU General Public License v3.0
net session > nul 2>&1
if not "%errorlevel%"=="0" goto "NotAdministrator"
goto "Start"

:"NotAdministrator"
echo.
echo Please run this batch file as an administrator. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"Close"
endlocal
exit

:"Start"
echo.
echo [1] Install Windows.
echo [2] Install Windows To Go.
echo.
set Windows=
set /p Windows="What do you want to do? (1-2) "
if /i "%Windows%"=="1" goto "SureWindows"
if /i "%Windows%"=="2" goto "SureWindows"
echo Invalid syntax!
goto "Start"

:"SureWindows"
echo.
set SureWindows=
if /i "%Windows%"=="1" set /p SureWindows="Are you sure you want to install Windows? (Yes/No) "
if /i "%Windows%"=="2" set /p SureWindows="Are you sure you want to install Windows To Go? (Yes/No) "
if /i "%SureWindows%"=="Yes" goto "Download"
if /i "%SureWindows%"=="No" goto "Start"
echo Invalid syntax!
goto "SureWindows"

:"Download"
echo.
echo [1] Download Windows 10 22H2 x86/x64 Windows Disk Image.
echo [2] Download Windows 11 24H2 x64 Windows Disk Image.
echo [3] Download Windows 11 24H2 Arm64 Windows Disk Image.
echo [4] Already have downloaded Windows 10 22H2 x86/x64 Windows Disk Image or Windows 11 24H2 x64/Arm64 Windows Disk Image.
echo.
set Download=
set /p Download="What do you want to do? (1-4) "
if /i "%Download%"=="1" goto "SureDownload"
if /i "%Download%"=="2" goto "SureDownload"
if /i "%Download%"=="3" goto "SureDownload"
if /i "%Download%"=="4" goto "SureDownload"
echo Invalid syntax!
goto "Download"

:"SureDownload"
echo.
set SureDownload=
if /i "%Download%"=="1" set /p SureDownload="Are you sure you want to download Windows 10 22H2 x86/x64 Windows Disk Image? (Yes/No) "
if /i "%Download%"=="2" set /p SureDownload="Are you sure you want to download Windows 11 24H2 x64 Windows Disk Image? (Yes/No) "
if /i "%Download%"=="3" set /p SureDownload="Are you sure you want to download Windows 11 24H2 Arm64 Windows Disk Image? (Yes/No) "
if /i "%Download%"=="4" set /p SureDownload="Are you sure you have downloaded Windows 10 22H2 x86/x64 Windows Disk Image or Windows 11 24H2 x64/Arm64 Windows Disk Image? (Yes/No) "
if /i "%SureDownload%"=="Yes" goto "DownloadGo"
if /i "%SureDownload%"=="No" goto "Start"
echo Invalid syntax!
goto "SureDownload"

:"DownloadGo"
if /i "%Download%"=="1" goto "10"
if /i "%Download%"=="2" goto "11x64"
if /i "%Download%"=="3" goto "11Arm64"
if /i "%Download%"=="4" goto "Mount"

:"10"
echo.
echo Download Windows 10 22H2 x86/x64 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows10
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows10
echo.
echo Press any key to continue once you have downloaded the Windows 10 22H2 x86/x64 Disk Image.
pause > nul 2>&1
goto "Mount"

:"11x64"
echo.
echo Download Windows 11 24H2 x64 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows11
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows11
echo.
echo Press any key to continue once you have downloaded the Windows 11 24H2 x64 Disk Image.
pause > nul 2>&1
goto "Mount"

:"11Arm64"
echo.
echo Download Windows 11 24H2 Arm64 Disk Image from here. ^-^-^> https://www.microsoft.com/software-download/windows11arm64
echo Press any key to open the website.
pause > nul 2>&1
start https://www.microsoft.com/software-download/windows11arm64
echo.
echo Press any key to continue once you have downloaded the Windows 11 24H2 Arm64 Disk Image.
pause > nul 2>&1
goto "Mount"

:"Mount"
echo.
echo Please mount your Windows Disk Image then press any key to continue.
pause > nul 2>&1
goto "DriveLetter"

:"DriveLetter"
echo.
set DriveLetter=
set /p DriveLetter="What is the drive letter of your mounted Windows Disk Image? (A:-Z:) "
if /i "%DriveLetter%"=="A:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="B:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="C:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="D:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="E:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="F:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="G:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="H:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="I:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="J:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="K:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="L:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="M:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="N:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="O:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="P:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Q:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="R:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="S:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="T:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="U:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="V:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="W:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="X:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Y:" goto "SureDriveLetter"
if /i "%DriveLetter%"=="Z:" goto "SureDriveLetter"
echo Invalid syntax!
goto "DriveLetter"

:"SureDriveLetter"
echo.
set SureDriveLetter=
set /p SureDriveLetter="Are you sure "%DriveLetter%" is the drive letter of your Windows Disk Image? (Yes/No) "
if /i "%SureDriveLetter%"=="Yes" goto "CheckExistDriveLetter"
if /i "%SureDriveLetter%"=="No" goto "DriveLetter"
echo Invalid syntax!
goto "SureDriveLetter"

:"CheckExistDriveLetter"
if not exist "%DriveLetter%" goto "NotExist"
goto "BitDetection"

:"NotExist"
echo "%DriveLetter%" does not exist. Please try again.
goto "DriveLetter"

:"BitDetection"
if exist "%DriveLetter%\sources" goto "ESDSWMWIM"
if exist "%DriveLetter%\x86\sources" goto "Bit1"
if exist "%DriveLetter%\x64\sources" goto "Bit1"
echo Invalid drive letter!
goto "DriveLetter"

:"Bit1"
echo.
set Bit=
set /p Bit="Do you want 32-bit or 64-bit version of Windows? (32/64) "
if /i "%Bit%"=="32" goto "SureBit"
if /i "%Bit%"=="64" goto "SureBit"
echo Invalid syntax!
goto "Bit1"

:"SureBit"
echo.
set SureBit=
set /p SureBit="Are you sure you want a %Bit%-bit version of Windows? (Yes/No) "
if /i "%SureBit%"=="Yes" goto "Bit2"
if /i "%SureBit%"=="No" goto "Bit1"
echo Invalid syntax!
goto "SureBit"

:"Bit2"
if /i "%Bit%"=="32" goto "32ESDSWMWIM"
if /i "%Bit%"=="64" goto "64ESDSWMWIM"
goto "ESDSWMWIM"

:"ESDSWMWIM"
if exist "%DriveLetter%\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\sources\install.wim" set Install=install.wim
goto "DISM1"

:"32ESDSWMWIM"
if exist "%DriveLetter%\x86\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\x86\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\x86\sources\install.wim" set Install=install.wim
goto "32DISM1"

:"64ESDSWMWIM"
if exist "%DriveLetter%\x64\sources\install.esd" set Install=install.esd
if exist "%DriveLetter%\x64\sources\install.swm" set Install=install.swm
if exist "%DriveLetter%\x64\sources\install.wim" set Install=install.wim
goto "64DISM1"

:"DISM1"
if exist "%cd%\Index.txt" goto "IndexExist"
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\%Install%" | find /c /i "Index" > "%cd%\Index.txt"
set /p IndexNumber=< "%cd%\Index.txt"
del "%cd%\Index.txt" /f /q > nul 2>&1
set bootmgr=
if not exist "%DriveLetter%\bootmgr" set bootmgr=Arm64
echo.
echo Getting index details for Windows Disk Image "%DriveLetter%".
DISM /Get-WimInfo /WimFile:"%DriveLetter%\sources\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetter"
echo Got index details for Windows Disk Image "%DriveLetter%".
if "%Index%"=="True" goto "IndexDone"
if "%IndexNumber%"=="3" goto "Index3"
if "%IndexNumber%"=="7" goto "Index7"
if "%IndexNumber%"=="11" goto "Index11"
echo.
echo Invalid Windows Disk Image!
goto "Start"

:"IndexExist"
set Index=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\Index.txt" in order for this batch file to proceed. "%cd%\Index.txt" is not a system file. Press any key to continue when "%cd%\Index.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "DISM1"

:"IndexDone"
echo.
echo You can now rename or move back the file back to "%cd%\Index.txt".
if "%IndexNumber%"=="3" goto "Index3"
if "%IndexNumber%"=="7" goto "Index7"
if "%IndexNumber%"=="11" goto "Index11"
echo.
echo Invalid Windows Disk Image!
goto "Start"

:"32DISM1"
echo.
echo Getting index details for Windows Disk Image "%DriveLetter%".
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x86\sources\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetter"
echo Got index details for Windows Disk Image "%DriveLetter%".
goto "Index7"

:"64DISM1"
echo.
echo Getting index details for Windows Disk Image "%DriveLetter%".
DISM /Get-WimInfo /WimFile:"%DriveLetter%\x64\sources\%Install%"
if not "%errorlevel%"=="0" goto "DriveLetter"
echo Got index details for Windows Disk Image "%DriveLetter%".
goto "Index7"

:"Index3"
echo.
set Index=
set /p Index="Which index do you want? (1-3) "
if /i "%Index%"=="1" goto "SureIndex3"
if /i "%Index%"=="2" goto "SureIndex3"
if /i "%Index%"=="3" goto "SureIndex3"
echo Invalid syntax!
goto "Bit2"

:"SureIndex3"
echo.
set IndexNumber=
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto "AttachDisk"
if /i "%IndexNumber%"=="No" goto "Index3"
echo Invalid syntax!
goto "SureIndex3"

:"Index7"
echo.
set Index=
set /p Index="Which index do you want? (1-7) "
if /i "%Index%"=="1" goto "SureIndex7"
if /i "%Index%"=="2" goto "SureIndex7"
if /i "%Index%"=="3" goto "SureIndex7"
if /i "%Index%"=="4" goto "SureIndex7"
if /i "%Index%"=="5" goto "SureIndex7"
if /i "%Index%"=="6" goto "SureIndex7"
if /i "%Index%"=="7" goto "SureIndex7"
echo Invalid syntax!
goto "Bit2"

:"SureIndex7"
echo.
set IndexNumber=
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto "AttachDisk"
if /i "%IndexNumber%"=="No" goto "Index7"
echo Invalid syntax!
goto "SureIndex7"

:"Index11"
echo.
set Index=
set /p Index="Which index do you want? (1-11) "
if /i "%Index%"=="1" goto "SureIndex11"
if /i "%Index%"=="2" goto "SureIndex11"
if /i "%Index%"=="3" goto "SureIndex11"
if /i "%Index%"=="4" goto "SureIndex11"
if /i "%Index%"=="5" goto "SureIndex11"
if /i "%Index%"=="6" goto "SureIndex11"
if /i "%Index%"=="7" goto "SureIndex11"
if /i "%Index%"=="8" goto "SureIndex11"
if /i "%Index%"=="9" goto "SureIndex11"
if /i "%Index%"=="10" goto "SureIndex11"
if /i "%Index%"=="11" goto "SureIndex11"
echo Invalid syntax!
goto "Bit2"

:"SureIndex11"
echo.
set IndexNumber=
set /p IndexNumber="Are you sure you want Index %Index%? (Yes/No) "
if /i "%IndexNumber%"=="Yes" goto "AttachDisk"
if /i "%IndexNumber%"=="No" goto "Index11"
echo Invalid syntax!
goto "SureIndex11"

:"AttachDisk"
echo.
if /i "%Windows%"=="1" echo Please attach an SSD or a HDD then press any key to continue.
if /i "%Windows%"=="2" echo Please attach an external SSD or a WTG certifed drive then press any key to continue.
pause > nul 2>&1
goto "DiskPartSet"

:"DiskPartSet"
set DiskPart=
goto "Disk"

:"Disk"
if exist "%cd%\DiskPart.txt" goto "DiskPartExistDisk"
echo.
echo Finding disks attached to this PC.
(echo list disk) > "%cd%\DiskPart.txt"
(echo exit) >> "%cd%\DiskPart.txt"
DiskPart /s "%cd%\DiskPart.txt" 2>&1
if not "%errorlevel%"=="0" goto "DiskError"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Disks attached to this PC found.
echo.
set Disk=
set /p Disk="What is the disk number of the drive you attached to this PC? (0-?) "
goto "SureDisk"

:"DiskPartExistDisk"
set DiskPart=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\DiskPart.txt" in order for this batch file to proceed. "%cd%\DiskPart.txt" is not a system file. Press any key to continue when "%cd%\DiskPart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "Disk"

:"DiskError"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "AttachDisk"

:"SureDisk"
echo.
set SureDisk=
set /p SureDisk="All data on disk %Disk% will be deleted! Are you sure disk %Disk% is the correct disk number? (Yes/No) "
if /i "%SureDisk%"=="Yes" goto "FAT32"
if /i "%SureDisk%"=="No" goto "Disk"
echo Invalid syntax!
goto "SureDisk"

:"FAT32"
echo.
set FAT32=
set /p FAT32="Please enter an unused drive letter. (A:-Z:) "
if /i "%FAT32%"=="%DriveLetter%" goto "SameDriveLetterFAT32DriveLetter"
if exist "%FAT32%" goto "ExistFAT32"
if /i "%FAT32%"=="A:" goto "NTFS"
if /i "%FAT32%"=="B:" goto "NTFS"
if /i "%FAT32%"=="C:" goto "NTFS"
if /i "%FAT32%"=="D:" goto "NTFS"
if /i "%FAT32%"=="E:" goto "NTFS"
if /i "%FAT32%"=="F:" goto "NTFS"
if /i "%FAT32%"=="G:" goto "NTFS"
if /i "%FAT32%"=="H:" goto "NTFS"
if /i "%FAT32%"=="I:" goto "NTFS"
if /i "%FAT32%"=="J:" goto "NTFS"
if /i "%FAT32%"=="K:" goto "NTFS"
if /i "%FAT32%"=="L:" goto "NTFS"
if /i "%FAT32%"=="M:" goto "NTFS"
if /i "%FAT32%"=="N:" goto "NTFS"
if /i "%FAT32%"=="O:" goto "NTFS"
if /i "%FAT32%"=="P:" goto "NTFS"
if /i "%FAT32%"=="Q:" goto "NTFS"
if /i "%FAT32%"=="R:" goto "NTFS"
if /i "%FAT32%"=="S:" goto "NTFS"
if /i "%FAT32%"=="T:" goto "NTFS"
if /i "%FAT32%"=="U:" goto "NTFS"
if /i "%FAT32%"=="V:" goto "NTFS"
if /i "%FAT32%"=="W:" goto "NTFS"
if /i "%FAT32%"=="X:" goto "NTFS"
if /i "%FAT32%"=="Y:" goto "NTFS"
if /i "%FAT32%"=="Z:" goto "NTFS"
echo Invalid syntax!
goto "FAT32"

:"SameDriveLetterFAT32DriveLetter"
echo Unused drive letter ("%FAT32%") is the same as Windows Disk Image drive letter ("%DriveLetter%")! Please try again.
goto "FAT32"

:"ExistFAT32"
echo "%FAT32%" exists! Please try again.
goto "FAT32"

:"NTFS"
echo.
set NTFS=
set /p NTFS="Please enter another unused drive letter. (A:-Z:) "
if /i "%NTFS%"=="%DriveLetter%" goto "SameDriveLetterNTFSDriveLetter"
if /i "%NTFS%"=="%FAT32%" goto "SameDriveLetterNTFSFAT32"
if exist "%NTFS%" goto "ExistNTFS"
if /i "%NTFS%"=="A:" goto "WindowsCheck"
if /i "%NTFS%"=="B:" goto "WindowsCheck"
if /i "%NTFS%"=="C:" goto "WindowsCheck"
if /i "%NTFS%"=="D:" goto "WindowsCheck"
if /i "%NTFS%"=="E:" goto "WindowsCheck"
if /i "%NTFS%"=="F:" goto "WindowsCheck"
if /i "%NTFS%"=="G:" goto "WindowsCheck"
if /i "%NTFS%"=="H:" goto "WindowsCheck"
if /i "%NTFS%"=="I:" goto "WindowsCheck"
if /i "%NTFS%"=="J:" goto "WindowsCheck"
if /i "%NTFS%"=="K:" goto "WindowsCheck"
if /i "%NTFS%"=="L:" goto "WindowsCheck"
if /i "%NTFS%"=="M:" goto "WindowsCheck"
if /i "%NTFS%"=="N:" goto "WindowsCheck"
if /i "%NTFS%"=="O:" goto "WindowsCheck"
if /i "%NTFS%"=="P:" goto "WindowsCheck"
if /i "%NTFS%"=="Q:" goto "WindowsCheck"
if /i "%NTFS%"=="R:" goto "WindowsCheck"
if /i "%NTFS%"=="S:" goto "WindowsCheck"
if /i "%NTFS%"=="T:" goto "WindowsCheck"
if /i "%NTFS%"=="U:" goto "WindowsCheck"
if /i "%NTFS%"=="V:" goto "WindowsCheck"
if /i "%NTFS%"=="W:" goto "WindowsCheck"
if /i "%NTFS%"=="X:" goto "WindowsCheck"
if /i "%NTFS%"=="Y:" goto "WindowsCheck"
if /i "%NTFS%"=="Z:" goto "WindowsCheck"
echo Invalid syntax!
goto "NTFS"

:"SameDriveLetterNTFSDriveLetter"
echo Second unused drive letter ("%NTFS%") is the same as Windows Disk Image drive letter ("%DriveLetter%")! Please try again.
goto "NTFS"

:"SameDriveLetterNTFSFAT32"
echo Second unused drive letter ("%NTFS%") same as First unused drive letter ("%FAT32%"). Please try again.
goto "NTFS"

:"ExistNTFS"
echo "%NTFS%" exists! Please try again.
goto "NTFS"

:"WindowsCheck"
if /i "%Windows%"=="1" goto "RecoveryDriveLetter"
if /i "%Windows%"=="2" goto "DiskPartToGo"

:"RecoveryDriveLetter"
echo.
set Recovery=
set /p Recovery="Please enter a third unused drive letter. (A:-Z:) "
if /i "%Recovery%"=="%DriveLetter%" goto "SameDriveLetterRecovery"
if /i "%Recovery%"=="%FAT32%" goto "SameDriveLetterRecoveryFAT32"
if /i "%Recovery%"=="%NTFS%" goto "SameDriveLetterRecoveryNTFS"
if exist "%Recovery%" goto "ExistRecoveryDriveLetter"
if /i "%Recovery%"=="A:" goto "BIOSAsk"
if /i "%Recovery%"=="B:" goto "BIOSAsk"
if /i "%Recovery%"=="C:" goto "BIOSAsk"
if /i "%Recovery%"=="D:" goto "BIOSAsk"
if /i "%Recovery%"=="E:" goto "BIOSAsk"
if /i "%Recovery%"=="F:" goto "BIOSAsk"
if /i "%Recovery%"=="G:" goto "BIOSAsk"
if /i "%Recovery%"=="H:" goto "BIOSAsk"
if /i "%Recovery%"=="I:" goto "BIOSAsk"
if /i "%Recovery%"=="J:" goto "BIOSAsk"
if /i "%Recovery%"=="K:" goto "BIOSAsk"
if /i "%Recovery%"=="L:" goto "BIOSAsk"
if /i "%Recovery%"=="M:" goto "BIOSAsk"
if /i "%Recovery%"=="N:" goto "BIOSAsk"
if /i "%Recovery%"=="O:" goto "BIOSAsk"
if /i "%Recovery%"=="P:" goto "BIOSAsk"
if /i "%Recovery%"=="Q:" goto "BIOSAsk"
if /i "%Recovery%"=="R:" goto "BIOSAsk"
if /i "%Recovery%"=="S:" goto "BIOSAsk"
if /i "%Recovery%"=="T:" goto "BIOSAsk"
if /i "%Recovery%"=="U:" goto "BIOSAsk"
if /i "%Recovery%"=="V:" goto "BIOSAsk"
if /i "%Recovery%"=="W:" goto "BIOSAsk"
if /i "%Recovery%"=="X:" goto "BIOSAsk"
if /i "%Recovery%"=="Y:" goto "BIOSAsk"
if /i "%Recovery%"=="Z:" goto "BIOSAsk"
echo Invalid syntax!
goto "RecoveryDriveLetter"

:"SameDriveLetterRecovery"
echo Third unused drive letter ("%Recovery%") is the same as Windows Disk Image drive letter ("%DriveLetter%")! Please try again.
goto "RecoveryDriveLetter"

:"SameDriveLetterRecoveryFAT32"
echo Third unused drive letter ("%Recovery%") same as first unused drive letter ("%FAT32%"). Please try again.
goto "RecoveryDriveLetter"

:"SameDriveLetterRecoveryNTFS"
echo Third unused drive letter ("%Recovery%") same as second unused drive letter ("%NTFS%"). Please try again.
goto "RecoveryDriveLetter"

:"ExistRecoveryDriveLetter"
echo "%Recovery%" exists! Please try again.
goto "RecoveryDriveLetter"

:"BIOSAsk"
if /i "%bootmgr%"=="Arm64" set BIOSAsk=2
if /i "%bootmgr%"=="Arm64" goto "fsutil"
echo.
echo [1] Legacy BIOS
echo [2] UEFI
echo [3] Both
echo.
set BIOSAsk=
set /p BIOSAsk="Are you installing for Legacy BIOS, UEFI or both? (1-3) "
if /i "%BIOSAsk%"=="1" goto "SureBIOSAsk"
if /i "%BIOSAsk%"=="2" goto "SureBIOSAsk"
if /i "%BIOSAsk%"=="3" goto "SureBIOSAsk"
echo Invalid syntax!
goto "BIOSAsk"

:"SureBIOSAsk"
echo.
set SureBIOSAsk=
if /i "%BIOSAsk%"=="1" set /p SureBIOSAsk="Are you sure you are installing for Legacy BIOS? (Yes/No) "
if /i "%BIOSAsk%"=="2" set /p SureBIOSAsk="Are you sure you are installing for UEFI? (Yes/No) "
if /i "%BIOSAsk%"=="3" set /p SureBIOSAsk="Are you sure you are installing for both? (Yes/No) "
if /i "%SureBIOSAsk%"=="Yes" goto "fsutil"
if /i "%SureBIOSAsk%"=="No" goto "BIOSAsk"
echo Invalid syntax!
goto "SureBIOSAsk"

:"fsutil"
if exist "%cd%\fsutil.txt" goto "fsutilExist"
echo.
echo Getting disk %Disk% details.
fsutil fsinfo sectorinfo \\.\PhysicalDrive%Disk% | find /i /c "PhysicalBytesPerSectorForAtomicity :                    4096" > %cd%\fsutil.txt
set /p fsutil=< "%cd%\fsutil.txt"
echo Got disk %Disk% details.
del "%cd%\fsutil.txt" /f /q > nul 2>&1
if /i "%fsutil%"=="True" goto "fsutilDone"
goto "DiskPartWindows"

:"fsutilExist"
set fsutil=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\fsutil.txt" in order for this batch file to proceed. "%cd%\fsutil.txt" is not a system file. Press any key to continue when "%cd%\fsutil.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "fsutil"

:"fsutilDone"
echo.
echo You can now rename or move back the file back to "%cd%\fsutil.txt". Press any key to continue.
pause > nul 2>&1
goto "DiskPartWindows"

:"DiskPartWindows"
if exist "%cd%\DiskPart.txt" goto "DiskPartExistDiskPartWindows"
echo.
echo Partitioning and formating disk %Disk%.
(echo select disk %Disk%) > %cd%\DiskPart.txt
(echo clean) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="1" (echo convert mbr) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="2" (echo convert gpt) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="3" (echo convert mbr) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="1" if /i "%fsutil%"=="0" (echo create partition primary size=100) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="1" if /i "%fsutil%"=="1" (echo create partition primary size=260) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="2" if /i "%fsutil%"=="0" (echo create partition efi size=100) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="2" if /i "%fsutil%"=="1" (echo create partition efi size=260) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="3" if /i "%fsutil%"=="0" (echo create partition primary size=100) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="3" if /i "%fsutil%"=="1" (echo create partition primary size=260) >> %cd%\DiskPart.txt
(echo format quick fs=FAT32 label="System")  >> %cd%\DiskPart.txt
(echo assign letter="%FAT32%") >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="1" (echo active) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="3" (echo active) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="2" (echo create partition msr size=16) >> %cd%\DiskPart.txt
(echo create partition primary) >> %cd%\DiskPart.txt
(echo shrink minimum=500) >> %cd%\DiskPart.txt
(echo format quick fs=ntfs label="Windows") >> %cd%\DiskPart.txt
(echo assign letter="%NTFS%") >> %cd%\DiskPart.txt
(echo create partition primary) >> %cd%\DiskPart.txt
(echo format quick fs=ntfs label="Recovery") >> %cd%\DiskPart.txt
(echo assign letter="%Recovery%") >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="1" (echo set id=27) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="2" (echo set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac") >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="3" (echo set id=27) >> %cd%\DiskPart.txt
if /i "%BIOSAsk%"=="2" (echo gpt attributes=0x8000000000000001) >> %cd%\DiskPart.txt
(echo exit) >> %cd%\DiskPart.txt
DiskPart /s "%cd%\DiskPart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "DiskPartErrorDiskPartWindows"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Disk %Disk% partitioned and formated.
goto "Bit3"

:"DiskPartExistDiskDiskPartWindows"
set DiskPart=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\DiskPart.txt" in order for this batch file to proceed. "%cd%\DiskPart.txt" is not a system file. Press any key to continue when "%cd%\DiskPart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "DiskPartWindows"

:"DiskPartErrorDiskPartWindows"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Error formating and partitioning disk %Disk%. Disk %Disk% may not exist! Disk %Disk% may be smaller than 64 GB! Press any key to try again.
pause > nul 2>&1
goto "Disk"

:"DiskPartToGo"
if exist "%cd%\DiskPart.txt" goto "DiskPartExistDiskPartToGo"
echo.
echo Partitioning and formating disk %Disk%.
(echo sel disk %Disk%) > "%cd%\DiskPart.txt"
(echo clean) >> "%cd%\DiskPart.txt"
if /i not "%bootmgr%"=="Arm64" (echo convert mbr) >> "%cd%\DiskPart.txt"
if /i "%bootmgr%"=="Arm64" "%DriveLetter%\bootmgr" (echo convert gpt) >> "%cd%\DiskPart.txt"
if /i not "%bootmgr%"=="Arm64" (echo create partition Primary size=350) >> "%cd%\DiskPart.txt"
if /i "%bootmgr%"=="Arm64" (echo create partition efi size=350) >> "%cd%\DiskPart.txt"
(echo format fs=FAT32 label="WTG-System" quick) >> "%cd%\DiskPart.txt"
(echo assign letter=%FAT32%) >> "%cd%\DiskPart.txt"
if /i not "%bootmgr%"=="Arm64" (echo active) >> "%cd%\DiskPart.txt"
(echo create partition Primary) >> "%cd%\DiskPart.txt"
(echo format fs=NTFS label="WTG-Windows" quick) >> "%cd%\DiskPart.txt"
(echo assign letter=%NTFS%) >> "%cd%\DiskPart.txt"
(echo attributes vol set nodefaultdriveletter) >> "%cd%\DiskPart.txt"
(echo exit) >> "%cd%\DiskPart.txt"
DiskPart /s "%cd%\DiskPart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "DiskPartToGoError"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Disk %Disk% partitioned and formated.
goto "Bit3"

:"DiskPartExistDiskPartToGo"
set DiskPart=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\DiskPart.txt" in order for this batch file to proceed. "%cd%\DiskPart.txt" is not a system file. Press any key to continue when "%cd%\DiskPart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "DiskPartToGo"

:"DiskPartToGoError"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Error formating and partitioning disk %Disk%. Disk %Disk% may not exist! Disk %Disk% may be smaller than 64 GB! Press any key to try again.
pause > nul 2>&1
goto "Disk"

:"Bit3"
if /i "%Bit%"=="32" goto "32DISM2"
if /i "%Bit%"=="64" goto "64DISM2"
goto "DISM2"

:"DISM2"
echo.
echo Installing Windows.
DISM /Apply-Image /ImageFile:"%DriveLetter%\sources\%Install%" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto "BitDetection"
echo Windows installed.
if /i "%bootmgr%"=="Arm64" goto "BootloaderUEFI"
if /i "%Windows%"=="2" goto "BootloaderBoth"
if /i "%BIOSAsk%"=="1" goto "BootloaderBIOS"
if /i "%BIOSAsk%"=="2" goto "BootloaderUEFI"
if /i "%BIOSAsk%"=="3" goto "BootloaderBoth"

:"32DISM2"
echo.
echo Installing Windows.
DISM /Apply-Image /ImageFile:"%DriveLetter%\x86\sources\%Install%" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto "BitDetection"
echo Windows installed.
if /i "%bootmgr%"=="Arm64" goto "BootloaderUEFI"
if /i "%Windows%"=="2" goto "BootloaderBoth"
if /i "%BIOSAsk%"=="1" goto "BootloaderBIOS"
if /i "%BIOSAsk%"=="2" goto "BootloaderUEFI"
if /i "%BIOSAsk%"=="3" goto "BootloaderBoth"

:"64DISM2"
echo.
echo Installing Windows.
DISM /Apply-Image /ImageFile:"%DriveLetter%\x64\sources\%Install%" /Index:%Index% /ApplyDir:%NTFS%
if not "%errorlevel%"=="0" goto "BitDetection"
echo Windows installed.
if /i "%bootmgr%"=="Arm64" goto "BootloaderUEFI"
if /i "%Windows%"=="2" goto "BootloaderBoth"
if /i "%BIOSAsk%"=="1" goto "BootloaderBIOS"
if /i "%BIOSAsk%"=="2" goto "BootloaderUEFI"
if /i "%BIOSAsk%"=="3" goto "BootloaderBoth"

:"BootloaderBIOS"
if exist "%cd%\DiskPart.txt" goto "DiskPartExistBootloaderBIOS"
echo.
echo Creating bootloader.
BCDBoot "%NTFS%\Windows" /s "%FAT32%" /f ALL > nul 2>&1
if not "%errorlevel%"=="0" goto "BootloaderErrorBIOS"
(echo sel vol %FAT32%) > "%cd%\DiskPart.txt"
(echo remove letter=%FAT32%) >> "%cd%\DiskPart.txt"
(echo exit) >> "%cd%\DiskPart.txt"
DiskPart /s "%cd%\DiskPart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "BootloaderErrorBIOS"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Bootloader created.
if /i "%Windows%"=="2" if /i "%DiskPart%"=="True" goto "DiskPartDone"
if /i "%Windows%"=="2" goto "SANPolicy"
goto "Recovery"

:"DiskPartExistBootloaderBIOS"
set DiskPart=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\DiskPart.txt" in order for this batch file to proceed. "%cd%\DiskPart.txt" is not a system file. Press any key to continue when "%cd%\DiskPart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "BootloaderBIOS"

:"BootloaderErrorBIOS"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Error creating the bootloader! Disk %Disk% may be smaller than 64 GB! Press any key to try again.
pause > nul 2>&1
goto "BootloaderBIOS"

:"BootloaderUEFI"
if exist "%cd%\DiskPart.txt" goto "DiskPartExistBootloaderUEFI"
echo.
echo Creating bootloader.
BCDBoot "%NTFS%\Windows" /s "%FAT32%" /f UEFI > nul 2>&1
if not "%errorlevel%"=="0" goto "BootloaderErrorUEFI"
(echo sel vol %FAT32%) > "%cd%\DiskPart.txt"
(echo remove letter=%FAT32%) >> "%cd%\DiskPart.txt"
(echo exit) >> "%cd%\DiskPart.txt"
DiskPart /s "%cd%\DiskPart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "BootloaderErrorUEFI"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Bootloader created.
if /i "%Windows%"=="2" if /i "%DiskPart%"=="True" goto "DiskPartDone"
if /i "%Windows%"=="2" goto "SANPolicy"
goto "Recovery"

:"DiskPartExistBootloaderUEFI"
set DiskPart=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\DiskPart.txt" in order for this batch file to proceed. "%cd%\DiskPart.txt" is not a system file. Press any key to continue when "%cd%\DiskPart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "BootloaderUEFI"

:"BootloaderErrorUEFI"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Error creating the bootloader! Disk %Disk% may be smaller than 64 GB! Press any key to try again.
pause > nul 2>&1
goto "BootloaderUEFI"

:"BootloaderBoth"
if exist "%cd%\DiskPart.txt" goto "DiskPartExistBootloaderBoth"
echo.
echo Creating bootloader.
BCDBoot "%NTFS%\Windows" /s "%FAT32%" /f All > nul 2>&1
if not "%errorlevel%"=="0" goto "BootloaderErrorBoth"
(echo sel vol %FAT32%) > "%cd%\DiskPart.txt"
(echo remove letter=%FAT32%) >> "%cd%\DiskPart.txt"
(echo exit) >> "%cd%\DiskPart.txt"
DiskPart /s "%cd%\DiskPart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "BootloaderErrorBoth"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Bootloader created.
if /i "%Windows%"=="2" if /i "%DiskPart%"=="True" goto "DiskPartDone"
if /i "%Windows%"=="2" goto "SANPolicy"
goto "Recovery"

:"DiskPartExistBootloaderBoth"
set DiskPart=True
echo.
echo Please temporary rename to something else or temporary move to another location "%cd%\DiskPart.txt" in order for this batch file to proceed. "%cd%\DiskPart.txt" is not a system file. Press any key to continue when "%cd%\DiskPart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "BootloaderBoth"

:"BootloaderErrorBoth"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Error creating the bootloader! Disk %Disk% may be smaller than 64 GB! Press any key to try again.
pause > nul 2>&1
goto "BootloaderBoth"

:"SANPolicy"
echo.
echo Applying SAN policy.
(echo ^<?xml version="1.0" encoding="utf-8" standalone="yes"?^>) >> "%NTFS%\san_policy.xml"
(echo ^<unattend xmlns="urn:schemas-microsoft-com:unattend"^>) >> "%NTFS%\san_policy.xml"
(echo   ^<settings pass="offlineServicing"^>) >> "%NTFS%\san_policy.xml"
(echo     ^<component) >> "%NTFS%\san_policy.xml"
(echo         xmlns:wcm="https://schemas.microsoft.com/WMIConfig/2002/State") >> "%NTFS%\san_policy.xml"
(echo         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance") >> "%NTFS%\san_policy.xml"
(echo         language="neutral") >> "%NTFS%\san_policy.xml"
(echo         name="Microsoft-Windows-PartitionManager") >> "%NTFS%\san_policy.xml"
(echo         processorArchitecture="arm64") >> "%NTFS%\san_policy.xml"
(echo         publicKeyToken="31bf3856ad364e35") >> "%NTFS%\san_policy.xml"
(echo         versionScope="nonSxS") >> "%NTFS%\san_policy.xml"
(echo         ^>) >> "%NTFS%\san_policy.xml"
(echo       ^<SanPolicy^>4^</SanPolicy^>) >> "%NTFS%\san_policy.xml"
(echo     ^</component^>) >> "%NTFS%\san_policy.xml"
(echo     ^<component) >> "%NTFS%\san_policy.xml"
(echo         xmlns:wcm="https://schemas.microsoft.com/WMIConfig/2002/State") >> "%NTFS%\san_policy.xml"
(echo         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance") >> "%NTFS%\san_policy.xml"
(echo         language="neutral") >> "%NTFS%\san_policy.xml"
(echo         name="Microsoft-Windows-PartitionManager") >> "%NTFS%\san_policy.xml"
(echo         processorArchitecture="amd64") >> "%NTFS%\san_policy.xml"
(echo         publicKeyToken="31bf3856ad364e35") >> "%NTFS%\san_policy.xml"
(echo         versionScope="nonSxS") >> "%NTFS%\san_policy.xml"
(echo         ^>) >> "%NTFS%\san_policy.xml"
(echo       ^<SanPolicy^>4^</SanPolicy^>) >> "%NTFS%\san_policy.xml"
(echo     ^</component^>) >> "%NTFS%\san_policy.xml"
(echo     ^<component) >> "%NTFS%\san_policy.xml"
(echo         xmlns:wcm="https://schemas.microsoft.com/WMIConfig/2002/State") >> "%NTFS%\san_policy.xml"
(echo         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance") >> "%NTFS%\san_policy.xml"
(echo         language="neutral") >> "%NTFS%\san_policy.xml"
(echo         name="Microsoft-Windows-PartitionManager") >> "%NTFS%\san_policy.xml"
(echo         processorArchitecture="x86") >> "%NTFS%\san_policy.xml"
(echo         publicKeyToken="31bf3856ad364e35") >> "%NTFS%\san_policy.xml"
(echo         versionScope="nonSxS") >> "%NTFS%\san_policy.xml"
(echo         ^>) >> "%NTFS%\san_policy.xml"
(echo       ^<SanPolicy^>4^</SanPolicy^>) >> "%NTFS%\san_policy.xml"
(echo     ^</component^>) >> "%NTFS%\san_policy.xml"
(echo   ^</settings^>) >> "%NTFS%\san_policy.xml"
(echo ^</unattend^>) >> "%NTFS%\san_policy.xml"
DISM /Image:%NTFS% /Apply-Unattend:%NTFS%\san_policy.xml
if not "%errorlevel%"=="0" goto "SANError"
echo SAN policy applied.
goto "Unattended"

:"SANError"
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "SANPolicy"

:"Unattended"
echo.
echo Creating unattended.xml file in Sysprep folder.
(echo ^<?xml version="1.0" encoding="utf-8"?^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo ^<unattend xmlns="urn:schemas-microsoft-com:unattend"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo     ^<settings pass="oobeSystem"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^<component name="Microsoft-Windows-Shell-Setup" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="Arm64" xmlns:wcm="https://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo             ^<OOBE^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo                 ^<HideEULAPage^>true^</HideEULAPage^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo                 ^<ProtectYourPC^>1^</ProtectYourPC^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo                 ^<NetworkLocation^>Work^</NetworkLocation^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo             ^</OOBE^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^</component^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^<component name="Microsoft-Windows-International-Core" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="Arm64"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<InputLocale^>en-US^</InputLocale^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<SystemLocale^>en-US^</SystemLocale^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<UILanguage^>en-US^</UILanguage^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<UserLocale^>en-US^</UserLocale^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^</component^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^<component name="Microsoft-Windows-WinRE-RecoveryAgent" processorArchitecture="arm64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="https://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo             ^<UninstallWindowsRE^>true^</UninstallWindowsRE^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^</component^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^<component name="Microsoft-Windows-Shell-Setup" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="AMD64" xmlns:wcm="https://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo             ^<OOBE^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo                 ^<HideEULAPage^>true^</HideEULAPage^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo                 ^<ProtectYourPC^>1^</ProtectYourPC^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo                 ^<NetworkLocation^>Work^</NetworkLocation^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo             ^</OOBE^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^</component^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^<component name="Microsoft-Windows-International-Core" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="AMD64"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<InputLocale^>en-US^</InputLocale^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<SystemLocale^>en-US^</SystemLocale^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<UILanguage^>en-US^</UILanguage^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<UserLocale^>en-US^</UserLocale^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^</component^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^<component name="Microsoft-Windows-WinRE-RecoveryAgent" processorArchitecture="amd64" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="https://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo             ^<UninstallWindowsRE^>true^</UninstallWindowsRE^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^</component^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^<component name="Microsoft-Windows-Shell-Setup" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="X86" xmlns:wcm="https://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo             ^<OOBE^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo                 ^<HideEULAPage^>true^</HideEULAPage^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo                 ^<ProtectYourPC^>1^</ProtectYourPC^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo                 ^<NetworkLocation^>Work^</NetworkLocation^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo             ^</OOBE^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^</component^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^<component name="Microsoft-Windows-International-Core" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" processorArchitecture="x86"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<InputLocale^>en-US^</InputLocale^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<SystemLocale^>en-US^</SystemLocale^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<UILanguage^>en-US^</UILanguage^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo           ^<UserLocale^>en-US^</UserLocale^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^</component^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^<component name="Microsoft-Windows-WinRE-RecoveryAgent" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="https://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo             ^<UninstallWindowsRE^>true^</UninstallWindowsRE^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo         ^</component^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo     ^</settings^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
(echo ^</unattend^>) >> %NTFS%\Windows\System32\Sysprep\unattend.xml
echo unattended.xml file created in Sysprep folder.
if /i "%bootmgr%"=="Arm64" goto "DoneUEFI"
goto "DoneBoth"

:"Recovery"
echo.
echo Creating the recovery partition.
md "%Recovery%\Recovery\WindowsRE"
copy "%NTFS%\Windows\System32\Recovery\winre.wim" "%Recovery%\Recovery\WindowsRE\winre.wim" /y /v > nul 2>&1
reagentc /setreimage /path "%Recovery%\Recovery\WindowsRE" /target "%NTFS%\Windows" > nul 2>&1
if not "%errorlevel%"=="0" goto "RecoveryError"
(echo sel vol %Recovery%) > "%cd%\DiskPart.txt"
(echo remove letter=%Recovery%) >> "%cd%\DiskPart.txt"
(echo exit) >> "%cd%\DiskPart.txt"
DiskPart /s "%cd%\DiskPart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "RecoveryError"
del "%cd%\DiskPart.txt" /f /q > nul 2>&1
echo Recovery partition created.
if /i "%DiskPart%"=="True" goto "DiskPartDone"
if /i "%BIOSAsk%"=="1" goto "DoneBIOS"
if /i "%BIOSAsk%"=="2" goto "DoneUEFI"
if /i "%BIOSAsk%"=="3" goto "DoneBoth"

:"RecoveryError"
echo There has been an error! Press any key to try again!
pause > nul 2>&1
goto "Recovery"

:"DiskPartDone"
echo.
echo You can now rename or move back the file back to "%cd%\DiskPart.txt". Press any key to continue.
pause > nul 2>&1
if /i "%Windows%"=="2" goto "SANPolicy"
if /i "%BIOSAsk%"=="1" goto "DoneBIOS"
if /i "%BIOSAsk%"=="2" goto "DoneUEFI"
if /i "%BIOSAsk%"=="3" goto "DoneBoth"

:"DoneBIOS"
endlocal
echo.
echo Your Windows To Go is ready! It is bootable with Legacy BIOS only. Press any key to close this batch file.
pause > nul 2>&1
exit

:"DoneUEFI"
endlocal
echo.
echo Your Windows To Go is ready! It is bootable with UEFI only. Press any key to close this batch file.
pause > nul 2>&1
exit

:"DoneBoth"
endlocal
echo.
echo Your Windows To Go is ready! It is bootable with Legacy BIOS and UEFI. Press any key to close this batch file.
pause > nul 2>&1
exit
