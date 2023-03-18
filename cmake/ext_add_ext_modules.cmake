# -----------------------------------------------------------------------------
# ext_add_cmake_modules
# -----------------------------------------------------------------------------
# Add ext foundation CMake modules to CMAKE_MODULE_PATH.
# This can be used to make the find modules available
# -----------------------------------------------------------------------------
function(ext_add_ext_modules)
    get_target_property(EXT_FOUNDATION_SOURCE_DIR ext::foundation SOURCE_DIR)
    list(APPEND CMAKE_MODULE_PATH "${EXT_FOUNDATION_SOURCE_DIR}/cmake")
    set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} PARENT_SCOPE)
endfunction(ext_add_ext_modules)
