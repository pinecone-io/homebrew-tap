# This formula is updated by running a github actions workflow. Do not edit 
# this file by hand.
class PineconeDev < Formula
    desc "Pinecone CLI"
    homepage "https://github.com/pinecone-io/cli"
    version "0.0.38"
  
    if OS.mac?
      url "https://storage.googleapis.com/pinecone-cli/0.0.38/pinecone_Darwin_all.tar.gz"
      sha256 "6ee78d3fd053d86d312d126e822ffa2613f9791f0951532c64cd3cc05cdf6530"
    elsif OS.linux? && Hardware::CPU.intel?
      url "https://storage.googleapis.com/pinecone-cli/0.0.38/pinecone_Linux_x86_64.tar.gz"
      sha256 "44a61911d893b20f4855e21707951914a5f9434b177dea89ae3a447ebbdba7e2"
    elsif OS.linux? && Hardware::CPU.arm?
      url "https://storage.googleapis.com/pinecone-cli/0.0.38/pinecone_Linux_arm64.tar.gz"
      sha256 "8e1aa87c95d7b7021304455871265d724a1f079650a366fe080760683be4e43c"
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
  