# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.50"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.50/pinecone_Darwin_all.tar.gz"
      sha256 "702f688989c44f9505a8bb009e866473cc3a54cd94c42da3d4ad27ce1c9db8e2"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.50/pinecone_Linux_x86_64.tar.gz"
      sha256 "41f908a94e7b9ac08fe936ce4b155977e50bddb2ad2a72119f0e6eaa2e4482ab"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.50/pinecone_Linux_arm64.tar.gz"
      sha256 "bca78cc1707d7ae36b049c835e0d05bb2edac32cc99b2746151eb7b4178532fe"
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
  