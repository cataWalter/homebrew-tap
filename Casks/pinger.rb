cask "pinger" do
  version "0.5"
  sha256 "0b137541355062dd9920cc56711d69b717542295bb6fca8fb6bc6c6212e6c22d"

  url "https://github.com/cataWalter/pinger/releases/download/v0.5/Pinger-0.5-macos-universal.dmg"
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
