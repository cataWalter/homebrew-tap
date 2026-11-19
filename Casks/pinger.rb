cask "pinger" do
  version "0.42"
  sha256 "7e585ce82a8f0153868617921f9f0275550c771c58f0727e3423d185b890bd30"

  url "https://github.com/cataWalter/pinger/releases/download/v0.42/Pinger-0.42-macos-universal.dmg"
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
