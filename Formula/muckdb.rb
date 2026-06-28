class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.21"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.21/muckdb-0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "8b11c08af3e04a4b2fd6a5385a3941bb11efa168c4c7204b7493b0c6f1104894"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.21/muckdb-0.1.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5038ac2133b82d191ac0339c4d1dfab6dab24ace9ce2db8635c39ec85a71f670"
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
      It is written to ~/.claude/skills/muckdb/SKILL.md (re-run with --force to update).
    EOS
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
