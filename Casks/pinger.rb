cask "pinger" do
  version "0.16"
  sha256 "277dd8a5147bcebb3a3862bc358401f459f626a77fdc259ba6077c01e06d0c67"

  url "https://github.com/cataWalter/pinger/releases/download/v0.16/Pinger-0.16-macos-universal.dmg"
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
