class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.52"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.52/muckdb-0.1.52-aarch64-apple-darwin.tar.gz"
      sha256 "3d251363bf03d8d56aa700f3499fd4be825c8acabc529e18c0032355a89c2a61"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.52/muckdb-0.1.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "615cf004f97e918d73d76ae74c5495f449714d014ea4b5c775684a2fed214457"
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
