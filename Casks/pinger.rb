cask "pinger" do
  version "0.0.0-dev.ea14791c5a75"
  sha256 "a1add69056f0e6c79019dd579fe33d68f7fe95095bd918131325a93ba9acda70"

  url "https://github.com/cataWalter/pinger/releases/download/v0.0.0-dev.ea14791c5a75/Pinger-0.0.0-dev.ea14791c5a75-macos-universal.dmg"
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
