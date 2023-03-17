# -----------------------------------------------------------------------------
# EXT_PROJECT_DEFAULTS
# -----------------------------------------------------------------------------
# TODO
# -----------------------------------------------------------------------------
macro(EXT_PROJECT_DEFAULTS)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    set_property(GLOBAL PROPERTY USE_FOLDERS ON) # XCode / VS folders
    EXT_COLORED_OUTPUT(ON)
    ext_define_warning_flags()

    EXT_DEFAULT_INSTALL_PREFIX()

endmacro(EXT_PROJECT_DEFAULTS)
