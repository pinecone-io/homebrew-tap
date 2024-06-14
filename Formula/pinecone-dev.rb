# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.46"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.46/pinecone_Darwin_all.tar.gz"
      sha256 "b777708070284d7ae936e86ca36084bb0b401429e5a45a462a391ff0511207be"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.46/pinecone_Linux_x86_64.tar.gz"
      sha256 "425ea6394fa96ec03eef6b08ad51532b0115a0412570bc6f73348d2eeca193f6"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.46/pinecone_Linux_arm64.tar.gz"
      sha256 "4eec3d7b9a19d482185dc33c5e431ebf6871da9640da4704d2787f7b00cd35dd"
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
  