# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.30"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.30/pinecone_Darwin_all.tar.gz"
      sha256 "3e5d027a5dbac3e9d92b92aef9b4552c27b85aefae3fe6e0899cacbfa9b3abc1"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.30/pinecone_Linux_x86_64.tar.gz"
      sha256 "cbabab25a715fad48e6532b83c0bf0cb265c62a6d3e29d0c508653130a7842a6"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.30/pinecone_Linux_arm64.tar.gz"
      sha256 "b54a5d5e83dd921f3fef4128af277f3fba01fc9650ff2ffd4786391016c6cb6b"
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
  