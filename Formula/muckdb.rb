class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.8"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.8/muckdb-0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "415cdab190fe03432b6ed86558aa6ad6384d23e9a8ed8814e369ecbbcb203fe0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.8/muckdb-0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79e57ad146bd17c5fa9c955055355f617202eb69d9e609685046c38b1d69fbe9"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
