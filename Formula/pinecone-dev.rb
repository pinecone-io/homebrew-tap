# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.40"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.40/pinecone_Darwin_all.tar.gz"
      sha256 "59371e075b1d70729be0809f040fb5c3310a1320959a2c1ba8c04bc95ab0990b"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.40/pinecone_Linux_x86_64.tar.gz"
      sha256 "2db817220578a173c28e396b2e0b11e7c8396bb6bec1966fdacc957656822c2c"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.40/pinecone_Linux_arm64.tar.gz"
      sha256 "411ebf294fde8718e7816bb17eea3c71f50aca663aad240a80fda8dffd0b8135"
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
  