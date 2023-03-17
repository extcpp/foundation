function(add_foundation_cmake_modules)
    get_target_property(EXT_FOUNDATION_SOURCE_DIR ext::foundation SOURCE_DIR)
    list(APPEND CMAKE_MODULE_PATH "${EXT_FOUNDATION_SOURCE_DIR}/cmake")
    set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} PARENT_SCOPE)
endfunction(add_foundation_cmake_modules)


macro(EXT_RUN_VERSION_SCRIPT libname)
    if(EXT_WRITE_VERSION)
        ext_log("adding version for ${libname}")
        get_target_property(FOUNDATION_SOURCE_DIR ext::foundation SOURCE_DIR)
        add_custom_target(
            update_version_${libname} ALL
            COMMENT "create a version.hpp form git revision"
            WORKING_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}"
            COMMAND ${CMAKE_COMMAND}
                        -D "EXT_GIT_VERSION_OUT_FILE=${CMAKE_CURRENT_BINARY_DIR}/ext_version.hpp"
                        -P "${FOUNDATION_SOURCE_DIR}/cmake/ext_script_git_version.cmake"
        )
    endif()
endmacro(EXT_RUN_VERSION_SCRIPT)
