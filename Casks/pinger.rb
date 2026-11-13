cask "pinger" do
  version "0.31"
  sha256 "4966a8e895fa8337b84d613042b9df187abe8f2672d2c214570aba540f4a4ea3"

  url "https://github.com/cataWalter/pinger/releases/download/v0.31/Pinger-0.31-macos-universal.dmg"
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
