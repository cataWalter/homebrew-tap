cask "pinger" do
  version "0.36"
  sha256 "759ac3e1fe0a9426c4d20010b695d26c06eec0c4939f6654527132efef03f909"

  url "https://github.com/cataWalter/pinger/releases/download/v0.36/Pinger-0.36-macos-universal.dmg"
  name "Pinger"
  desc "Triage-focused Matrix desktop client with local AI assistance"
  homepage "https://github.com/cataWalter/pinger"

  depends_on macos: ">= :ventura"

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
