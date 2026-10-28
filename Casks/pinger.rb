cask "pinger" do
  version "0.1"
  sha256 "f2750732440e2901b8fe01d41a2c7a167372ca16bb61c67729403518c7244236"

  url "https://github.com/cataWalter/pinger/releases/download/v0.1/Pinger-0.1-macos-universal.dmg"
  name "Pinger"
  desc "Triage-focused Matrix desktop client with local AI assistance"
  homepage "https://github.com/cataWalter/pinger"

  depends_on macos: ">= :monterey"

  app "Pinger.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Pinger.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/gomuks-desktop",
    "~/Library/Caches/gomuks-desktop",
  ]
end
