class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.45"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.45/muckdb-0.1.45-aarch64-apple-darwin.tar.gz"
      sha256 "5118c06ebba77730e28ae7ee3d3c9327ac49a53b6e1d44a1d806b2f4ddda4be2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.45/muckdb-0.1.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f78e0433e710321a5476e9af102be0c36a79a1a742a46620a53231c8328ccb6"
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
