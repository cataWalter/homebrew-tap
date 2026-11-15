cask "pinger" do
  version "0.37"
  sha256 "50099a4064061d7cace75027884bd97808669d9bd2b264e4f6ad42b179bb739d"

  url "https://github.com/cataWalter/pinger/releases/download/v0.37/Pinger-0.37-macos-universal.dmg"
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
