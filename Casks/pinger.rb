cask "pinger" do
  version "0.20"
  sha256 "5fd73a6df1ce49a2fb07df0171c1f45f4cafc609230e62652f38a25de4ad7fd4"

  url "https://github.com/cataWalter/pinger/releases/download/v0.20/Pinger-0.20-macos-universal.dmg"
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
