if (NOT TARGET ext::foundation)
    message(STATUS "[extcpp] trying to find ext::foundation")
    message(STATUS "[extcpp] EXT_DOWNLOAD=${EXT_DOWNLOAD}")
    if(EXT_DOWNLOAD)
        message(STATUS "[extcpp] declaring download location for ext::foundation")
        include(FetchContent)
        FetchContent_Declare(
            ExtFoundation
            GIT_REPOSITORY https://github.com/extcpp/foundation.git
            GIT_TAG        master
            OVERRIDE_FIND_PACKAGE
        )
    endif()
    message(STATUS "[extcpp] find_package(ExtFoundation)")
    find_package(ExtFoundation REQUIRED)
    ext_log("found ext::foundation")

    # TODO add modules from ~/.local/lib/cmake or the location specified by ExtFoundation-config.cmake
    # include(define_ext_foundation_macros)
endif()
