# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.43"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.43/pinecone_Darwin_all.tar.gz"
      sha256 "ac546ec4f92e241a4cc0d7702e3f33c4210180b8b4d96d7728672bf45febf37a"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.43/pinecone_Linux_x86_64.tar.gz"
      sha256 "a35f2eef41599d9a7a6e2c70e167c2f2b64fe0e75054c5f94bace658ab77999b"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.43/pinecone_Linux_arm64.tar.gz"
      sha256 "ced04836322bc0abe869f8ffa494671069552e95968f8a3278490356b739f6e3"
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
  