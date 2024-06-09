# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.22"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.22/pinecone_Darwin_all.tar.gz"
      sha256 "0d5832a703ffe34927f187b1d05ed67a92dbc905f95c5a397f3c2d32dff9b561"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.22/pinecone_Linux_x86_64.tar.gz"
      sha256 "d27275a04f6bd18c2ddff59806f16c1d231e98c2244a2ac28a326555373faf1b"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.22/pinecone_Linux_arm64.tar.gz"
      sha256 "97f5e6ae902200ee8a2028e492b573b93c3a1a174f9730db5c8b125ebfde7cf4"
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
  