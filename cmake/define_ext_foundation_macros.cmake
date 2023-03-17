message(STATUS "[extcpp] including ext::foundation cmake modules" )

include(ext_logging)

### declare FetchContent dependencies
### IFF EXT_NO_DOWNLOAD is set to FALSE
include(ext_declare_dependencies)

include(ext_colored_output)
include(ext_warnings)
include(ext_install)
include(ext_project_defaults)
include(ext_version)
