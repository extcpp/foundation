message(STATUS "[extcpp] including ext::foundation cmake modules" )

# ext_logging
#
# contains:
# - ext_log
# - ext_fatal
# dependencies: none
include(ext_logging)

# ext_text
#
# contains:
# - ext_prefix
# dependencies: none
include(ext_text)

# ext_file
#
# contains:
# - ext_cat_file
# - ext_relpath
# dependencies: ext_logging
include(ext_file)

# ext_declare_dependencies
#
# declareis FetchContent dependencies
# IFF EXT_NO_DOWNLOAD is set to FALSE
# contains:
# - EXT_DECLARE_DEPENDENCIES
# dependencies: ext_logging
include(ext_declare_dependencies) # ext_logging

# ext_add_ext_modules
#
# dependencies: none
include(ext_add_ext_modules)

# ext_install
#
# contains:
# - ext_set_default_install_prefix
# - ext_install_lib
# - ext_install_files
# dependencies: ext_logging
include(ext_install)

# ext_colorize_output
#
# contains:
# - EXT_COLORIZE_OUTPUT
# dependencies: none
include(ext_colorize_output)

# ext_warnings
#
# contains:
# - EXT_DEFINE_WARNING_FLAGS
# dependencies: none
include(ext_warnings)

# ext_generate_version_hpp
#
# contains:
# - EXT_GENERATE_VERSION_HPP
# dependencies: ext_logging
include(ext_generate_version_hpp)

# ext_use_ext_project_defaults
#
# contains:
# - EXT_USE_EXT_PROJECT_DEFAULTS
# dependencies: ext_colorize_output, ext_warnings, ext_install
include(ext_use_ext_project_defaults)
