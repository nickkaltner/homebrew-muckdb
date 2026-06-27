class Muckdb < Formula
  desc "Facade over the duckdb CLI with a live web view"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.0"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.0/muckdb-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "01a1fa797447264427839be2dd97b40f769b53ba2af8bd2318ad76b95a87a5b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.0/muckdb-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "406b283a1575460f12c77868a148d3f3e68bc591b69fb92b94551f9baeddaddc"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
