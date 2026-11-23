class Governor < Formula
  desc "Machine-wide build and subagent budget for Claude Code sessions"
  homepage "https://peter3605.github.io/claude-governor/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.8/governor-darwin-arm64"
      sha256 "5d9be9aa38a988369bdc9234bc8abc9e49fa2778151b11a29229d9d41cff8400"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.8/governor-darwin-amd64"
      sha256 "82e9d9ff979b1603aeca2b7351170dd392c8b4c5ea97bd144f6644fa6a0d6a95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.8/governor-linux-arm64"
      sha256 "d443737d72746b5cd7daeeff6649c2bb2f26c17a6528fbd4257192862a73b6bb"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.8/governor-linux-amd64"
      sha256 "91d6575e936d05b574aef04630b595538e0a3bf70ef710c16d2baeed8a7f5c0d"
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
