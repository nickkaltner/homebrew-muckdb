class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.19"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.19/muckdb-0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "e70ce6ea7392f90eaf4ef5f7ad8c0f5a380c94130dcff7ed94a2e47ba66f885d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.19/muckdb-0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e35decb55e5af5939316afe353e102590febededa27d4037dfe49ea703991da6"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
