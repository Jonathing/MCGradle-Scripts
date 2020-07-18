:: Disable echoing commands onto the console
@echo off

set MyCMDAuthor=Jonathing
set MyCMDVersion=0.3.2

:: Print script information
echo MCGradle Scripts (for Windows Command Prompt)
echo Version %MyCMDVersion%
echo Originally Written by Jonathing and Bailey
echo Maintained by %MyCMDAuthor%
echo.

:: Check for update
cd internal
call check_update.bat
cd ..

cd ..\..

call "Scripts\Windows cmd Scripts\internal\get_title.bat"

:: Set the title of the Command Prompt console
IF defined PWSHPOLICY (title %MyProjectName%: Eclipse Run Configurations) ELSE (title Eclipse Run Configurations)

:: Generate the Eclipse run configs
echo Generating the Eclipse run configurations for %MyProjectName%...
echo.
call gradlew.bat genEclipseRuns --warning-mode none
echo.

echo Finished generating the Eclipse run configurations for %MyProjectName%.

cd "Scripts\Windows cmd Scripts"
pause
exit /B 0
