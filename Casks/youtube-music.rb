# youtube-music.rb
cask "youtube-music" do
  arch arm: "-arm64"

  version "3.11.0"
  sha256 "a2d68bd80117ce376a08229f5cfb0a4570d98aba4e56af8040c725b22e856e0d"

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
