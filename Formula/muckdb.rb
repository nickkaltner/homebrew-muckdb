class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.1"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.1/muckdb-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "1c3c6199cc3d3bec5c0737297ec07b8a7e89d48c8a0885c3dacdbe07d6581424"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.1/muckdb-0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6349dc7763ba151a202f88eb114f818f3c35613fdb6eb83ab0e3fe3b12c4ab7"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
