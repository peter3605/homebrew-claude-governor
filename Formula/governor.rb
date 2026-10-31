class Governor < Formula
  desc "Machine-wide build and subagent budget for Claude Code sessions"
  homepage "https://github.com/peter3605/claude-governor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.2/governor-darwin-arm64"
      sha256 "c2b90e01746f1267adb58ba48df86fb3c729acd6eb572ef08803fb9355442698"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.2/governor-darwin-amd64"
      sha256 "32d051aa8a849fdbf5753c225182b092441fd330fd9db24f4e9bb725c902768e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.2/governor-linux-arm64"
      sha256 "17faa214e9df27ed66455fc99384ec29e520a9f2293795c8de9f9401df185890"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.2/governor-linux-amd64"
      sha256 "65e8d58527198829d54f8e188c59dd61746958bcd90297ea58cbd7a48954da49"
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
