class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.11"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.11/muckdb-0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "3590105146eccfa345cf9e1e65dc3302b17decb92cabaa4aae234451491e065e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.11/muckdb-0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0a9faa844d96176e64ea0dd98e576bd8865e45b8252acb19b23b024f2f51e43"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
