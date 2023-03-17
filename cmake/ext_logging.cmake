function(ext_log)
    message(STATUS "[extcpp] " ${ARGV})
endfunction(ext_log)

function(ext_fatal)
    message(FATAL_ERROR "[extcpp] " ${ARGV})
endfunction(ext_fatal)

#! prefix string with provided symbol(s) until is has given length
#
#  in_string - sting to be prefixed
#  length - desired length
#  fill - symbols(s) used for filling
#  out_string - this will hold the result
function(ext_prefix in_string length fill out_string)
    set(result "${in_string}")
    string(LENGTH "${in_string}" current_length)

    while(current_length LESS length)
        set(result "${fill}${result}")
        string(LENGTH "${result}" current_length)
    endwhile()

    set("${out_string}" "${result}" PARENT_SCOPE)
endfunction(ext_prefix)
