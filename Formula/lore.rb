class Lore < Formula
    desc "Capture AI coding sessions and link them to git commits"
    homepage "https://github.com/varalys/lore"
    url "https://github.com/varalys/lore/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "34897c1125b61874128eae954c0bb9551705ce8c70be4b4bf8c81785d4070a9e"
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
