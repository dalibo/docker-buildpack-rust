#!/bin/sh
#

rustup self update

rustup component add clippy llvm-tools-preview

cargo install --locked \
  artifactx@0.3.7 \
  grcov@0.10.7 \
  cargo-audit@0.22.2 \
  cargo-deny@0.20.2 \
  cargo-cyclonedx@0.5.10 \
  cargo-pgrx@0.19.3 \
  uv@0.13.7
