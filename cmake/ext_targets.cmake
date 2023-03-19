function(ext_add_target target find_name)
    if (NOT TARGET ${target})
        foreach(item IN LISTS ARGN)
            if (NOT ( (item STREQUAL SYSTEM) OR (item STREQUAL OVERRIDE_FIND_PACKAGE) ) )
                find_package_args(APPEND item)
            endif()
        endforeach()

        # use find_package first
        find_package(${find_name} ${find_package_args})
        if (NOT TARGET ${target})
            #use FetchContent_MakeAvailable if target is still not defined and pass args
            FetchContent_MakeAvailable(${find_name} ${ARGN})
        endif()

        if (NOT TARGET ${target})
            ext_fatal("can not add target ${target}")
        endif()
    endif()
endfunction()
