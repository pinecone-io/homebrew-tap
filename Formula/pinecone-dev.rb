# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.53"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.53/pinecone_Darwin_all.tar.gz"
      sha256 "fc33b8bf6f40945b01f5fedb8d83253d4e83ffd197e642a8a3975766ae1f58d0"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.53/pinecone_Linux_x86_64.tar.gz"
      sha256 "9c32d4ba6cdab7744c19b7f882f30f4980f4f8cc9aac51abf36d7827c29f894e"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.53/pinecone_Linux_arm64.tar.gz"
      sha256 "b713124bad5c9f259042e6d490a92b551e8d575b854229c8df73dd78654319b9"
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
  