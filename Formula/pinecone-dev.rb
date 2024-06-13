# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.45"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.45/pinecone_Darwin_all.tar.gz"
      sha256 "139919302a3369bf42fd13c703341d0ced103e3dd76aa6a04fcf116c193c4db7"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.45/pinecone_Linux_x86_64.tar.gz"
      sha256 "208f87ef32f3b8bde4c7ff19e335aacf766a390e5d8e2a57dc5d948501eb2e6f"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.45/pinecone_Linux_arm64.tar.gz"
      sha256 "4b7df4a02a794a721e16ec4a7db2adcea35d9146ea4bd271ab9f0d0a17b9f593"
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
  