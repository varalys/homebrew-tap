class Lore < Formula
  desc "Capture AI coding sessions and link them to git commits"
  homepage "https://github.com/varalys/lore"
  version "0.1.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.13/lore-aarch64-apple-darwin.tar.gz"
      sha256 "c03a075d4b67589e35e52a43cc0e3e4c0a985dd2de2f57402c638ea616111ea6"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.13/lore-x86_64-apple-darwin.tar.gz"
      sha256 "cd92d77e9bef0a7e9e2e5965f5d92389312d1c4fcb1e00f1ff6f51f026923488"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.13/lore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b46ff915fc667edf10ba8f003c0545134de4f6c38478f8dc4e330174d3a97b15"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.13/lore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f476da4c563b30da9ef9bca461a7bac0a4811ef89b901ec3680ce0b9ef97b9e4"
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
