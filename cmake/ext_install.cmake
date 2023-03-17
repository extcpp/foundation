# -----------------------------------------------------------------------------
# EXT_DEFAULT_INSTALL_PREFIX
# -----------------------------------------------------------------------------
# Change the default install location to home so that a normal use can do
# the install
# -----------------------------------------------------------------------------
macro(EXT_DEFAULT_INSTALL_PREFIX)
    if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
        ext_log("install location defaulted")
        if(UNIX)
            set(CMAKE_INSTALL_PREFIX  "$ENV{HOME}/.local")
        else()
            # do not change the default for other operating systems
        endif()
    else()
        ext_log("install location manually provided")
    endif()
    ext_log("installing to: ${CMAKE_INSTALL_PREFIX}")
endmacro(EXT_DEFAULT_INSTALL_PREFIX)

macro(EXT_INSTALL lib namespace config_name)
    ext_log("prepare install for: ${lib}")

    install(
        TARGETS "${lib}"
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
    )

    install(
        TARGETS    "${lib}"
        EXPORT      "${lib}-targets"
        DESTINATION ${CMAKE_INSTALL_PREFIX}
    )

    install(
        EXPORT      "${lib}-targets"
        FILE        "${config_name}-config.cmake"
        NAMESPACE   "${namespace}"
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/cmake
    )

    foreach(arg ${ARGN})
        install(
            DIRECTORY   "${arg}"
            DESTINATION include
        )
    endforeach()
endmacro(EXT_INSTALL)

function(ext_install_files from_dir to_dir files)
    foreach (file ${files})
        get_filename_component(parent ${file} DIRECTORY)
        if(IS_DIRECTORY ${from_dir}/${file})
            ext_log("install dir ${from_dir}/${file} to ${to_dir}/${parent}")
            install(
                DIRECTORY
                    ${from_dir}/${file}
                DESTINATION
                    ${to_dir}/${parent}
              )
        else()
            ext_log("install file ${from_dir}/${file} to ${to_dir}/${parent}")
            install(
                FILES
                    ${from_dir}/${file}
                DESTINATION
                    ${to_dir}/${parent}
            )
        endif()
    endforeach()
endfunction(ext_install_files)

