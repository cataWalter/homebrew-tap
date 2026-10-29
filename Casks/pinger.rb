cask "pinger" do
  version "0.2"
  sha256 "8bb384ea5299bd9925a7eea9c810e4e1b87234f7826613bb8e1262e207b83f8a"

  url "https://github.com/cataWalter/pinger/releases/download/v0.2/Pinger-0.2-macos-universal.dmg"
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
