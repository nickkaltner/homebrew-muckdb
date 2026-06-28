class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.25"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.25/muckdb-0.1.25-aarch64-apple-darwin.tar.gz"
      sha256 "a2fb2f145349449fde6f5b6608010cd89f96c8a4d3e50c54623d5442dff5d402"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.25/muckdb-0.1.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9db3a891d244309bb1c99e3fb9dd7937bc109ee821abe3db06edfef7b239ce5a"
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
