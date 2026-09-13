class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.5.4"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.5.4/muckdb-0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "732787e0fb8357afd290d7d4190d99a8f58fcb8a8aeb0b413d4dceb1627392bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.5.4/muckdb-0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8fa3acd9c310e22747e65c5c5ac1ab9aac5fbfd8fbcb57f90e22c27ed5fd586d"
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
