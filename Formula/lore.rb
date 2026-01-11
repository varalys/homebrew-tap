class Lore < Formula
    desc "Capture AI coding sessions and link them to git commits"
    homepage "https://github.com/varalys/lore"
    version "0.1.7"
    license "Apache-2.0"

    on_macos do
      on_arm do
        url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-aarch64-apple-darwin.tar.gz"
        sha256 "ee2e76fc6366d7bf74f253f3bea561cd32295361306affb7de8c5e121a5570fc"
      end
      on_intel do
        url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-x86_64-apple-darwin.tar.gz"
        sha256 "cc098b7fd90af89931491ccc0add6ae11ca88e212f3b54f20b1c19ad6d137bc4"
      end
    end

    on_linux do
      on_arm do
        url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "d3e1248c89e9d720cf67a825917cf2616babc26b70f9b3b0b97f1d8ef0244379"
      end
      on_intel do
        url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "ac932fd6d3257717a0568e73a6667645eefb03c89dd6dcb0598a767138bed999"
      end
    end

    def install
      bin.install "lore"
    end

    service do
      run [opt_bin/"lore", "daemon", "start", "--foreground"]
      keep_alive crashed: true
      log_path var/"log/lore.log"
      error_log_path var/"log/lore.log"
      working_dir HOMEBREW_PREFIX
    end

    def caveats
      <<~EOS
        To get started, run:
          lore init

        The Homebrew service won't start until init completes.
      EOS
    end

    test do
      assert_match "lore", shell_output("#{bin}/lore --version")
    end
  end
