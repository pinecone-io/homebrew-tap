class YourApp < Formula
  desc "Description of your app"
  homepage "https://example.com"
  version "1.0.0"

  if OS.mac?
    url "https://storage.googleapis.com/pinecone-cli/0.0.19/pinecone_Darwin_all.tar.gz"
    sha256 "SHA256_CHECKSUM_FOR_DARWIN_AMD64"
  # elsif OS.mac? && Hardware::CPU.arm?
  #   url "https://storage.googleapis.com/your-bucket/your-app-1.0.0-darwin-arm64.tar.gz"
  #   sha256 "SHA256_CHECKSUM_FOR_DARWIN_ARM64"
  # elsif OS.linux? && Hardware::CPU.intel?
  #   url "https://storage.googleapis.com/your-bucket/your-app-1.0.0-linux-amd64.tar.gz"
  #   sha256 "SHA256_CHECKSUM_FOR_LINUX_AMD64"
  # elsif OS.linux? && Hardware::CPU.arm?
  #   url "https://storage.googleapis.com/your-bucket/your-app-1.0.0-linux-arm64.tar.gz"
  #   sha256 "SHA256_CHECKSUM_FOR_LINUX_ARM64"
  # elsif OS.windows? && Hardware::CPU.intel?
  #   url "https://storage.googleapis.com/your-bucket/your-app-1.0.0-windows-amd64.zip"
  #   sha256 "SHA256_CHECKSUM_FOR_WINDOWS_AMD64"
  # elsif OS.windows? && Hardware::CPU.arm?
  #   url "https://storage.googleapis.com/your-bucket/your-app-1.0.0-windows-arm64.zip"
  #   sha256 "SHA256_CHECKSUM_FOR_WINDOWS_ARM64"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "your-app"
  end

  test do
    system "#{bin}/your-app", "--version"
  end
end
