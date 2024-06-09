# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pinecone < Formula
  desc "Pinecone CLI"
  homepage "https://www.pinecone.io"
  version "0.0.25"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/pinecone-io/cli/releases/download/v0.0.25/pinecone_Darwin_all.tar.gz"
    sha256 "266df55702b9ae1ddc04aa2272ef38a28bf0a4a0396fbf1b64970f62b047b76c"

    def install
      bin.install "pinecone"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.25/pinecone_Linux_x86_64.tar.gz"
        sha256 "929d3b62316105dc61ae46e25fc8ea30ee8a4fd023aa06fc51c5e3248df805f3"

        def install
          bin.install "pinecone"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.25/pinecone_Linux_arm64.tar.gz"
        sha256 "2798ea6506191b5ca901388b3e8e73079fe82386999d75729fdae7527f5ae46a"

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
