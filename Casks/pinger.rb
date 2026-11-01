cask "pinger" do
  version "0.17"
  sha256 "4600a68cfc90948e18db2ca937c21350706781fac5d0e3b26f56b676c9a7ef4b"

  url "https://github.com/cataWalter/pinger/releases/download/v0.17/Pinger-0.17-macos-universal.dmg"
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
