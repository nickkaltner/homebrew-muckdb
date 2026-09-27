class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.7.4"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.7.4/muckdb-0.7.4-aarch64-apple-darwin.tar.gz"
      sha256 "ed9b6fd89b70a13fdfaf814f5871aaeb2d9c08bdb7fe3af241585b9e0feb092c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.7.4/muckdb-0.7.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1d5fd0c7034173acc834b4d27b19c1129aba0766b98d7b3aacb05370d0d4904"
    end
  end

  def install
    bin.install "muckdb"
  end

  def caveats
    <<~EOS
      muckdb ships an agent skill that teaches coding agents how to drive it.

      First time? Install it into your skills directory:
        muckdb skill install

      Upgrading muckdb? The bundled skill is updated too — refresh your copy so
      agents get the latest guidance (this refreshes ~/.agents/skills/muckdb/SKILL.md):
        muckdb skill install --force

      Remove it again with:
        muckdb skill uninstall
    EOS
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
