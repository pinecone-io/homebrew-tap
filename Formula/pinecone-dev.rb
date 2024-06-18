# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.48"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.48/pinecone_Darwin_all.tar.gz"
      sha256 "bfe42f432bd24c936d25fbe882ed646da672b499a7fcc4d3cd454b305c3a8dcc"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.48/pinecone_Linux_x86_64.tar.gz"
      sha256 "ac71c51975d85a324b98bed34e0fb3a59cc6f821929f6ec1facd3aedbe14ca57"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.48/pinecone_Linux_arm64.tar.gz"
      sha256 "0e681a6ef7d5635aa488d3bf1042133cf8eedc5a9b6bd1b07d3c19c8777a0756"
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
  