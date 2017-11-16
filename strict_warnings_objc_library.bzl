"""Macros for building Objective-C libraries with strict warnings."""

# Warning flags to be used for all library and example code.
#
# Clang's warning reference: https://clang.llvm.org/docs/DiagnosticsReference.html
# General xcconfig docs: https://pewpewthespells.com/blog/xcconfig_guide.html
#
# * Our basic warnings cover most things and make warnings into errors.
# * If a warning is (transitively) enabled by our basic warnings, do not include it separately.
# * For warnings not enabled by our basic warnings, add them to the extra warnings.
# * To change a warning-as-error into just a warning, add it to the ignorable warnings using the
#   format `-Wno-error=<warning>`.
# * To disable a warning completely, add it to the disabled warnings using the format
#   `-Wno-<warning>`.
#
BASIC_WARNINGS = ["-Wall", "-Wextra", "-Werror"]
EXTRA_WARNINGS = [
    "-Wcast-align", "-Wconversion", "-Watomic-properties",
    "-Wmissing-prototypes", "-Wnewline-eof", "-Woverlength-strings",
    "-Wshadow", "-Wstrict-selector-match", "-Wundeclared-selector",
    "-Wunreachable-code", "-Wstrict-prototypes"
]
IGNORABLE_WARNINGS = [
    "-Wno-error=deprecated", "-Wno-error=deprecated-implementations"
]
DISABLED_WARNINGS = [
    "-Wno-partial-availability", "-Wno-sign-conversion", "-Wno-unused-parameter"
]
COMMON_COPTS = BASIC_WARNINGS + EXTRA_WARNINGS + IGNORABLE_WARNINGS + DISABLED_WARNINGS

def strict_warnings_objc_library(
    name,
    copts = [],
    **kwargs):
  """Declare an Objective-C library with strict warning flags."""
  native.objc_library(
      name = name,
      copts = copts + COMMON_COPTS,
      **kwargs)
