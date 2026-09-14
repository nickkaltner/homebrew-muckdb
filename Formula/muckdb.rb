class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.5.9"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.5.9/muckdb-0.5.9-aarch64-apple-darwin.tar.gz"
      sha256 "4e6a6e9c1448cdb07a4c810fe6bc1ee06b54808ba4b64087746e9d3ce28adeef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.5.9/muckdb-0.5.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89005f42d919549521c79a462aea7763acd60fac166796a5ed0003a4595965ac"
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
