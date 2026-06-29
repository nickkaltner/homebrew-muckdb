class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.38"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.38/muckdb-0.1.38-aarch64-apple-darwin.tar.gz"
      sha256 "5b323bb55badc700b07d6ae7ae831fcae65202238a23e15f8fd1cea19757ae35"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.38/muckdb-0.1.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "054f6735a5bdff18acb538eb50e694e36261f59fb0be582ed7c5dd85933c423b"
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
