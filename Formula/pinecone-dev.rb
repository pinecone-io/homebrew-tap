# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.54"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.54/pinecone_Darwin_all.tar.gz"
      sha256 "e8d0b5df67452108b1b160a50a970f6e2cd3b64deb6a49539a0b35bb36dc9121"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.54/pinecone_Linux_x86_64.tar.gz"
      sha256 "39de6f2667bab6719fde168cdf15178462cdc4669b7ee0d2ad2bde0258bf0a75"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.54/pinecone_Linux_arm64.tar.gz"
      sha256 "c5158b6f39c26dc69a34c4192628aa7066543f599ce7cc3e4ef5867ae41ceb12"
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
  