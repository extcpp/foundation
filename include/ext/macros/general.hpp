// Copyright - 2020 - Jan Christoph Uhde <Jan@UhdeJC.com>
// Please see LICENSE.md for license or visit https://github.com/extcpp/basics
#ifndef EXT_MACROS_GENERAL_HEADER
#define EXT_MACROS_GENERAL_HEADER

#define EXT_NO_IMPL #error "NOT IMPLEMENTED NOW PLEASE FAIL HERE"
#define EXT_NOTHING(...)

#define EXT_DELETE(...)
#define EXT_EXPAND(...) __VA_ARGS__
#define EXT_STRINGIFY(a) #a

// use indirection (EXT_INTERNAL_CONCATENATE_IMPL) because ## inhibits expansion
#define EXT_INTERNAL_CONCATENATE_IMPL(s1, ...) s1##__VA_ARGS__
#define EXT_CONCATENATE(s1, ...) EXT_INTERNAL_CONCATENATE_IMPL(s1, __VA_ARGS__)

// __COUNTER__ provides increasing non negative number
#ifdef __COUNTER__
    #define EXT_ANONYMOUS_VARIABLE(str) EXT_CONCATENATE(str, __COUNTER__)
#else
    #define EXT_ANONYMOUS_VARIABLE EXT_NO_IMPL
#endif // __COUNTER__

#endif // EXT_MACROS_GENERAL_HEADER
