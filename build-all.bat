cls
@echo off
REM ----------------------------------------------------------------
REM BUILD-ALL.BAT - Build SCOPY for CP/M 2.2
REM
REM   SCOPY.COM - Smart Copy utility
REM
REM Requires: cpmulator.exe, M80.COM, L80.COM, Python (CPMFMT.PY)
REM ----------------------------------------------------------------

echo === SCOPY Build ===

echo Cleanup...
if exist SCOPY.COM del SCOPY.COM 2>nul
if exist *.REL     del *.REL     2>nul

echo Formatting source...
python CPMFMT.PY SCOPY.MAC
if errorlevel 1 goto fail

echo Assembling...
cpmulator M80.COM =SCOPY
echo SCOPY
pause
if errorlevel 1 goto fail

echo Linking...
cpmulator L80.COM SCOPY,SCOPY/N/E
if errorlevel 1 goto fail

echo.
echo === Build complete ===
echo   SCOPY.COM - Smart Copy for CP/M 2.2
goto end

:fail
echo === BUILD FAILED ===
exit /b 1

:end
