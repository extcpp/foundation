# -----------------------------------------------------------------------------
# EXT_COLORIZE_OUTPUT
# -----------------------------------------------------------------------------
# Enables colorized compiler output for clang and gcc
# -----------------------------------------------------------------------------
macro(EXT_COLORIZE_OUTPUT)
    if(NOT DEFINED EXT_COLORIZE_OUTPUT_ENABLED)
        set(EXT_COLORIZE_OUTPUT_ENABLED TRUE CACHE BOOL "Use colored compiler output.")
        if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
            add_compile_options(-fdiagnostics-color=always)
        elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
            add_compile_options(-fcolor-diagnostics)
        endif ()
    endif()
endmacro(EXT_COLORIZE_OUTPUT)
