load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_rust",
    sha256 = "36ab8f9facae745c9c9c1b33d225623d976e78f2cc3f729b7973d8c20934ab95",
    urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.31.0/rules_rust-v0.31.0.tar.gz"],
)

load("@rules_rust//rust:repositories.bzl", "rules_rust_dependencies", "rust_register_toolchains")

rules_rust_dependencies()

rust_register_toolchains(
    edition = "2021",
    versions = ["1.74.0"],
)

load("@rules_rust//crate_universe:repositories.bzl", "crate_universe_dependencies")

crate_universe_dependencies()

load("@rules_rust//crate_universe:defs.bzl", "crate", "crates_repository")

crates_repository(
    name = "crate_index",
    annotations = {
        "protoc-gen-prost": [crate.annotation(
            gen_binaries = ["protoc-gen-prost"],
        )],
        "protoc-gen-tonic": [crate.annotation(
            gen_binaries = ["protoc-gen-tonic"],
        )],
    },
    cargo_lockfile = "//:Cargo.lock",
    lockfile = "//:cargo-bazel-lock.json",
    manifests = [
        "//:Cargo.toml",
    ],
    packages = {
        "prost": crate.spec(
            version = "0.12",
        ),
        "prost-types": crate.spec(
            version = "0.12",
        ),
        "protoc-gen-prost": crate.spec(
            version = "0.2.3",
        ),
        "protoc-gen-tonic": crate.spec(
            version = "0.3.0",
        ),
        "tonic": crate.spec(
            version = "0.3.1",
        ),
    },
    rust_version = "1.74.0",
)

load(
    "@crate_index//:defs.bzl",
    cargo_aliases_crate_repositories = "crate_repositories",
)

cargo_aliases_crate_repositories()

http_archive(
    name = "com_google_protobuf",
    sha256 = "616bb3536ac1fff3fb1a141450fa28b875e985712170ea7f1bfe5e5fc41e2cd8",
    strip_prefix = "protobuf-24.4",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/v24.4.tar.gz"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

http_archive(
    name = "rules_proto",
    sha256 = "903af49528dc37ad2adbb744b317da520f133bc1cbbecbdd2a6c546c9ead080b",
    strip_prefix = "rules_proto-6.0.0-rc0",
    url = "https://github.com/bazelbuild/rules_proto/releases/download/6.0.0-rc0/rules_proto-6.0.0-rc0.tar.gz",
)

# load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

# rules_proto_dependencies()
# rules_proto_toolchains()

load("@rules_rust//proto/prost:repositories.bzl", "rust_prost_dependencies")

rust_prost_dependencies()

load("@rules_rust//proto/prost:transitive_repositories.bzl", "rust_prost_transitive_repositories")

rust_prost_transitive_repositories()

register_toolchains("//toolchains:prost_toolchain")

load("@rules_rust//tools/rust_analyzer:deps.bzl", "rust_analyzer_dependencies")

rust_analyzer_dependencies()

load("//third-party:deps.bzl", third_party_deps = "deps")

third_party_deps()
