class Governor < Formula
  desc "Machine-wide build and subagent budget for Claude Code sessions"
  homepage "https://github.com/peter3605/claude-governor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.1/governor-darwin-arm64"
      sha256 "8b2429c63580825a27eb9f14ebea9b026c02d0fea33223752050d6af7f65acb6"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.1/governor-darwin-amd64"
      sha256 "5d527f53bb856b26bf31ad62c64ef4f270ac3835a88be133261b98454a0f240e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.1/governor-linux-arm64"
      sha256 "c6ae86f170ca87d711390c7d8de8ebd702b82ad1275b8da420460b9672211ab5"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.1/governor-linux-amd64"
      sha256 "66871e11f638e9fb704c1de59bdc4cf62d5e031d800040934a402c2d4fa3d6d0"
    end
  end

  def install
    bin.install Dir["governor-*"].first => "governor"
  end

  def caveats
    <<~EOS
      This installs the binary only. To govern Claude Code sessions, run:
        governor install
      It writes a plugin to ~/.claude/skills/build-governor/, merges a statusLine key into
      ~/.claude/settings.json (after backing it up), and starts the daemon.
      Undo all of it with: governor uninstall
    EOS
  end

  test do
    assert_match "governor #{version}", shell_output("#{bin}/governor version")
  end
end
