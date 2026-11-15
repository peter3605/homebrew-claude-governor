class Governor < Formula
  desc "Machine-wide build and subagent budget for Claude Code sessions"
  homepage "https://peter3605.github.io/claude-governor/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.6/governor-darwin-arm64"
      sha256 "78ae6a98f019a82e6a8cee08f5c537278b9e05471fd0a93a00ac86a32431bdb5"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.6/governor-darwin-amd64"
      sha256 "d1e3034ffbbf5394f6f9657cf6f9cfa42ac6762238af140fb7aa3c8dfabc9c23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.6/governor-linux-arm64"
      sha256 "eb547f9fd097a6af5f1f93b6795ad6964e9ec3c8663f1305a587f7168f25ec92"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.6/governor-linux-amd64"
      sha256 "fc2dc57f8497bfe498041de16b1185447d261cb1c065c25f98e2adc75169024a"
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
