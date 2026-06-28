class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.28"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.28/muckdb-0.1.28-aarch64-apple-darwin.tar.gz"
      sha256 "a676225edbfe2f1571227730c23bb9b26ec753b59f3c70e8b718599d46a9e02e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.28/muckdb-0.1.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a39526c0211317b10624a5969cbbc56b25c10f68a010fd3fc588ed69d72d810"
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
