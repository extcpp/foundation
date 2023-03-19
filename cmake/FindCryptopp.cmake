if(TARGET cryptopp::cryptopp)
    return()
endif()


set(_CRYPTOPP_NO_DEFAULT_PATH OFF)
if(CRYPTOPP_PATH)
  set(_CRYPTOPP_NO_DEFAULT_PATH ON)
endif()

set(CRYPTOPP_NO_DEFAULT_PATH ${_CRYPTOPP_NO_DEFAULT_PATH}
    CACHE BOOL "Disable search CRYPTOPP Library in default path")
unset(_CRYPTOPP_NO_DEFAULT_PATH)

set(CRYPTOPP_NO_DEFAULT_PATH_CMD)
if(CRYPTOPP_NO_DEFAULT_PATH)
  set(CRYPTOPP_NO_DEFAULT_PATH_CMD NO_DEFAULT_PATH)
endif()


SET(_Cryptopp_LIBRARY_NAMES cryptopp cryptlib)

if(CRYPTOPP_USE_STATIC_LIBS)
    if(WIN32)
        SET(_Cryptopp_LIBRARY_NAMES cryptlib.lib cryptopp-static.lib)
    else()
        SET(_Cryptopp_LIBRARY_NAMES libcryptopp.a)
    endif()
endif()

#WINDOWS HACK
# There is probably no regular install, but a source
# directory which is containing the headers. Therefor
# parent path of the source directory takes the role
# of an include path in a regular setup.
set(CRYPTOPP_FIND_PATHS ${CRYPTOPP_PATH})
if(EXISTS ${CRYPTOPP_PATH})
    get_filename_component(parent ${CRYPTOPP_PATH} DIRECTORY)
    list(APPEND CRYPTOPP_FIND_PATHS "${parent}")
endif()
#WINDOWS HACK - END

# find include dir
find_path(CRYPTOPP_INCLUDE_DIR
    NAMES
        cryptopp/cryptlib.h
        crypto++/cryptlib.h
    ${CRYPTOPP_NO_DEFAULT_PATH_CMD}
    HINTS
        ENV CRYPTOPP_PATH
    PATHS
        ${CRYPTOPP_FIND_PATHS}
    DOC
        "Cryptopp include directory"
)

# find release lib
find_library(CRYPTOPP_LIBRARY
    NAMES
        ${_Cryptopp_LIBRARY_NAMES}
    PATH_SUFFIXES
        lib
    HINTS
        "${CRYPTOPP_INCLUDE_DIR}/.."
        ENV CRYPTOPP_PATH
    PATHS
        ${CRYPTOPP_FIND_PATHS}
    DOC
        "Cryptopp library Release"
)

#WINDOWS HACK
# find debug lib (mainly for windows)
find_library(CRYPTOPP_LIBRARY_DEBUG
    NAMES
        ${_Cryptopp_LIBRARY_NAMES}
    PATH_SUFFIXES
        debug/lib
    HINTS
        "${CRYPTOPP_INCLUDE_DIR}/.."
        ENV CRYPTOPP_PATH
    PATHS
        ${CRYPTOPP_FIND_PATHS}
    DOC
        "Cryptopp library Debug"
)
#WINDOWS HACK - END

if(CRYPTOPP_INCLUDE_DIR)
    #loop over candidates
    foreach( _file "cryptopp/config.h" "crypto++/config.h" "cryptopp/config_ver.h" "crypto++/config_ver.h")
        set(_path ${CRYPTOPP_INCLUDE_DIR}/${_file})

        if(EXISTS ${_path})
            file(STRINGS ${_path} _config_version REGEX "CRYPTOPP_VERSION")
        endif()

        if(_config_version)
            break()
        endif()
    endforeach()

    if(NOT _config_version)
        set(_config_version "#define CRYPTOPP_VERSION 000")
    endif()

    string(REGEX MATCH "([0-9])([0-9])([0-9])" _match_version ${_config_version})
    set(CRYPTOPP_VERSION_STRING "${CMAKE_MATCH_1}.${CMAKE_MATCH_2}.${CMAKE_MATCH_3}")
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Cryptopp
    REQUIRED_VARS
        CRYPTOPP_INCLUDE_DIR
        CRYPTOPP_LIBRARY
        CRYPTOPP_LIBRARY_DEBUG
    VERSION_VAR
        CRYPTOPP_VERSION_STRING
)

mark_as_advanced(
    CRYPTOPP_PATH
    CRYPTOPP_NO_DEFAULT_PATH
    CRYPTOPP_INCLUDE_DIR
    CRYPTOPP_LIBRARY
    CRYPTOPP_LIBRARY_DEBUG
    CRYPTOPP_VERSION_STRING
)

message(STATUS "found cryptopp libraries at: ${CRYPTOPP_LIBRARY} ${CRYPTOPP_LIBRARY_DEBUG}")

if(Cryptopp_FOUND)
    add_library(cryptopp::cryptopp UNKNOWN IMPORTED)
    set_target_properties(cryptopp::cryptopp PROPERTIES
        IMPORTED_LOCATION_RELEASE          "${CRYPTOPP_LIBRARY}"
        IMPORTED_LOCATION_DEBUG            "${CRYPTOPP_LIBRARY_DEBUG}"
        MAP_IMPORTED_CONFIG_MINSIZEREL     Release
        MAP_IMPORTED_CONFIG_RELWITHDEBINFO Release
        INTERFACE_INCLUDE_DIRECTORIES      "${CRYPTOPP_INCLUDE_DIR}"
    )

    set(Cryptopp_INCLUDE_DIRS ${CRYPTOPP_INCLUDE_DIR})
    set(Cryptopp_LIBRARIES ${CRYPTOPP_LIBRARY})
endif()
