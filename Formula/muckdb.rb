class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.3"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.3/muckdb-0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "c434969f038969260cdce2e72caac4adca52d19a6ad7dd095fe50e92adb6e18c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.3/muckdb-0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3023beea683d2d4bc484bede4d64edb2b5b517faac13161e3cb396a8424cfcc4"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
