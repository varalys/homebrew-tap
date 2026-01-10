class Lore < Formula
    desc "Capture AI coding sessions and link them to git commits"
    homepage "https://github.com/varalys/lore"
    url "https://github.com/varalys/lore/archive/refs/tags/v0.1.6.tar.gz"
    sha256 "3b4f59b7562733eba6416b6d22858e73edf016060760b1d39b853192f6b3042f"
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
