class Lore < Formula
  desc "Capture AI coding sessions and link them to git commits"
  homepage "https://github.com/varalys/lore"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.8/lore-aarch64-apple-darwin.tar.gz"
      sha256 "44f5d9f317373a7c5c6a7d21ecffb748c8ebb1dc287f01970826188dbaf9eb2b"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.8/lore-x86_64-apple-darwin.tar.gz"
      sha256 "d09ac9e2d549002c4353e4716cb74eb34595c641a5332ba8a701b07a432a2b8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.8/lore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90228765d82448d101ff3fa2f0327453026078526f485783fa544e24f03d1ce4"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.8/lore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "272143b06d8aabeaf262c914d9f67eb068f81cb245715e607cc32bb14b9c39ae"
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
