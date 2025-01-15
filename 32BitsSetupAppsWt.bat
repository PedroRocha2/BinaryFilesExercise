@cls
@setlocal
@set THIS_APP_BUILD=Estudo AppsWT (Setup 32Bits)
@echo bat^>^> This Bat file CMakes "%THIS_APP_BUILD%"
@echo ----- IMPORTANT!!!! Before your first CMake run, edit this file and adjust the variable values ...
@echo.

@if not exist AppsWt-build ( md AppsWt-build )

@echo bat^>^> Going to folder "AppsWt-build" (cd)
@cd AppsWt-build
@echo.

@REM Begin of redefine variables section (only touch inside this section)
@set VSCompiler="Visual Studio 15 2017"
@set buildingPlatform=32Bits
@set sourceCodeBaseFolder=R:/Estudo/WtLab/EstudoRicardo/AppsWt
@set thirdPartyFolder=R:/2018-ThirdParty
@set libBoostFolder=%ThirdPartyFolder%/libBoost-01-65-01_32Bits_VS-2017
@set libOpenSSLFolder=%ThirdPartyFolder%/libOpenSSL-01-01-01_VS2017/OpenSSLvs1.1.1-x86
@set libCadIOFolder=%ThirdPartyFolder%/libCadIO_VS-2017_Boost-01-65-01
@set libAccessPlugCommonFolder=%ThirdPartyFolder%/libAccessPlugCommon_VS-2017
@set libAudacesNestingFolder=%ThirdPartyFolder%/libAudacesNesting_VS-2017_Boost-01-65-01
@set libWindowsDependenciesFolder=%ThirdPartyFolder%/libWindowsDependencies
@set libGoogleTestFolder=%ThirdPartyFolder%/libGoogleTest_01-13-00_VS-2017
@set libDetectDebugFolder=%ThirdPartyFolder%/libDetectDebug_32Bits_VS-2017
@set libPlugServerFolder=%ThirdPartyFolder%/libAccessPlugServer_32Bits_VS-2017
@set libPythonFolder=%ThirdPartyFolder%/libPython_32Bits_VS-2017
@REM AppsWt specific libs
@set libMinizFolder=%ThirdPartyFolder%/libMiniz-02-01-00_VS2017
@set libADKFolder=%ThirdPartyFolder%/ADKLibs_VS-2017_Boost-01-65-01/x86
@set libWtFolder=%ThirdPartyFolder%/libWt-04-09-01_VS-2017_Boost-01-65-01_32Bits
@REM End redefine variables section

@echo bat^>^> cmake with the options:
@echo          VS Compiler                   : -G %VSCompiler%
@echo          Building Platform             : -D %buildingPlatform%
@echo          Source Code Base Folder       : -D %sourceCodeBaseFolder%
@echo          Lib Boost Folder              : -D %libBoostFolder%
@echo          Lib OpenSSL Folder            : -D %libOpenSSLFolder%
@echo          Lib CadIO Folder              : -D %libCadIOFolder%
@echo          Lib AccessPlugCommon Folder   : -D %libAccessPlugCommonFolder%
@echo          Lib AudacesNesting Folder     : -D %libAudacesNestingFolder%
@echo          Lib WindowsDependencies Folder: -D %libWindowsDependenciesFolder%
@echo          Lib GoogleTest Folder         : -D %libGoogleTestFolder%
@echo          Lib DetectDebug Folder        : -D %libDetectDebugFolder%
@echo          Lib PlugServer Folder         : -D %libPlugServerFolder%
@echo          Lib Python Folder             : -D %libPythonFolder%
@echo          Lib Miniz Folder              : -D %libMinizFolder%
@echo          Lib ADK Folder                : -D %libADKFolder%
@echo          Lib Wt Folder                 : -D %libWtFolder%
@echo.

@cmake ..\AppsWt ^
-G %VSCompiler% ^
-D buildingPlatform=%buildingPlatform% ^
-D sourceCodeBaseFolder=%sourceCodeBaseFolder% ^
-D libBoostFolder=%libBoostFolder% ^
-D libOpenSSLFolder=%libOpenSSLFolder% ^
-D libCadIOFolder=%libCadIOFolder% ^
-D libAccessPlugCommonFolder=%libAccessPlugCommonFolder% ^
-D libAudacesNestingFolder=%libAudacesNestingFolder% ^
-D libWindowsDependenciesFolder=%libWindowsDependenciesFolder% ^
-D libGoogleTestFolder=%libGoogleTestFolder% ^
-D libDetectDebugFolder=%libDetectDebugFolder% ^
-D libPlugServerFolder=%libPlugServerFolder% ^
-D libPythonFolder=%libPythonFolder% ^
-D libMinizFolder=%libMinizFolder% ^
-D libADKFolder=%libADKFolder% ^
-D libWtFolder=%libWtFolder%
@echo.

@echo bat^>^> Going back folder ".." (cd)
@cd ..
@echo.

@set AppsWt_last_build_info=AppsWt_last_build_info.txt

@echo bat^>^> Registering this build in file '%AppsWt_last_build_info%'

@echo %THIS_APP_BUILD% > %AppsWt_last_build_info%
@echo. >> %AppsWt_last_build_info%
@echo CMake builded at %date%, %time% >> %AppsWt_last_build_info%
@echo.

@echo bat^>^> CMake build done!!! "%THIS_APP_BUILD%"
@echo.