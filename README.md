# Bazel warnings for iOS libraries

Defines a bazel objc_library target with strict Objective-C warnings:
`strict_warnings_objc_library`.

Add the following to your `WORKSPACE`:

```
git_repository(
    name = "bazel_ios_warnings",
    remote = "https://github.com/material-foundation/bazel_ios_warnings.git",
    commit = "0ddbb3807eb70bcb00e0489bda16fc1cd9b75e0c",
)
```

In your `BUILD` file, use `strict_warnings_objc_library` just like you'd use `objc_library`:

```
load("@bazel_ios_warnings//:strict_warnings_objc_library.bzl", "strict_warnings_objc_library")

strict_warnings_objc_library(
)
```
