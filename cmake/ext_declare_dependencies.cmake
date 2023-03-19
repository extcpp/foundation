# -----------------------------------------------------------------------------
# EXT_DECLARE_DEPENDENCIES
# -----------------------------------------------------------------------------
# Declares some libraries for the usage with the FetchContent module.
# IMPORTANT: Libraries are only declared IFF EXT_DOWNLOAD is set to ON.
# -----------------------------------------------------------------------------
macro(EXT_DECLARE_DEPENDENCIES)
    ext_debug("enter EXT_DECLARE_DEPENDENCIES - EXT_DOWNLOAD: ${EXT_DOWNLOAD}")
    include(FetchContent)
    if(EXT_DOWNLOAD)
        ext_log("declaring FetchContent dependencies")
        # our libs
        FetchContent_Declare(
            ExtBasics
            GIT_REPOSITORY https://github.com/extcpp/basics.git
            GIT_TAG        master
            GIT_PROGRESS   TRUE
            OVERRIDE_FIND_PACKAGE
        )

        FetchContent_Declare(
            Args
            GIT_REPOSITORY https://github.com/obiwahn/args.git
            GIT_TAG        master
            GIT_PROGRESS   TRUE
            OVERRIDE_FIND_PACKAGE
        )

        # ohter well known libs
        FetchContent_Declare(
            GTest
            GIT_REPOSITORY https://github.com/google/googletest.git
            GIT_TAG        58d77fa8070e8cec2dc1ed015d66b454c8d78850 # v1.12.1
            GIT_PROGRESS   TRUE
            OVERRIDE_FIND_PACKAGE
        )

        FetchContent_Declare(
            Abseil
            GIT_REPOSITORY https://github.com/abseil/abseil-cpp.git  #20230125.1
            GIT_TAG        c8a2f92586fe9b4e1aff049108f5db8064924d8e
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

        # FetchContent_Declare(
        #     Glog
        #     GIT_REPOSITORY https://github.com/google/glog.git # v0.6.0
        #     GIT_TAG        b33e3bad4c46c8a6345525fd822af355e5ef9446
        #     GIT_PROGRESS   TRUE
        #     OVERRIDE_FIND_PACKAGE
        # )

        # FetchContent_Declare(
        #     Folly #required glog
        #     GIT_REPOSITORY https://github.com/facebook/folly.git #v2023.03.13.00
        #     GIT_TAG        ce2b95715de229fcb51bd97410469a3ad4d2bfb2
        #     GIT_PROGRESS   TRUE
        #     OVERRIDE_FIND_PACKAGE
        # )
    endif(EXT_DOWNLOAD)
endmacro(EXT_DECLARE_DEPENDENCIES)
