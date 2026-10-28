cask "pinger" do
  version "0.1.7"
  sha256 "487434c778cdfd81d1a440c85f18b8db657c0ca5501fcfa8ad5c7aa21e13c62c"

  url "https://github.com/cataWalter/pinger/releases/download/v#{version}/Pinger-v#{version}-macos-universal.dmg"
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
