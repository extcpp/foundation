if(NOT EXT_DOWNLOAD)
    return()
endif()

ext_log("declaring FetchContent dependencies")
include(FetchContent)

# our libs
FetchContent_Declare(
    ext-basics
    GIT_REPOSITORY https://github.com/extcpp/basics
    GIT_TAG        master
    GIT_PROGRESS   TRUE
    OVERRIDE_FIND_PACKAGE
)

FetchContent_Declare(
    args
    GIT_REPOSITORY https://github.com/obiwahn/args
    GIT_TAG        master
    GIT_PROGRESS   TRUE
    OVERRIDE_FIND_PACKAGE
)

# ohter libs
FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG        58d77fa8070e8cec2dc1ed015d66b454c8d78850 # v1.12.1
    GIT_PROGRESS   TRUE
    OVERRIDE_FIND_PACKAGE
)

FetchContent_Declare(
    cryptopp
    GIT_REPOSITORY https://github.com/abdes/cryptopp-cmake
    GIT_TAG        13cb0fe7e76410258b76975e77fd407400e3f2d1
    GIT_PROGRESS   TRUE
    OVERRIDE_FIND_PACKAGE
)

FetchContent_Declare(
    cpp-subprocess
    GIT_REPOSITORY https://github.com/arun11299/cpp-subprocess
    GIT_TAG        1392c47cbbf519bd02ddafb5871526c16b7f2dd1
    GIT_PROGRESS   TRUE
    OVERRIDE_FIND_PACKAGE
)
