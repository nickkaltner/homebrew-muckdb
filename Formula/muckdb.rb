class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.2"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.2/muckdb-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "8b610a8f0ff9c5a462251a64306d87921f3eba4975b67a3a8c563717920ce62d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.2/muckdb-0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c30225736e0bc3c237888b98fab16e3af0b8b8686ecc29568e36856ee8356b29"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
