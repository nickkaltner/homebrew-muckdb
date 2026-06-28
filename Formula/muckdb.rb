class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.16"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.16/muckdb-0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "08328579a098fa2ee4c4451d87072115e5cfb33d11316fa01397faebca371674"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.16/muckdb-0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e74023e862580df50949157e6dba226bccf75524142e5e1d6fcf7dfa42238ee8"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
