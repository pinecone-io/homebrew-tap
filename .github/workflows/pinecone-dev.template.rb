# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.21"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.21/pinecone_Darwin_all.tar.gz"
      sha256 "5e7d903fc57405730a44f23b39047c9ef1fd7cc488505fb41730db2b5be7deb6"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.21/pinecone_Linux_x86_64.tar.gz"
      sha256 "2dad173f29fdc29d6dbde4b62cfb7b7297215730278214b57a6761d66ca20f9b"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.21/pinecone_Linux_arm64.tar.gz"
      sha256 "74d2a9f96833eb091f1b97f8dacaf7472b3b16f64aa435fd5596c3748389d8a5"
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
  