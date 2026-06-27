class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.7"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.7/muckdb-0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "d8f6c959ae26c04e5e0338b09bf05db1307de80841a596b4fe23386dc94be1d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.7/muckdb-0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "785d5b05ad737358d6aef69949bcb93dd5004c5bf6edf99dbd383aa5dc31055f"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
