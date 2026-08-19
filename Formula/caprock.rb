# This file mirrors the GoReleaser-generated formula for v0.4.0.
# From the next release on, GoReleaser regenerates it — do not edit by hand.
class Caprock < Formula
  desc "Mission control for Claude Code — watch, control and orchestrate your sessions"
  homepage "https://caprock.dev"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dspv/caprock/releases/download/v0.4.0/caprock_0.4.0_darwin_amd64.tar.gz"
      sha256 "631538b636d61e171a6b8e22179cc49e34276e3e3bd8b149de15b046e3e0572e"
    end
    on_arm do
      url "https://github.com/dspv/caprock/releases/download/v0.4.0/caprock_0.4.0_darwin_arm64.tar.gz"
      sha256 "7539fa9bd81e247481b6659ab4c73b5d5cb9d05788ce8bac06ba94b9871d6e79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dspv/caprock/releases/download/v0.4.0/caprock_0.4.0_linux_amd64.tar.gz"
      sha256 "98924607354a3a6d2b25ecfb43e021f9718a127ff72a7165f56433846ddae190"
    end
    on_arm do
      url "https://github.com/dspv/caprock/releases/download/v0.4.0/caprock_0.4.0_linux_arm64.tar.gz"
      sha256 "152ccfdfa37b3ea5e0bbda058740b7bbff7e1b0ef0db433357db2c2d19f802f2"
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
    assert_match "caprock", shell_output("#{bin}/caprock --help")
  end
end
