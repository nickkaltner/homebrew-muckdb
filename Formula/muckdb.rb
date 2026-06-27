class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.6"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.6/muckdb-0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "22a9afac35a7e99596eb9d85d6a6f9129bf92cf1c3df4c4e03dcc8c88426b188"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.6/muckdb-0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31c7d6ad0dda31ea83f69b21853850fcc6bd2d14e001fcb589f94a5985102dba"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
