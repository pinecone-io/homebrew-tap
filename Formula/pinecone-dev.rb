# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.44"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.44/pinecone_Darwin_all.tar.gz"
      sha256 "cf25ac097bf8673e125f0a9daf8dd540e5274d725846c78dbb96dccf5a6828ff"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.44/pinecone_Linux_x86_64.tar.gz"
      sha256 "36dcd7c9f1671d8dd4203a282cf9bb2e82fe99122daa6b74d73f79f8118b8d09"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.44/pinecone_Linux_arm64.tar.gz"
      sha256 "c788d38c3a332c438c5d0ddcce271abc4843e5545c6215865ccb59c71c159f11"
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
  