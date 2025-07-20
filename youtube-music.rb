cask "youtube-music" do
  # This block helps create the correct filename suffix for arm64 vs intel
  arch arm: "-arm64"

  # Define the specific version and checksums
  # This should be updated when a new app version is released
  version "3.10.0"
  sha256 arm:   "ee30ccf7be62be04e17d94d54f0eedcfc74ee4048cde15fd9c9540ece1cecaf2"

  desc "YouTube Music Desktop App"
  homepage "https://github.com/th-ch/youtube-music"

  # The URL is now built cleanly from the static version and arch
  url "https://github.com/th-ch/youtube-music/releases/download/v#{version}/YouTube-Music-#{version}#{arch}.dmg"

  # This block now works correctly to check for new versions
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
