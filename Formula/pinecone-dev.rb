# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.31"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.31/pinecone_Darwin_all.tar.gz"
      sha256 "8182a489819be42c603518182228f43a6942084fcbcd60e7668e297366f4643f"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.31/pinecone_Linux_x86_64.tar.gz"
      sha256 "3ce5db3c40261c2d57f278ff581562ba99b1a8e7e7cf7cc2d7c1dae6463ce1c8"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.31/pinecone_Linux_arm64.tar.gz"
      sha256 "70c4aec0b905486c1eba38756615fe3194c934c7db424bb6d444c1b4f6dd459b"
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
  