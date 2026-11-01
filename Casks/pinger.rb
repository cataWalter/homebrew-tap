cask "pinger" do
  version "0.26"
  sha256 "7f023e51d82e780e07a954ab3c8e87927ce83f0260946563e40071d5785a8dee"

  url "https://github.com/cataWalter/pinger/releases/download/v0.26/Pinger-0.26-macos-universal.dmg"
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
