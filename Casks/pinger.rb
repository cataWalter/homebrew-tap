cask "pinger" do
  version "0.38"
  sha256 "8b653412564b9474cd7ab90e77cd9b9ca663e013542c78ced55539e2d71616a1"

  url "https://github.com/cataWalter/pinger/releases/download/v0.38/Pinger-0.38-macos-universal.dmg"
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
