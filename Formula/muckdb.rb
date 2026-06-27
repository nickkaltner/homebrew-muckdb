class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.4"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.4/muckdb-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "674848e99ba0762e8983f5cf0454a03a25314ea55b8faf0dc97adb2aa8051d43"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.4/muckdb-0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1f4ec1d8e73cbb3bf415a0bc5f9165b45853eec5d2d154f8e7b2cb892f64f81"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
