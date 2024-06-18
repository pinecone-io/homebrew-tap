# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.49"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.49/pinecone_Darwin_all.tar.gz"
      sha256 "61a7e437062b42a5705c598fa3a818a6134d0dd6aeac77eece3dc3829349a411"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.49/pinecone_Linux_x86_64.tar.gz"
      sha256 "d6a554bf1b86eeb745fee77341b448cda548f3346ec3262717166c9c3f21f3ec"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.49/pinecone_Linux_arm64.tar.gz"
      sha256 "5c13b1f47ab00f64616b5399bd969f743f814fd4afba85dbe7c23e1d62e30586"
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
  