class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.5"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.5/muckdb-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "d19a9462bbecf1018f57a5d5c88acd79fe03f82231080916f09c93179235e72b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.5/muckdb-0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "227b6a98091c8ce1647f119e10a1a65b9979aaac727c32db5ec4d310161ccb66"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
