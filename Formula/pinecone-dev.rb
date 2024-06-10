# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.41"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.41/pinecone_Darwin_all.tar.gz"
      sha256 "a7d40454b8f5c2ef76a6db32272cb05c3c5a7d72607b9f3ae91f0157f6690492"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.41/pinecone_Linux_x86_64.tar.gz"
      sha256 "49d58e358370fd5e6214a6ad4d972b5e5738c956c09dd3f550094e30df420be7"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.41/pinecone_Linux_arm64.tar.gz"
      sha256 "95e9b2e30bb337a45210034ea960b78abf99617e4f48de0563b145ecfe3f72e4"
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
  