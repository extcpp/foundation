# -----------------------------------------------------------------------------
# ext_define_warning_flags
# -----------------------------------------------------------------------------
# Defines warning flags
# -----------------------------------------------------------------------------
macro(ext_define_warning_flags)
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        set(ext_basic-warnings       -Wall -Wextra -Wpedantic)
        set(ext_more-warnings        ${ext_basic-warnings} -Wcast-align -Wcast-qual -Wconversion)
        set(ext_stone-warnings       ${ext_more-warnings}  -Wctor-dtor-privacy)
        set(ext_stone-warnings       ${ext_stone-warnings} -Wdisabled-optimization -Wdouble-promotion)
        set(ext_stone-warnings       ${ext_stone-warnings} -Wfloat-equal -Wformat=2 -Winit-self -Winvalid-pch)
        set(ext_stone-warnings       ${ext_stone-warnings} -Wlogical-op -Wmissing-include-dirs)
        set(ext_stone-warnings       ${ext_stone-warnings} -Wnoexcept -Wold-style-cast -Woverloaded-virtual -Wredundant-decls)
        set(ext_stone-warnings       ${ext_stone-warnings} -Wshadow -Wsign-conversion -Wsign-promo)
        set(ext_stone-warnings       ${ext_stone-warnings} -Wstrict-null-sentinel -Wstrict-overflow=5)
        set(ext_stone-warnings       ${ext_stone-warnings} -Wtrampolines -Wunsafe-loop-optimizations)
        set(ext_stone-warnings       ${ext_stone-warnings} -Wvector-operation-performance)
        set(ext_stone-warnings       ${ext_stone-warnings} -Wzero-as-null-pointer-constant)
        set(ext_stone-warnings-extra ${ext_stone-warnings} -Wundef -Wmissing-declarations)
    elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        set(ext_basic-warnings       -Wall -Wextra -Wpedantic)
        set(ext_more-warnings        ${ext_basic-warnings} -Wcast-align -Wcast-qual -Wconversion)
        set(ext_stone-warnings       ${ext_more-warnings})
        set(ext_stone-warnings-extra ${ext_stone-warnings})
    else()
        message(STATUS "Flags for your compiler(${CMAKE_COMPILER_IS}) are not defined.")
        set(ext_basic-warnings       )
        set(ext_more-warnings        ${ext_basic-warnings})
        set(ext_stone-warnings       ${ext_more-warnings})
        set(ext_stone-warnings-extra ${ext_stone-warnings})
    endif()
endmacro(ext_define_warning_flags)
