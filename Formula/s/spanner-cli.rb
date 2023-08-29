class SpannerCli < Formula
  desc "Interactive command-line tool for Google Cloud Spanner"
  homepage "https://github.com/cloudspannerecosystem/spanner-cli#readme"
  url "https://github.com/cloudspannerecosystem/spanner-cli/archive/refs/tags/v0.9.18.tar.gz"
  sha256 "d1501c6642b0de16e0e2379303cb7a5a428594ae5a2358c13da3d35797e634d1"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_equal "spanner-cli", shell_output("Missing parameters: -p, -i, -d are required").strip
    assert_equal "spanner-cli -p myproject -i myinstance -d mydb",
    shell_output("ERROR: checking database existence failed: spanner: code = \"PermissionDenied\", \
    desc = \"Caller is missing IAM permission spanner.sessions.create on resource projects/myproject/ \
    instances/myinstance/databases/mydb.\"").strip
  end
end
