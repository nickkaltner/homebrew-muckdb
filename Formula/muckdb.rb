class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.27"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.27/muckdb-0.1.27-aarch64-apple-darwin.tar.gz"
      sha256 "aa30ff6a0f773928d8358d2f20efc343491119afb6eea0fcd396919f6f2d7cb1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.27/muckdb-0.1.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3836e819285715b629f78908fd1aa63e7366ee419d3fa3d565ee0b20646b044"
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
