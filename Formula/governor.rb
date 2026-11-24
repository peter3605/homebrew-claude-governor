class Governor < Formula
  desc "Machine-wide build and subagent budget for Claude Code sessions"
  homepage "https://peter3605.github.io/claude-governor/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.9/governor-darwin-arm64"
      sha256 "903c12eb255159649effa48f5c09e0ee0607c6d50baadd9f016847178785832e"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.9/governor-darwin-amd64"
      sha256 "b1f983d128ec8324608b0aab034d6ebd5d844918535d40fc8b3721138f2ceff9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.9/governor-linux-arm64"
      sha256 "b0549e0e44f00475da878965edcacad785817ed42725316d5612e87b3e456a91"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.9/governor-linux-amd64"
      sha256 "19d095ae8cbb954b964b1366bad57f42c334360b478aa6a51df75dc757526f80"
    end
  end

  def install
    bin.install Dir["governor-*"].first => "governor"
  end

  def caveats
    <<~EOS
      This installs the binary only. To govern Claude Code sessions, and after
      every upgrade, run:
        #{opt_bin}/governor install
      By full path: once installed, governor on PATH can be the previous build.
      It writes a plugin to ~/.claude/skills/build-governor/, merges a statusLine key into
      ~/.claude/settings.json (after backing it up), and starts the daemon.
      Undo all of it with: governor uninstall
      Something wrong? Run governor doctor --report and paste it into an issue:
        https://github.com/peter3605/claude-governor/issues
    EOS
  end

  test do
    assert_match "governor #{version}", shell_output("#{bin}/governor version")
  end
end
