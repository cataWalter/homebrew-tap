cask "pinger" do
  version "0.23"
  sha256 "10c885360264c66c4e62a4c6e9d76364dfe792afde3f755a6a352ea44c716a93"

  url "https://github.com/cataWalter/pinger/releases/download/v0.23/Pinger-0.23-macos-universal.dmg"
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
