:: Requires ImageMagick be installed.

@echo off
setlocal EnableDelayedExpansion ::So we can actually increment count in the loop
set count=0 

set "inputDir=%~1"
set "backupDir=convertedFiles" 
::Catch rather than delete, just in case something goes wrong.

if not exist "%backupDir%" (
    mkdir "%backupDir%"
)

:: Loop through PNG and WEBP files - TODO: Make it recursive so I can be even lazier
for %%f in ("%inputDir%\*.png" "%inputDir%\*.webp") do (
    magick "%%f" "%inputDir%\%%~nf.jpg"
	set /a count+=1
)

@move "%inputDir%\*.png" "%backupDir%"
@move "%inputDir%\*.webp" "%backupDir%"

echo Converted !count! files
pause