@echo off
setlocal

if "%1"=="" (
    echo Usage: %~nx0 lexfile.l
    exit /b 1
)
echo.
echo PS C:\Manas Singh\A1\37\^> flex %1
echo PS C:\Manas Singh\A1\37\^> gcc lex.yy.c
echo PS C:\Manas Singh\A1\37\^> .\a.exe
flex %1
gcc lex.yy.c
a.exe
echo.
echo PS C:\Manas Singh\A1\37\^>
echo.

endlocal