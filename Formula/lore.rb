class Lore < Formula
  desc "Capture AI coding sessions and link them to git commits"
  homepage "https://github.com/varalys/lore"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.10/lore-aarch64-apple-darwin.tar.gz"
      sha256 "5877fe14420b6548693acafdb555e13604eaa8ffee76af736583b466ba12c63f"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.10/lore-x86_64-apple-darwin.tar.gz"
      sha256 "4ee2f6a86e08b876fda4f57dea5fc428a9b80eefc55d29c6f94d695df8c4804a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.10/lore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "038834183f9a6aca4bf673ca85d5a6077892c6eae493816a1bf52c85390fb4fa"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.10/lore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f8eb1563f3ee1d4f7f9b697305781a4001370cb422cb6967e71f673cd31d6bf"
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
