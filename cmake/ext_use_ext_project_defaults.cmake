# -----------------------------------------------------------------------------
# EXT_USE_EXT_PROJECT_DEFAULTS
# -----------------------------------------------------------------------------
# Set some default options that I use frequently in my projects
# -----------------------------------------------------------------------------
macro(EXT_USE_EXT_PROJECT_DEFAULTS)
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
    set_property(GLOBAL PROPERTY USE_FOLDERS ON) # XCode / VS folders

    EXT_COLORIZE_OUTPUT()

    ext_define_warning_flags()
    ext_set_default_install_prefix("$ENV{HOME}/.local")
    set(CMAKE_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX} CACHE STRING "" FORCE)
endmacro(EXT_USE_EXT_PROJECT_DEFAULTS)
