@echo off
setlocal

if "%1"=="" (
    echo Usage: %~nx0 lexfile.l
    exit /b 1
)
echo.
echo PS C:\Manas Singh\A1\31\^> flex %1
echo PS C:\Manas Singh\A1\31\^> gcc lex.yy.c
echo PS C:\Manas Singh\A1\31\^> .\a.exe
flex %1
gcc lex.yy.c
a.exe
echo.
echo PS C:\Manas Singh\A1\31\^>
echo.

endlocal