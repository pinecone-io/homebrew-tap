# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.35"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.35/pinecone_Darwin_all.tar.gz"
      sha256 "c274d95ad37fefb5ae1924dcc09b9f3ff15e2b9edce6ccb9df9d6510ee6feee0"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.35/pinecone_Linux_x86_64.tar.gz"
      sha256 "e18b019a811163fce1b2d8a13102c107cce4ae85d1d4a2fe98700116cede3e3d"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.35/pinecone_Linux_arm64.tar.gz"
      sha256 "d56c6e6cc3916cf83fe0aec8086f4fedc6b740ca14a387c0812114b71976d00a"
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
  