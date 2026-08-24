class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.4.34"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.4.34/muckdb-0.4.34-aarch64-apple-darwin.tar.gz"
      sha256 "9242451264013a360a6eff2f0af64d52b7ebe53d241f723b43b3ab7117d5f35d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.4.34/muckdb-0.4.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2458cf9b6e289c32a56876a9f80ad3395b7d9e5a56b567b89c5ebbb93b7052b"
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
