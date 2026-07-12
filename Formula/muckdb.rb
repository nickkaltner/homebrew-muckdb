class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.3.1"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.3.1/muckdb-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "677a122058a87ecd27ea885daa6cc234e8c28b8cff91f2f04d98bf2699e7c43a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.3.1/muckdb-0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cb79edc0c8e13edc8118e855c97c1aea803099e24fda156e075b0655a06c747"
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
