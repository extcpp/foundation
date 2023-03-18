# -----------------------------------------------------------------------------
# EXT_GENERATE_VERSION_HPP
# -----------------------------------------------------------------------------
# Runs a script that generates a version.hpp file that contains
# the git hash and branch.
# -----------------------------------------------------------------------------
macro(EXT_GENERATE_VERSION_HPP libname)
    if(EXT_WRITE_VERSION)
        ext_log("adding version for ${libname}")
        get_target_property(FOUNDATION_SOURCE_DIR ext::foundation SOURCE_DIR)
        add_custom_target(
            update_version_${libname} ALL
            COMMENT "create a version.hpp form git revision"
            WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}"
            COMMAND ${CMAKE_COMMAND}
                        -D "EXT_GIT_VERSION_OUT_FILE=${CMAKE_CURRENT_BINARY_DIR}/ext_version.hpp"
                        -P "${FOUNDATION_SOURCE_DIR}/cmake/script_generate_version_hpp.cmake"
        )
    endif()
endmacro(EXT_GENERATE_VERSION_HPP)
