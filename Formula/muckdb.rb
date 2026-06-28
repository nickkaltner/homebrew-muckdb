class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.17"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.17/muckdb-0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "b4672978ee46dfdddea73a3df11e2bc530b759735fc027c8a47ddda645691478"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.17/muckdb-0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "362f8de56f951fe88f6eeddde0f03f42a468b90c0167e005c2e2c5d663b4ac70"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
