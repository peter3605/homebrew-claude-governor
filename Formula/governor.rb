class Governor < Formula
  desc "Machine-wide build and subagent budget for Claude Code sessions"
  homepage "https://peter3605.github.io/claude-governor/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.5/governor-darwin-arm64"
      sha256 "4297323609f1446efe91ecc5b370490700622d0a00c2336e9a80b72db55c5034"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.5/governor-darwin-amd64"
      sha256 "16b92a3e6e354fc0085096d7db9443944561f760c48f0ad427097d301be1cd36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.5/governor-linux-arm64"
      sha256 "f07500413d934e26f7cc82992a6a757f8562ebc8ae61eda582346840090f5b08"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.5/governor-linux-amd64"
      sha256 "bb493f4460d48365857fc06c2ddc17b3fa038243a21a16a1f7a53f998952be88"
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
