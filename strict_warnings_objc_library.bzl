"""Macros for building Objective-C libraries with strict warnings."""

# This list is derived from
# http://programmers.stackexchange.com/questions/122608/clang-warning-flags-for-objective-c-development
# with a few turned off because the warning code is widely present in Material
# Components and seems innocuous.
COMMON_COPTS = [
    "-Wall",  # Standard known-to-be-bugs warnings.
    "-Wcast-align",  # Casting a pointer such that alignment is broken.
    "-Wconversion",  # Numeric conversion warnings.
    "-Wdocumentation",  # Documentation checks.
    "-Werror",  # All warnings as errors.
    "-Wextra",  # Many useful extra warnings.
    "-Wdocumentation",  # Warn when documentation is out of date.
    "-Wimplicit-atomic-properties",  # Dynamic properties should be non-atomic.
    "-Wmissing-prototypes",  # Global function is defined without a previous prototype.
    "-Wno-error=deprecated",  # Deprecation warnings are never errors.
    "-Wno-error=deprecated-implementations",  # Deprecation warnings are never errors.
    "-Wno-partial-availability",
    "-Wno-sign-conversion",  # Do not warn on sign conversions.
    "-Wno-unused-parameter",  # Do not warn on unused parameters.
    "-Woverlength-strings",  # Strings longer than the C maximum.
    "-Wshadow",  # Local variable shadows another variable, parameter, etc.
    "-Wstrict-selector-match",  # Compiler can't figure out the right selector.
    "-Wstrict-prototypes",
    "-Wundeclared-selector",  # Compiler doesn't see a selector.
    "-Wunreachable-code",  # Code will never be reached.
    "-Wunused-comparison",
    "-Wunused-const-variable",
    "-Wunused-exception-parameter",
    "-Wunused-function",
    "-Wunused-label",
    "-Wunused-member-function",
    "-Wunused-private-field",
    "-Wunused-property-ivar",
    "-Wunused-result",
    "-Wunused-value",
    "-Wunused-variable",
    "-Wunused-volatile-lvalue",
    "-Wused-but-marked-unused",
    "-Wno-unused-parameter",  # Enabled by -Wall via -Wunused, problems with params used in asserts.
]

def strict_warnings_objc_library(
    name,
    copts = [],
    **kwargs):
  """Declare an Objective-C library with strict warning flags."""
  native.objc_library(
      name = name,
      copts = copts + COMMON_COPTS,
      **kwargs)
