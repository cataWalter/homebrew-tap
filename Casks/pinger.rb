cask "pinger" do
  version "0.7"
  sha256 "e091adf8c951286521416b33501381db242abd62c1d7046afade4ea2b2ce4f78"

  url "https://github.com/cataWalter/pinger/releases/download/v0.7/Pinger-0.7-macos-universal.dmg"
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
