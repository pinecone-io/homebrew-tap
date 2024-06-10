# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.39"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.39/pinecone_Darwin_all.tar.gz"
      sha256 "0ed5ef055fe94e2446ba240b0801240c6e3d69d69c4a787af95e9b07e3c4134b"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.39/pinecone_Linux_x86_64.tar.gz"
      sha256 "e99234e08318562af2f61f6d83f8b2169ef20fa61a85bfee19579d8a3476df73"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.39/pinecone_Linux_arm64.tar.gz"
      sha256 "fb6e61b6fa9bdd39f7b18d74728861a28147c299f5bda043f10218dfb0e17293"
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
  