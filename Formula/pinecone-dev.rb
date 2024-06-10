# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.37"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.37/pinecone_Darwin_all.tar.gz"
      sha256 "e852fb0362fb334b1b38ae4d12a8fbd09020eac063b8d36d7460f631eda78d56"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.37/pinecone_Linux_x86_64.tar.gz"
      sha256 "d20728f469bbe8abb4791c2ede0e0fcdb9fc5d3aeef465f12394dfcac076b6df"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.37/pinecone_Linux_arm64.tar.gz"
      sha256 "7531360aa2913e98c40cef1a7857e43f7f61f828416bab085d4fef73d33ba881"
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
  