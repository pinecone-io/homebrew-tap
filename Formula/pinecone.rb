# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pinecone < Formula
  desc "Pinecone CLI"
  homepage "https://www.pinecone.io"
  version "0.0.30"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/pinecone-io/cli/releases/download/v0.0.30/pinecone_Darwin_all.tar.gz"
    sha256 "3e5d027a5dbac3e9d92b92aef9b4552c27b85aefae3fe6e0899cacbfa9b3abc1"

    def install
      bin.install "pinecone"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.30/pinecone_Linux_x86_64.tar.gz"
        sha256 "cbabab25a715fad48e6532b83c0bf0cb265c62a6d3e29d0c508653130a7842a6"

        def install
          bin.install "pinecone"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.30/pinecone_Linux_arm64.tar.gz"
        sha256 "b54a5d5e83dd921f3fef4128af277f3fba01fc9650ff2ffd4786391016c6cb6b"

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
