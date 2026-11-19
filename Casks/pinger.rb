cask "pinger" do
  version "0.41"
  sha256 "d698f1c652317c21c3f885a3edfee7c286c5f8594b5dc7e05908eb8bd7de7838"

  url "https://github.com/cataWalter/pinger/releases/download/v0.41/Pinger-0.41-macos-universal.dmg"
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
