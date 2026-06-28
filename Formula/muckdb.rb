class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.23"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.23/muckdb-0.1.23-aarch64-apple-darwin.tar.gz"
      sha256 "4472b41813e843a68d1d17df23c634aff57484c0b2c2fcb541e0a6a55a67131c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.23/muckdb-0.1.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "104d0ce52dd85a66e518be9deacb7c91314e5cda9508dd9827d2615bb579baf1"
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
