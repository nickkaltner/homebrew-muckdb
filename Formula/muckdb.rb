class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.9"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.9/muckdb-0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "d677ba62d8fdcb04d2b5c7aba1a28c82295fc28e965706d609e307af3bf3d66d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.9/muckdb-0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1383c9240d2605f676dbbc041d8ae33edab37a5e719e999a4092beffdedaf2ca"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
