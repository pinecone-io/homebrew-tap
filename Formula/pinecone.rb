# typed: false
# frozen_string_literal: true

class Pinecone < Formula
  desc "Pinecone CLI"
  homepage "https://www.pinecone.io"

  disable! date: "2026-04-01", because: "has migrated to a cask. Reinstall with: brew uninstall pinecone-io/tap/pinecone && brew install --cask pinecone-io/tap/pinecone"
end
