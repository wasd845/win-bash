REM

REM setting C++ environment


SETLOCAL
call "C:/Program Files/Microsoft Visual Studio/VC98/Bin/VCVARS32.BAT"


REM SET CFG=Win32 Release
REM SET CFG=Win32 Debug

del v01\bash-1.14.2\Bash\WinDebug\Bash.exe
cd v01\bash-1.14.2\Bash_builtins
nmake insure.mak

cd ..\Bash
nmake insure.mak

ENDLOCAL
