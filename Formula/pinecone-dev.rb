# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.42"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.42/pinecone_Darwin_all.tar.gz"
      sha256 "f667c31b6ce0779666c4245fac791985225e9c9dd6cc37d0d5f36c1240255213"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.42/pinecone_Linux_x86_64.tar.gz"
      sha256 "7a99b0b09c566e8a736fb4056fb0730c04b266471a1cc98dc64ec7926b0751a8"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.42/pinecone_Linux_arm64.tar.gz"
      sha256 "3dbb9fd7233a8f6e8e4830e1227f46e89be82b32b1050bf627ff81df3e0084da"
    else
      odie "Unsupported platform"
    end
  
    def install
      bin.install "pinecone"
  
      ## I thought we would need to remove this attribute, but it seems to be
      ## unnecessary because the curl downloads that occur underneath the hood
      ## do not set this attribute the same way browsers do. 
      ## I'll leave it here for now.
      # if OS.mac?
      #   system "xattr", "-d", "com.apple.quarantine", "#{bin}/pinecone"
      # end
    end
  
    test do
      system "#{bin}/pinecone", "--help"
    end
  end
  