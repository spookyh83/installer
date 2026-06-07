@ECHO OFF

SHSUCDX /D:MSCD001

FOR %%D IN (D E F G H I J K L M N O P Q R S T) DO (
  IF EXIST %%D:\MYDISTRO.TAG SET CDROM=%%D:
)

%CDROM%

LOADLIN %CDROM%\boot\vmlinuz \
 root=/dev/ram0 rw \
 init=/init
