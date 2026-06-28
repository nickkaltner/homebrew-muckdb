class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.20"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.20/muckdb-0.1.20-aarch64-apple-darwin.tar.gz"
      sha256 "6211474387fb73ce69b655222879414d0b231c69397e7e69f15953d2c89ab03a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.20/muckdb-0.1.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9a1579fecfeb05864ef0fb4e0115ac23706b4255492f96b776688fe2b1e228b"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
