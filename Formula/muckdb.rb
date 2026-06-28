class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.26"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.26/muckdb-0.1.26-aarch64-apple-darwin.tar.gz"
      sha256 "a35c4f982c9df3a53bf3452d90d51c65b3523a3e1b7d856cc5a6dea164ac8553"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.26/muckdb-0.1.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d79bf5ee29564d684c4022d5b97b8dfaf012697d47e14948588caa2a9270454"
    end
  end

  def install
    bin.install "muckdb"
  end

  def caveats
    <<~EOS
      muckdb ships a Claude Code skill that teaches coding agents how to drive it.
      To install it into your skills directory, run:
        muckdb skill install
      It is written to ~/.claude/skills/muckdb/SKILL.md (--force to update).
      Remove it again with:
        muckdb skill uninstall
    EOS
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
