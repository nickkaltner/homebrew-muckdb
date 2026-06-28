class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.15"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.15/muckdb-0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "4853c93a78bbe6a69108af4cff6c627f697e28021664d3f78551133991f02929"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.15/muckdb-0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "64fe61e5a91b31c0f00447289e55d72fdc6caf6522f1c4bfff73aa1f3a8d18df"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
