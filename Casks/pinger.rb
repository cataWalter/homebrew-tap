cask "pinger" do
  version "0.25"
  sha256 "45ee1ef9ac4eaa762fe2c88aed15a180cabaddf836d8fa403634ff58dcb4a578"

  url "https://github.com/cataWalter/pinger/releases/download/v0.25/Pinger-0.25-macos-universal.dmg"
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
