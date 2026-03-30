# typed: false
# frozen_string_literal: true

class Pinecone < Formula
  desc "Pinecone CLI"
  homepage "https://www.pinecone.io"
  url "https://github.com/pinecone-io/cli/releases/download/v0.3.1/pc_Darwin_all.tar.gz"
  sha256 "d80cf4e8c3948e4839310ffc0c08e4b2f5012bffbff3efb9d899b1159ebee9e0"
  version "0.3.1"

  disable! date: "2026-04-01", because: "has migrated to a cask. Reinstall with: brew uninstall pinecone-io/tap/pinecone && brew install --cask pinecone-io/tap/pinecone"
end
