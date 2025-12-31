class Lore < Formula
    desc "Capture AI coding sessions and link them to git commits"
    homepage "https://github.com/varalys/lore"
    url "https://github.com/varalys/lore/archive/refs/tags/v0.1.0.tar.gz"
    sha256 "db11b562dd96dce2a2871de821ca17931175c65cf7bc66a38c2a16df95e58aee"
    license "MIT"

    depends_on "rust" => :build

    def install
      system "cargo", "install", *std_cargo_args
    end

    service do
      run [opt_bin/"lore", "daemon", "start", "--foreground"]
      keep_alive true
      log_path var/"log/lore.log"
      error_log_path var/"log/lore.log"
      working_dir HOMEBREW_PREFIX
    end

    test do
      assert_match "lore", shell_output("#{bin}/lore --version")
    end
  end
