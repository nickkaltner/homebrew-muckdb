class Muckdb < Formula
  desc "Live web view and history for your duckdb databases"
  homepage "https://github.com/nickkaltner/muckdb"
  version "0.1.10"
  license "MIT"

  depends_on "duckdb"

  on_macos do
    on_arm do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.10/muckdb-0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "54ed8fb0a4510df5ab4ddf9b938ab35868eb6d4ed635bf3b1ce6035f9986dd45"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nickkaltner/muckdb/releases/download/v0.1.10/muckdb-0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3ec077a4f703a379f650640f67b60cf1a3fb643ca6dfde093d3fbcfa04e6391"
    end
  end

  def install
    bin.install "muckdb"
  end

  test do
    assert_match "v", shell_output("#{bin}/muckdb --version")
  end
end
