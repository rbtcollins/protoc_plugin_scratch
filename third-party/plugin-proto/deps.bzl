load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def deps():
    http_file(
        name = "plugin_proto",
        sha256 = "c2921a11ae4e84214b268fbbe8ea37aaf6c1dc41a3c321b52f871f8dede4c03e",
        url = "https://github.com/protocolbuffers/protobuf/blob/a2f92689dac8a7dbea584919c7de52d6a28d66d1/src/google/protobuf/compiler/plugin.proto",
        downloaded_file_path = "plugin.proto",
    )
    git_repository(name = "com_google_protobuf", remote = "https://github.com/protocolbuffers/protobuf")
