@echo off
"%~dp0bison.exe" --yacc %*
exit /b %ERRORLEVEL%
