@echo off
setlocal

if "%1"=="" (
    echo Usage: %~nx0 lexfile.l
    exit /b 1
)
echo.
echo PS C:\AbhayBisht\B1\1\^> flex %1
echo PS C:\AbhayBisht\B1\1\^> gcc lex.yy.c
echo PS C:\AbhayBisht\B1\1\^> .\a.exe
flex %1
gcc lex.yy.c
a.exe
echo.
echo PS C:\AbhayBisht\B1\1\^>
echo.

endlocal