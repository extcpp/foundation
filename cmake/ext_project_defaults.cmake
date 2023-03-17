# -----------------------------------------------------------------------------
# EXT_PROJECT_DEFAULTS
# -----------------------------------------------------------------------------
# TODO
# -----------------------------------------------------------------------------
macro(EXT_PROJECT_DEFAULTS)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    set_property(GLOBAL PROPERTY USE_FOLDERS ON) # XCode / VS folders
    ext_colored_compiler_ouput(ON)
    ext_define_warning_flags()

    EXT_DEFAULT_INSTALL_PREFIX()

endmacro(EXT_PROJECT_DEFAULTS)
