# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.24"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.24/pinecone_Darwin_all.tar.gz"
      sha256 "fd988683261d5f3129ed5b38e85826a39060ec325f0413cb7398a5f21e564024"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.24/pinecone_Linux_x86_64.tar.gz"
      sha256 "612df2d71e89899ffea57cdaad4383280301962199d75f15684f12408065ba71"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.24/pinecone_Linux_arm64.tar.gz"
      sha256 "851e3aaadd83b56159009dad43f937e30da6a25dc98f86d1d1a2d9460477236f"
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
  