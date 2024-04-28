package glslang

VERSION_MAJOR  :: 14
VERSION_MINOR  :: 1
VERSION_PATCH  :: 0
VERSION_FLAVOR :: ""

version_greater_than :: proc(major, minor, patch: int) -> bool {
    return (VERSION_MAJOR > major || (VERSION_MAJOR == major &&
           (VERSION_MINOR > minor || (VERSION_MINOR == minor &&
           (VERSION_PATCH > patch)))))
}

version_greater_or_equal_to :: proc(major, minor, patch: int) -> bool {
    return (VERSION_MAJOR > major || (VERSION_MAJOR == major &&
           (VERSION_MINOR > minor || (VERSION_MINOR == minor &&
           (VERSION_PATCH >= patch)))))
}

version_less_than :: proc(major, minor, patch: int) -> bool {
    return (VERSION_MAJOR < major || (VERSION_MAJOR == major &&
           (VERSION_MINOR < minor || (VERSION_MINOR == minor &&
           (VERSION_PATCH < patch)))))
}

version_less_or_equal_to :: proc(major, minor, patch: int) -> bool {
    return (VERSION_MAJOR < major || (VERSION_MAJOR == major &&
           (VERSION_MINOR < minor || (VERSION_MINOR == minor &&
           (VERSION_PATCH <= patch)))))
}
