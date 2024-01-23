REM set variables
SET https_proxy=proxy.cse.cuhk.edu.hk:8000
SET DOWNLOAD_URL=https://github.com/Digilent/vivado-boards/archive/master.zip
SET DOWNLOAD_PATH=C:\temp
SET UNZIP_PATH=C:\temp\
SET DEST_PATH=C:\Xilinx\Vivado\2023.2\data\boards\board_files
 
REM create folders
IF NOT EXIST %DOWNLOAD_PATH% (
    mkdir %DOWNLOAD_PATH%
)
IF NOT EXIST %DEST_PATH% (
    mkdir %DEST_PATH%
)
 
REM download board files
curl -Lk -o %DOWNLOAD_PATH%\master.zip %DOWNLOAD_URL%
 
REM unzip board files
IF EXIST %DOWNLOAD_PATH%\master.zip (
    PowerShell -Command "Expand-Archive -Path '%DOWNLOAD_PATH%\master.zip' -DestinationPath '%UNZIP_PATH%'"
)

REM copy board files into vivado
xcopy /E /Y %UNZIP_PATH%\vivado-boards-master\new\board_files %DEST_PATH%
 
REM remove temp files
IF EXIST %UNZIP_PATH% (
    rmdir /S /Q %UNZIP_PATH%
)

REM Success