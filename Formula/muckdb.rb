class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.22"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.22/muckdb-0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "95039099f4cc9150019a46466e5a48796db4682c1dc82d9de3c78ffa3147fd12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.22/muckdb-0.1.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af19466f4490f2050a9333fec35a90dbfe571a51056fd6fae431c23a4c962336"
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
