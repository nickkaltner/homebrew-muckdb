class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.39"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.39/muckdb-0.1.39-aarch64-apple-darwin.tar.gz"
      sha256 "b8f4757e6d45845f84a6812fe2f6b2c5fead2e1ce0cb1b8966ccdd1a6d4baed3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.39/muckdb-0.1.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8b6ccd61b12c9ed4a734e93f327cd88e558d9030084a375dba5a47e9e236f27"
    end
  end

  def install
    bin.install "muckdb"
  end

  def caveats
    <<~EOS
      muckdb ships a Claude Code skill that teaches coding agents how to drive it.

      First time? Install it into your skills directory:
        muckdb skill install

      Upgrading muckdb? The bundled skill is updated too — refresh your copy so
      agents get the latest guidance (this overwrites ~/.claude/skills/muckdb/SKILL.md):
        muckdb skill install --force

      Remove it again with:
        muckdb skill uninstall
    EOS
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
