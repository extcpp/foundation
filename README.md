# ext::foundation

This library provides the foundation for all other ext libs.

It contains some CMake macros and functions and a few C++ headers.

The CMake code allows to gather information about the system. This
information is passed via compile definitions to the compiler. Which
in turn allows the headers to behave according to the system.

There can be more functionality be found in the CMake modules, but
almost none is used by default.

The following macros are used (macros upper-case / functions lower-case):

- `ext_log` -- log info with `[extcpp]` prefix
- `EXT_DEFAULT_INSTALL_PREFIX` -- set the default install location on
   Linux is changed to `~/.local/`
- `EXT_INSTALL` -- reduces the amount of code to install a lib
