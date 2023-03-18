# -----------------------------------------------------------------------------
# ext_set_default_install_prefix
# -----------------------------------------------------------------------------
# Change the default install location to home so that a normal use can do
# the install.
# -----------------------------------------------------------------------------
function(ext_set_default_install_prefix prefix)
    if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
        if(UNIX)
            set(CMAKE_INSTALL_PREFIX ${prefix} PARENT_SCOPE)
            ext_log("CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} (changed default)")
        else()
            # do not change the default for other operating systems
            ext_log("CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} (unchanged)")
        endif()
    else()
        ext_log("CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} (user provided)")
    endif()
    ext_log("installing to: ${CMAKE_INSTALL_PREFIX}")
endfunction(ext_set_default_install_prefix)

# -----------------------------------------------------------------------------
# ext_install_lib
# -----------------------------------------------------------------------------
# Execute `install()` serveral times to install a library.
# -----------------------------------------------------------------------------
function(ext_install_lib lib namespace config_name)
    ext_log("install library: ${lib}")

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
endfunction(ext_install_lib)

# -----------------------------------------------------------------------------
# ext_install_files
# -----------------------------------------------------------------------------
# Copy directories or files
# -----------------------------------------------------------------------------
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

