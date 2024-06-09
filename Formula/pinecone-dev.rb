# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.34"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.34/pinecone_Darwin_all.tar.gz"
      sha256 "95d355f9a39ffd98cab6f13e0a95a01dee24efca9daa3f22906be47dace37502"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.34/pinecone_Linux_x86_64.tar.gz"
      sha256 "befc05ec67d3d715c51e6d96e0788dc911eeecc9ab79bd1ef8bae7ff04a6253a"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.34/pinecone_Linux_arm64.tar.gz"
      sha256 "fef242aeee768a78c257dafd8ff6719442500c5c5c4037e20ee91b6473a803d0"
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
  