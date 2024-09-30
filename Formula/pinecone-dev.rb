# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.52"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.52/pinecone_Darwin_all.tar.gz"
      sha256 "3753f3a3f80edce981d8b7ed86484c4dbf2a620e705b26e6753ec88f8251867c"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.52/pinecone_Linux_x86_64.tar.gz"
      sha256 "943c6d5210dd0f0e46428df9e4fe4c1b34bb75f15df8c84791c3286ced19da6b"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.52/pinecone_Linux_arm64.tar.gz"
      sha256 "2890b2cd2a204b3f7ff10174939fb4a63f0f8900a82847937270f197bc85af87"
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
  