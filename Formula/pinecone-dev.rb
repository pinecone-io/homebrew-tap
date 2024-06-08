# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class PineconeDev < Formula
  desc ""
  homepage ""
  version "0.0.20"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/pinecone-io/cli/releases/download/v0.0.20/pinecone_Darwin_all.tar.gz"
    sha256 "04f1e306b2d05ac96065213af15beaeb3d36c93a2355bbd1fd9d80175559ab62"

    def install
      bin.install "pinecone"
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.20/pinecone_Linux_x86_64.tar.gz"
        sha256 "cb79b4163a3ae7c928006e06dd950fe179d43fe5ca0042b049b979f9576bd1b2"

        def install
          bin.install "pinecone"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/pinecone-io/cli/releases/download/v0.0.20/pinecone_Linux_arm64.tar.gz"
        sha256 "1c37d00ec25485197b609ac903a4dfa62fca8e5faeddf9d1b7b6ad00ec3f79c8"

        def install
          bin.install "pinecone"
        end
      end
    end
  end

  test do
    system "#{bin} --version"
  end
end
