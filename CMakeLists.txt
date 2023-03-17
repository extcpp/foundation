# Copyright - Jan Christoph Uhde <Jan@UhdeJC.com>
cmake_minimum_required(VERSION 3.21)
project(ext-foundation VERSION 0.0.1 LANGUAGES CXX)
message(STATUS "[extcpp] entering ext::foundation")

# You have to actively pass -DEXT_NO_DOWNLOAD=FALSE to
# enable the automatic download of dependencies
option(EXT_DOWNLOAD "allow downloading of dependencies")
option(EXT_WRITE_VERSION "write git-revision into header")

# include cmake functions and macros
# NOTE: no functions are actually called
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

include(ext_logging)
### declare FetchContent dependencies
### IFF EXT_NO_DOWNLOAD is set to FALSE
include(ext_declare_dependencies)
include(ext_colored_output)
include(ext_warnings)
include(ext_install)
include(ext_project_defaults)
include(ext_version)

## gather system information
include (TestBigEndian)
TEST_BIG_ENDIAN(ext_is_big_endian)

set(EXT_CXX_COMPILER_IS_GCC FALSE)
set(EXT_CXX_COMPILER_IS_CLANG FALSE)
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(EXT_CXX_COMPILER_IS_GCC TRUE)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(EXT_CXX_COMPILER_IS_CLANG TRUE)
endif()

# verbose windows linking
#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /VERBOSE:LIB")

set(LINUX FALSE)
if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")
    set(LINUX TRUE)
endif()

if(LINUX)
    execute_process(COMMAND getconf LEVEL1_DCACHE_LINESIZE OUTPUT_VARIABLE ext_l1_cache_line_size)
    string(STRIP ${ext_l1_cache_line_size} ext_l1_cache_line_size)
    ext_log("cache line size: '${ext_l1_cache_line_size}'")
    set(EXT_OUTDIR "")
elseif(MSVC)
    set(ext_l1_cache_line_size FALSE)
    ext_log("cache line size: provided by os")
    set(EXT_OUTDIR "${PROJECT_BINARY_DIR}/build")
    ext_log("binary ouput dir: ${EXT_OUTDIR}")

    #TODO - move settings below into corresponding targets
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${EXT_OUTDIR}")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${EXT_OUTDIR}")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${EXT_OUTDIR}")
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS TRUE)
elseif(APPLE)
    set(ext_l1_cache_line_size "64")
    ext_log("cache line size: '${ext_l1_cache_line_size}'")
else()
    set(ext_l1_cache_line_size FALSE)
endif()

### compile definitions
set(ext_common_compile_definitions
    $<IF:$<BOOL:${ext_is_big_endian}>,EXT_BIG_ENDIAN,EXT_LITTLE_ENDIAN>
    $<$<BOOL:${EXT_CXX_COMPILER_IS_GCC}>:EXT_GCC>
    $<$<BOOL:${EXT_CXX_COMPILER_IS_CLANG}>:EXT_CLANG>
    $<$<BOOL:${LIBEXT_CHECKED}>:EXT_CHECKED=1>
    $<$<BOOL:${LIBEXT_TESTS_NO_TIME_CRITICAL}>:EXT_TESTS_NO_TIME_CRITICAL=1>
    $<$<BOOL:${EXT_DEFER_NON_NOTHROW}>:EXT_DEFER_ALLOW_NON_NOTHROW_INVOCABLE=1>
    $<$<BOOL:${EXT_DEFER_MOVE_ASSIGN}>:EXT_DEFER_ENABLE_MOVE_ASSIGN=1>
    $<$<BOOL:${ext_l1_cache_line_size}>:EXT_KNOWN_L1_CACHE_LINE_SIZE=${ext_l1_cache_line_size}>
)

### library definition
include(include_files.cmake)
add_library(ext-foundation INTERFACE)
target_include_directories(ext-foundation INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
)

target_compile_options(ext-foundation INTERFACE
    $<$<AND:$<CONFIG:Debug>,$<BOOL:LIBEXT_WARNINGS>>:${ext_stone-warnings}>
)

target_compile_definitions(ext-foundation INTERFACE
    ${ext_common_compile_definitions}
    EXT_BASICS_HEADER_ONLY_LIB
)

# set up folder structure for XCode and VisualStudio
#set_target_properties (ext-foundation PROPERTIES FOLDER libext) #not for interface libraries
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${ext-foundation-header} ${ext-foundation-source})
add_library(ext::foundation ALIAS ext-foundation)

# install to ~/.local/ instead of /usr/local as default
EXT_DEFAULT_INSTALL_PREFIX()

## installation
if(COMMAND EXT_INSTALL)
    set_target_properties(ext-foundation PROPERTIES EXPORT_NAME foundation)
    #           lib            namespace  config-name   extra-dirs
    EXT_INSTALL(ext-foundation "ext::"    ExtFoundation include/ext cmake)
endif()

EXT_RUN_VERSION_SCRIPT(foundation)
