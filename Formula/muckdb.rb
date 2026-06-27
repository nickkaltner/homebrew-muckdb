class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.14"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.14/muckdb-0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "fc4226fef5a755436bb9a3850b71f3a0f7b71ab28788b857e5caa03926170149"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.14/muckdb-0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b4ca745de73cd8231e7347f7aedf5d6f4aab9c9784408215c53a5f732932f93e"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
