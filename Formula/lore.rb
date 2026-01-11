class Lore < Formula
  desc "Capture AI coding sessions and link them to git commits"
  homepage "https://github.com/varalys/lore"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-aarch64-apple-darwin.tar.gz"
      sha256 "8c74bb845a43e87f35973245f8f432708a93f8eaf6cca2e3926899a87392a674"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-x86_64-apple-darwin.tar.gz"
      sha256 "314288391adf912807d9f0fb5f84823e50b87a75f7043b2e32bc9a4fc5fd8804"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9aaee8c4d5c9f873f1189b5f3804d5de44dea2cd7aae4db79caaa9fdf696cae1"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1febfe142bf744f2461371f1db1d38be6550f87b03750036c143ee9da9b523e1"
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
    EOS
  end

  test do
    assert_match "lore", shell_output("#{bin}/lore --version")
  end
end
