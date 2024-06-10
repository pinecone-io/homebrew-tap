# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pinecone < Formula
  desc "Pinecone CLI"
  homepage "https://www.pinecone.io"
  version "0.0.40"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/pinecone-io/cli/releases/download/v0.0.40/pinecone_Darwin_all.tar.gz"
    sha256 "59371e075b1d70729be0809f040fb5c3310a1320959a2c1ba8c04bc95ab0990b"

    def install
      bin.install "pinecone"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.40/pinecone_Linux_x86_64.tar.gz"
        sha256 "2db817220578a173c28e396b2e0b11e7c8396bb6bec1966fdacc957656822c2c"

        def install
          bin.install "pinecone"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.40/pinecone_Linux_arm64.tar.gz"
        sha256 "411ebf294fde8718e7816bb17eea3c71f50aca663aad240a80fda8dffd0b8135"

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
