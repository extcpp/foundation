ext_log("including colored output")
# -----------------------------------------------------------------------------
# EXT_COLORED_OUTPUT
# -----------------------------------------------------------------------------
# Enables colored output for clang and gcc if TRUE is passed as argument
# -----------------------------------------------------------------------------
macro(EXT_COLORED_OUTPUT use_color)
    if(NOT DEFINED EXT_COLORED_OUTPUT_ENABLED)
        set(EXT_COLORED_OUTPUT_ENABLED ${use_color} CACHE BOOL "Use colored compiler output.")
        if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
            add_compile_options (-fdiagnostics-color=always)
        elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
            add_compile_options (-fcolor-diagnostics)
        endif ()
    endif()
endmacro(EXT_COLORED_OUTPUT)
