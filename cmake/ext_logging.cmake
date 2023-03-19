# -----------------------------------------------------------------------------
# ext_log
# -----------------------------------------------------------------------------
# Log extcpp status message.
# -----------------------------------------------------------------------------
function(ext_log)
    message(STATUS "[extcpp] " ${ARGV})
endfunction(ext_log)

# -----------------------------------------------------------------------------
# ext_debug
# -----------------------------------------------------------------------------
# Log extcpp debug message.
# -----------------------------------------------------------------------------
function(ext_debug)
    if(EXT_DEBUG)
        message(STATUS "[extcpp] ## DEBUG ## " ${ARGV})
    endif()
endfunction(ext_debug)

# -----------------------------------------------------------------------------
# ext_fatal
# -----------------------------------------------------------------------------
# Log extcpp message and terminate cmake run.
# -----------------------------------------------------------------------------
function(ext_fatal)
    message(FATAL_ERROR "[extcpp] " ${ARGV})
endfunction(ext_fatal)
