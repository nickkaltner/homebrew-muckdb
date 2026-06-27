class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.13"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.13/muckdb-0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "8f3f5211a506271792d4bd630ee682396299563ab8ed24755e9b09cfa287bba2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.13/muckdb-0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d497166bdbce5905ff2ee301594dca479aed430b84d067d8a96a217f04f65d14"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
