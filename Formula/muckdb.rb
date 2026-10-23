class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.7.23"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.7.23/muckdb-0.7.23-aarch64-apple-darwin.tar.gz"
      sha256 "3e728409be2584fdbe286485062011ee594f1dc3c71a55339a4ec974fceee438"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.7.23/muckdb-0.7.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ee6834666730683992338eb6fa8ebd831163c18db029b319d01e6e0ac1dd133"
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
