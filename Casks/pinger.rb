cask "pinger" do
  version "0.3"
  sha256 "e00bd1366247b4e51cda8004875d55ec01e3f21874bfa91603334177953023a4"

  url "https://github.com/cataWalter/pinger/releases/download/v0.3/Pinger-0.3-macos-universal.dmg"
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
