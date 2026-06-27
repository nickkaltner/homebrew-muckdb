class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.12"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.12/muckdb-0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "15f5c9c5a4bc3d0a2181de761cb43ae55b93a655cf32523b8e64c1c255e0848e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.12/muckdb-0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "950597514102614c33a7ec3fea33426542749a52abf6f5875071c4ff61df1d4b"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
