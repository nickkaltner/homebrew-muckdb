class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.18"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.18/muckdb-0.1.18-aarch64-apple-darwin.tar.gz"
      sha256 "b152748ffa7fe9eb380a1b7dcf93a322fe33ac54bdd72dcc6b6e1e69b3a24c60"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.18/muckdb-0.1.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1932f215f3da5d7b1870359001b0ce5be2aeafd92e59c571fc29af26a5375e32"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
