class Governor < Formula
  desc "Machine-wide build and subagent budget for Claude Code sessions"
  homepage "https://peter3605.github.io/claude-governor/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.7/governor-darwin-arm64"
      sha256 "fc38885daf5787b87d3bf5f564682b256273f273e1d02da0484ea16481301116"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.7/governor-darwin-amd64"
      sha256 "32f86ca8702c97ba495faea256f82400f8d716301cd29524f140c37a82fc29ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.7/governor-linux-arm64"
      sha256 "fec9a0a75a3eff2978476aa77b7c6ec4a3f32335bd4711832522d333d03daa88"
    end
    on_intel do
      url "https://github.com/peter3605/claude-governor/releases/download/v0.1.7/governor-linux-amd64"
      sha256 "d2cb18222a6e07e158aa57c34c648e8f0d6444dc6dbba9a6ed1ede28452cb1dd"
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
