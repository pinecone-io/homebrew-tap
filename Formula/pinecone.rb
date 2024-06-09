# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Pinecone < Formula
  desc "Pinecone CLI"
  homepage "https://www.pinecone.io"
  version "0.0.31"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/pinecone-io/cli/releases/download/v0.0.31/pinecone_Darwin_all.tar.gz"
    sha256 "8182a489819be42c603518182228f43a6942084fcbcd60e7668e297366f4643f"

    def install
      bin.install "pinecone"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.31/pinecone_Linux_x86_64.tar.gz"
        sha256 "3ce5db3c40261c2d57f278ff581562ba99b1a8e7e7cf7cc2d7c1dae6463ce1c8"

        def install
          bin.install "pinecone"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.31/pinecone_Linux_arm64.tar.gz"
        sha256 "70c4aec0b905486c1eba38756615fe3194c934c7db424bb6d444c1b4f6dd459b"

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
