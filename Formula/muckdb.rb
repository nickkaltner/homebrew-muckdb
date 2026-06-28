class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.24"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.24/muckdb-0.1.24-aarch64-apple-darwin.tar.gz"
      sha256 "408b41fcf2fef521fc04ad7d9f9596eaaca1c7ed58ecd452cbcc0615127029fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.24/muckdb-0.1.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "72659014ae96a2b24f1596a7551c2bf620271ddae8d5ed87b69a848588172967"
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
