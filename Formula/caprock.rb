# This file mirrors the GoReleaser-generated cask for v0.3.0 as a formula.
# From the next release on, GoReleaser regenerates it — do not edit by hand.
class Caprock < Formula
  desc "Mission control for Claude Code — watch, control and orchestrate your sessions"
  homepage "https://caprock.dev"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dspv/caprock/releases/download/v#{version}/caprock_#{version}_darwin_amd64.tar.gz"
      sha256 "581dfa001100a9a77b88a54ae8377f5e8e4719058c907787c0a339a3a561a91e"
    end
    on_arm do
      url "https://github.com/dspv/caprock/releases/download/v#{version}/caprock_#{version}_darwin_arm64.tar.gz"
      sha256 "e2648c054ad3c2f5f120821b2f15e18cc8e35dc620bb637c61a21d197e75aab7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dspv/caprock/releases/download/v#{version}/caprock_#{version}_linux_amd64.tar.gz"
      sha256 "ecb58b1627257f74b4f71bfe40ab7a27b6d8be67f128a1587f1e907109124ded"
    end
    on_arm do
      url "https://github.com/dspv/caprock/releases/download/v#{version}/caprock_#{version}_linux_arm64.tar.gz"
      sha256 "56686fb92f5fc2a3ad39dade6bdb684ae297e9b50e5cee51ac48d59732379018"
    end
  end

  def install
    bin.install "caprock"
  end

  def caveats
    <<~EOS
      Start it with:  caprock up
      Then open:      http://127.0.0.1:4173
    EOS
  end

  test do
    assert_match "caprock", shell_output("#{bin}/caprock --help 2>&1", 0)
  end
end
