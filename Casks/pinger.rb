cask "pinger" do
  version "0.24"
  sha256 "56ef67c450eb292541d636814e1554282a14d7dec0cc0c5448ede79337dc6dcf"

  url "https://github.com/cataWalter/pinger/releases/download/v0.24/Pinger-0.24-macos-universal.dmg"
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
