class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.4.0"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.4.0/muckdb-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "5039e5feed0ab78341dcacd577a344c97a16f55f1665a8ac0cd95654a6be03e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.4.0/muckdb-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4262de83756c8abc52001d831c385d0bbf358136a843f49733c17fba76ea2e39"
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
