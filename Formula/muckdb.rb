class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.30"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.30/muckdb-0.1.30-aarch64-apple-darwin.tar.gz"
      sha256 "c0f349b742d2451d0fdfaf2a5ab2471bdfc3b7d95ecc85cbd4dde0f62bd092e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.30/muckdb-0.1.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb182596222fcef5e0223ea53fc20e9ad0dc0ec6855b6bfcd483e9f65420b43f"
    end
  end

  def install
    bin.install "muckdb"
  end

  def caveats
    <<~EOS
      muckdb ships a Claude Code skill that teaches coding agents how to drive it.
      To install it into your skills directory, run:
        muckdb skill install
      It is written to ~/.claude/skills/muckdb/SKILL.md (--force to update).
      Remove it again with:
        muckdb skill uninstall
    EOS
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
