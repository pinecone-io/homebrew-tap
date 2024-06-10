# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pinecone < Formula
  desc "Pinecone CLI"
  homepage "https://www.pinecone.io"
  version "0.0.42"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/pinecone-io/cli/releases/download/v0.0.42/pinecone_Darwin_all.tar.gz"
    sha256 "f667c31b6ce0779666c4245fac791985225e9c9dd6cc37d0d5f36c1240255213"

    def install
      bin.install "pinecone"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.42/pinecone_Linux_x86_64.tar.gz"
        sha256 "7a99b0b09c566e8a736fb4056fb0730c04b266471a1cc98dc64ec7926b0751a8"

        def install
          bin.install "pinecone"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.42/pinecone_Linux_arm64.tar.gz"
        sha256 "3dbb9fd7233a8f6e8e4830e1227f46e89be82b32b1050bf627ff81df3e0084da"

        def install
          bin.install "pinecone"
        end
      end
    end
  end

  test do
    system "#{bin} --help"
  end
end
