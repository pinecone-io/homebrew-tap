# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.32"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.32/pinecone_Darwin_all.tar.gz"
      sha256 "5106921ee6bb6262774822b8eaf0ac4a75d824443d5f4e9e1d61de3cf22b3188"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.32/pinecone_Linux_x86_64.tar.gz"
      sha256 "9136ace9132ea7ddd49fbc3ee47bd92daef8510cedd86a35c8805707991d9bb9"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.32/pinecone_Linux_arm64.tar.gz"
      sha256 "c177c979ae9c38856280e5f375eafee335f879f4452a0d8c60522293ee9c99d7"
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
  