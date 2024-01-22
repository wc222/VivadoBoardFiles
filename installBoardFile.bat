REM 设置下载文件路径和解压缩目录
SET HTTP_PROXY=http://proxy.cse.cuhk.edu.hk:8000
SET HTTPS_PROXY=http://proxy.cse.cuhk.edu.hk:8000
SET DOWNLOAD_URL=https://github.com/Digilent/vivado-boards/archive/master.zip
SET DOWNLOAD_PATH=C:\temp
SET UNZIP_PATH=C:\temp\
 
REM 创建下载文件夹
IF NOT EXIST %DOWNLOAD_PATH% (
    mkdir %DOWNLOAD_PATH%
)
 
REM 下载文件
curl -L -o %DOWNLOAD_PATH%\master.zip %DOWNLOAD_URL%
 
REM 解压缩文件
IF EXIST %DOWNLOAD_PATH%\master.zip (
    PowerShell -Command "Expand-Archive -Path '%DOWNLOAD_PATH%\master.zip' -DestinationPath '%UNZIP_PATH%'"
)
 
REM 复制文件夹
xcopy /E /Y %UNZIP_PATH%\vivado-boards-master\new\board_files C:\Xilinx\Vivado\13.2\data\boards
 
REM 删除临时文件夹
IF EXIST %UNZIP_PATH% (
    rmdir /S /Q %UNZIP_PATH%
)
