cask "spotter" do
  version "1.0"
  sha256 "e770b7009c0750318c2ce7b4d5c6cad08124fedff13f4d827ee3951afb071f3a"

  url "https://github.com/cataWalter/spotter/releases/download/v1.0/Spotter-1.0.zip"
  name "Spotter"
  desc "Invisible menu bar assistant that diagnoses the screen with a local LLM"
  homepage "https://github.com/cataWalter/spotter"

  depends_on macos: ">= :sonoma"

  app "Spotter.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Spotter.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/it.spotter.app.plist",
  ]
end
