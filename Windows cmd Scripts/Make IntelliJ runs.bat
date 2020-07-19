:: Disable echoing commands onto the console
@ECHO off

:: Clear the screen
CLS

SET MyCMDAuthor=Jonathing
SET MyCMDVersion=0.4.0

:: Print script information
ECHO MCGradle Scripts (for Windows Command Prompt)
ECHO Version %MyCMDVersion%
ECHO Originally Written by Jonathing and Bailey
ECHO Maintained by %MyCMDAuthor%
ECHO.

:: Check for update
CD internal
CALL check_update.bat
CD ..

:: Go to root project directory
CD ..\..

:: Get Forge mod title
CALL "Scripts\Windows cmd Scripts\internal\get_title.bat"

:: Set the title of the Command Prompt console
IF defined PWSHPOLICY (title %MyProjectName%: IntelliJ IDEA Run Configurations) ELSE (title IntelliJ IDEA Run Configurations)

:: Generate the IntelliJ IDEA run configs
ECHO Generating the IntelliJ IDEA run configurations for %MyProjectName%...
ECHO.
CALL gradlew.bat genIntellijRuns --warning-mode none
ECHO.

ECHO Finished generating the IntelliJ IDEA run configurations for %MyProjectName%.

:: Return to scripts directory
CD "Scripts\Windows cmd Scripts"

:: END OF SCRIPT
PAUSE
EXIT /B 0