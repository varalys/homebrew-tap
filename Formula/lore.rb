class Lore < Formula
    desc "Capture AI coding sessions and link them to git commits"
    homepage "https://github.com/varalys/lore"
    url "https://github.com/varalys/lore/archive/refs/tags/v0.1.2.tar.gz"
    sha256 "560c7bf40c7bf51edbf6e7c0c55c1ce03fc48603af2c23738ae7b09d37c13f73"
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
