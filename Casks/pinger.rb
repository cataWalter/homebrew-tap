cask "pinger" do
  version "0.13"
  sha256 "49a7da578b3086d2abe88fa9f2d2931465d2c545d833d095d0f3520f5857522f"

  url "https://github.com/cataWalter/pinger/releases/download/v0.13/Pinger-0.13-macos-universal.dmg"
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
