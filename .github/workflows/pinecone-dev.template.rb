# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "##RELEASE_VERSION##"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/##RELEASE_VERSION##/pinecone_Darwin_all.tar.gz"
      sha256 "##MAC_SHA##"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/##RELEASE_VERSION##/pinecone_Linux_x86_64.tar.gz"
      sha256 "##LINUX_INTEL_SHA##"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/##RELEASE_VERSION##/pinecone_Linux_arm64.tar.gz"
      sha256 "##LINUX_ARM_SHA##"
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
  