# Rendered by scripts/app-release.sh for each tag; edit the template in
# dspv/caprock (app/packaging/caprock-app.rb.tmpl), not this file.
#
# The template carries two variants of what differs between a notarized
# build and one that is not, each between comment lines `>>> notarized` and
# `<<< notarized` (or `unnotarized`); app-release.sh keeps the one that
# matches the build and removes the other, and the marker lines with them.
cask "caprock-app" do
  version "0.153.0"
  sha256 "31c2b1c7926f1ac1118a3ba7b4b0b6a78ad1d353d2aa2fea2d890713b2ef1d83"

  url "https://github.com/dspv/caprock/releases/download/v#{version}/Caprock_#{version}_universal.dmg"
  name "Caprock"
  desc "Desktop app for running and watching coding agent sessions"
  homepage "https://caprock.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself in one click (F20, ADR-042): a signed bundle
  # verified against the key built into it. `brew upgrade` leaves a cask
  # that says so alone unless asked with --greedy, so the two never fight.
  auto_updates true

  depends_on macos: :ventura

  app "Caprock.app"

  uninstall quit: "dev.caprock.app"

  # The data directory (~/Library/Application Support/caprock) holds the
  # sessions and history the daemon keeps; it is shared with the caprock
  # formula, so zap leaves it alone.
  zap trash: [
    "~/Library/Application Support/dev.caprock.app",
    "~/Library/Caches/dev.caprock.app",
    "~/Library/Preferences/dev.caprock.app.plist",
    "~/Library/Saved Application State/dev.caprock.app.savedState",
    "~/Library/WebKit/dev.caprock.app",
  ]

  caveats <<~EOS
    The app bundles the daemon from the same release. If the caprock formula
    is installed (brew install dspv/tap/caprock), the app starts that one
    instead, and `brew upgrade caprock` keeps it current.
  EOS
end
