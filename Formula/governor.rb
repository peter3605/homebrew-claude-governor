class Governor < Formula
  desc "Machine-wide build and subagent budget for Claude Code sessions"
  homepage "https://github.com/peter3605/claude-governor"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.4/governor-darwin-arm64"
      sha256 "3967cc67cd2a16373be08d5989e84b0a75829904daeb499961bd1f60c300757d"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.4/governor-darwin-amd64"
      sha256 "dcf2909b7ff6c51a7e581663ab664a95c68561fb51573fa11835516015cf7a86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.4/governor-linux-arm64"
      sha256 "11b7418ce1fba8933896b11c98f64d5cf759a8bd3a63f602f25cb23d254a57a9"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.4/governor-linux-amd64"
      sha256 "d602daf8cc1e8518d63b39306765a0fa9cb0d2de55c86c3c9acecea5244d980d"
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
