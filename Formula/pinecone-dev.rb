# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.47"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.47/pinecone_Darwin_all.tar.gz"
      sha256 "0cd89a24c3059bc3bc33f9664709bc333b11f2b6ae0350c81bf90a81334f76ae"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.47/pinecone_Linux_x86_64.tar.gz"
      sha256 "9e6ae221eb3c90ee843445d68d18cbe5e64bc3c3ab4d69289026a6eadf76094e"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.47/pinecone_Linux_arm64.tar.gz"
      sha256 "c2b7c1f1d62a71849c9e708866c3993aa3b617dca021d5cc3d56f2ad2b31a66e"
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
  