cask "pinger" do
  version "0.22"
  sha256 "fbed0fc52b3a3c4bd401f758c8bc60fe3d75cfcc002516c4b41a1a01708426ed"

  url "https://github.com/cataWalter/pinger/releases/download/v0.22/Pinger-0.22-macos-universal.dmg"
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
