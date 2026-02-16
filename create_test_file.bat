@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem =========================================================
rem  Create Test File (.bin) on Desktop by size (MB)
rem  Uses PowerShell Int64 math + FileStream.SetLength()
rem =========================================================

title Create Test File (MB)
echo ===============================
echo   Create Test File (.bin) (MB)
echo ===============================
echo.

set "DESKTOP=%USERPROFILE%\Desktop"
set /p "SIZE_MB=Enter file size (MB): "

rem ---- Validate input: must be a positive integer ----
if not defined SIZE_MB (
  echo Invalid input.
  goto :end
)
for /f "delims=0123456789" %%A in ("%SIZE_MB%") do (
  echo Invalid input. Please enter digits only.
  goto :end
)
if "%SIZE_MB%"=="0" (
  echo Size must be greater than 0.
  goto :end
)

set "FILE_NAME=TestFile_%SIZE_MB%MB.bin"
set "FILE_PATH=%DESKTOP%\%FILE_NAME%"

echo.
echo Creating: "%FILE_NAME%"
echo Location: "%DESKTOP%"
echo Size: %SIZE_MB% MB

echo.
if exist "%FILE_PATH%" (
  choice /c YN /m "File already exists. Overwrite?"
  if errorlevel 2 (
    echo Canceled.
    goto :end
  )
)

rem ---- Create the file with the requested size (Int64) ----
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$mb = [int64]%SIZE_MB%;" ^
  "$bytes = $mb * 1MB;" ^
  "$path = '%FILE_PATH%';" ^
  "$fs = [System.IO.File]::Open($path,[System.IO.FileMode]::Create,[System.IO.FileAccess]::Write,[System.IO.FileShare]::None);" ^
  "$fs.SetLength($bytes);" ^
  "$fs.Close();" ^
  "Write-Host 'Done!'"

if errorlevel 1 (
  echo Failed to create the file.
  echo If your system blocks PowerShell scripts, try running this .bat as Administrator.
) else (
  echo Successfully created "%FILE_PATH%".
)

:end
echo.
pause
