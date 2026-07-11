class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.2.34"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.2.34/muckdb-0.2.34-aarch64-apple-darwin.tar.gz"
      sha256 "8f23b59f7b522b3c56ff35d8f2a72d7a2484add821589fcb6471b776bb5a3372"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.2.34/muckdb-0.2.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "915e5c4177d16c548b0934454f731e3ebc4a24b624a093e904006d0a37e81556"
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
