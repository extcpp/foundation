# -----------------------------------------------------------------------------
# ext_cat_file
# -----------------------------------------------------------------------------
# Show content of file
# -----------------------------------------------------------------------------
function(ext_cat_file)
    if(UNIX)
        ext_log(" -- @@@ content of: " ${ARGV})
        execute_process(COMMAND /bin/cat ${ARGV})
        ext_log(" -- @@@ end content")
    endif()
endfunction(ext_cat_file)

# -----------------------------------------------------------------------------
# ext_relpath
# -----------------------------------------------------------------------------
# TODO
# -----------------------------------------------------------------------------
function(ext_relpath path base_path out_path)
    set(result "${path}")

    get_filename_component(path "${path}" ABSOLUTE)
    get_filename_component(base_path "${base_path}" ABSOLUTE)

    string(LENGTH "${path}" path_length)
    string(LENGTH "${base_path}" base_path_length)

    string(SUBSTRING "${path}" 0 ${base_path_length} prefix)

    if(prefix STREQUAL base_path)
        math(EXPR base_path_length "${base_path_length} + 1")
        string(SUBSTRING "${path}" ${base_path_length} -1 result)
    endif()

    set("${out_path}" "${result}" PARENT_SCOPE)
endfunction(ext_relpath)
