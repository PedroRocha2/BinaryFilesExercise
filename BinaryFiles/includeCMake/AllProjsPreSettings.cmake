if (__AllProjsPresetings)
   return()
endif()
set(__AllProjsPresetings TRUE)

message(STATUS "AllProjsPresetings.cmake ...")
message(STATUS "")

###############################################################################

# Checking the preset of variables, fatal error when missing
message(STATUS "loading Macro 'AllProjsCheckPresetVars' ...")
macro(AllProjsCheckPresetVars lVarNames)
   message(STATUS "AllProjsCheckPresetVars ...")
   foreach(varName ${${lVarNames}})
      if (DEFINED ${varName})
         message(STATUS "${varName} defined as ${${varName}} ...")
      else()
         message(FATAL_ERROR "Error: ${varName} not defined")
      endif()
   endforeach()
endmacro()

# Clear option from cache, because new builds use to reuse cache options 
message(STATUS "loading Macro 'AllProjsClearPresetVars' ...")
macro(AllProjsClearPresetVars)
   message(STATUS "AllProjsClearPresetVars unseting from cache: ${lVarNamesToCheck}")
   foreach(varName ${lVarNamesToCheck})
      unset(${varName} CACHE)
   endforeach()
   message(STATUS "")
endmacro()

###############################################################################

message(STATUS "loading Macro 'gmAddCompileDefinition' ...")
macro(gmAddCompileDefinition strDefintion addInstallPresetings commentMsg)
   set(addMsg "added compile definition ${strDefintion}")
   if (NOT("${commentMsg}" STREQUAL ""))
      set(addMsg "${addMsg} (${commentMsg})")
   endif()
   message(STATUS ${addMsg})
   add_definitions(${strDefintion})
   if (${addInstallPresetings})
      list(APPEND lDefsInstallPresetings "DEF|${strDefintion}|CMSG|${commentMsg}")
   endif()
endmacro()

###############################################################################

set(lVarNamesToCheck 
   buildingPlatform              # set as 64Bits or 32Bits
   sourceCodeBaseFolder          # base path for this project source files (where is placed first level project CMakeLists.txt)
   ##############################
   # A typical cmake for adk must be like the example bellow:
   # cmake .. ^
   # -D buildingPlatform=32Bits ^
   # -D sourceCodeBaseFolder=C:/SourceFonts/Apps (inside of Apps must exit CMakeLists.txt first level)
)
AllProjsCheckPresetVars(lVarNamesToCheck)

#####################
# global definitions

message(STATUS "")
message(STATUS "Global definitions:")
message(STATUS "")

# Visual Studio generator specific: force Debug and Release configurarions only.
# Thus, removes the other configurations (ex: MinSizeRel, etc)
message(STATUS "Seting Debug and Release configurations ONLY")
set(CMAKE_CONFIGURATION_TYPES "Debug;Release")
set(CMAKE_CONFIGURATION_TYPES "${CMAKE_CONFIGURATION_TYPES}" CACHE STRING "Debug and Release configurations only" FORCE)

#message(STATUS "seting Statically link the runtime libraries (/MT)")
#add_compile_options(
#   $<$<CONFIG:>:/MT> #---------|
#   $<$<CONFIG:Debug>:/MTd> #---|-- Statically link the runtime libraries
#   $<$<CONFIG:Release>:/MT> #--|
#)
message(STATUS "Seting Multi-threaded DLL link the runtime libraries (/MD)")
add_compile_options(
   $<$<CONFIG:>:/MD> #---------|
   $<$<CONFIG:Debug>:/MDd> #---|-- Multi-threaded DLL link the runtime libraries
   $<$<CONFIG:Release>:/MD> #--|
)

#message(STATUS "Cmake is enabled to use tests")
#enable_testing()

message(STATUS "Cmake is enabled to 'USE_FOLDERS'")
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

message(STATUS "Cmake is set to use debug lib sufix 'd'")
set(CMAKE_DEBUG_POSTFIX d)

if (buildingPlatform STREQUAL "32Bits")
   set(BuildingPlatformIsX86 TRUE)
   set(BuildingPlatformIsX64 FALSE)
else()
   set(BuildingPlatformIsX86 FALSE)
   set(BuildingPlatformIsX64 TRUE)
endif()
message(STATUS "Platform settings 'BuildingPlatformIsX86'(${BuildingPlatformIsX86}), 'BuildingPlatformIsX64'(${BuildingPlatformIsX64})")

if (BuildingPlatformIsX86)
   set(CMAKE_GENERATOR_PLATFORM Win32)
else()
   set(CMAKE_GENERATOR_PLATFORM x64)
endif()

message(STATUS "")
set(strIdent "  ")
message(STATUS "set var 'strIdent' as '${strIdent}' (for adklib identation)")

message(STATUS "")
message(STATUS "AllProjsPresetings.cmake included!")
message(STATUS "")

