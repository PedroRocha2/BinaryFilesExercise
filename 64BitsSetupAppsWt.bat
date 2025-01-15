@cls
@setlocal
@set THIS_APP_BUILD=BinaryFiles(Setup 64Bits)
@set PROJECT_NAME=BinaryFiles
@echo bat^>^> This Bat file CMakes "%THIS_APP_BUILD%"
@echo ----- IMPORTANT!!!! Before your first CMake run, edit this file and adjust the variable values ...
@echo.

@if not exist %PROJECT_NAME%-build ( md %PROJECT_NAME%-build )

@echo bat^>^> Going to folder "BinaryFiles-build" (cd)
@cd %PROJECT_NAME%-build
@echo.

@REM Begin of redefine variables section (only touch inside this section)
@set VSCompiler="Visual Studio 17 2022"
@set buildingPlatform=64Bits
@set sourceCodeBaseFolder=C:\User\Pedro\Projects\BinaryFiles


@echo bat^>^> cmake with the options:
@echo          VS Compiler                   : -G %VSCompiler%
@echo          Building Platform             : -D %buildingPlatform%
@echo          Source Code Base Folder       : -D %sourceCodeBaseFolder%
@echo.

@cmake ..\%PROJECT_NAME% ^
-G %VSCompiler% ^
-D buildingPlatform=%buildingPlatform% ^
-D sourceCodeBaseFolder=%sourceCodeBaseFolder% 
@echo.

@echo bat^>^> Going back folder ".." (cd)
@cd ..
@echo.

@set %PROJECT_NAME%_last_build_info=%PROJECT_NAME%_last_build_info.txt
@set TEMP_NAME=%PROJECT_NAME%_last_build_info

@echo bat^>^> Registering this build in file '%TEMP_NAME%'

@echo %THIS_APP_BUILD% > %TEMP_NAME%
@echo. >> %TEMP_NAME%
@echo CMake builded at %date%, %time% >> %TEMP_NAME%
@echo.

@echo bat^>^> CMake build done!!! "%THIS_APP_BUILD%"
@echo.
@pause
