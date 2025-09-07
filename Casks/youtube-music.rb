# youtube-music.rb
cask "youtube-music" do
  arch arm: "-arm64"

  version "3.10.0"
  sha256 "ee30ccf7be62be04e17d94d54f0ewdcfc74ee4048cde15fd9c9540ece1cecaf2"

  url "https://github.com/th-ch/youtube-music/releases/download/v#{version}/YouTube-Music-#{version}#{arch}.dmg"
  name "YouTube Music"
  desc "YouTube Music Desktop App"
  homepage "https://github.com/th-ch/youtube-music"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "YouTube Music.app"

  postflight do
    system_command "xattr", args: ["-cr", "/Applications/YouTube Music.app"]
  end

  auto_updates true
end
