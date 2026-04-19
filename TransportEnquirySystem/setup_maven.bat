@echo off
setx M2_HOME "C:\Program Files\Apache\maven"
setx PATH "%PATH%;%M2_HOME%\bin"
echo Maven environment variables have been set.
echo Please close and reopen your command prompt after running this script.
pause
