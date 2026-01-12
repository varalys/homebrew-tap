class Lore < Formula
  desc "Capture AI coding sessions and link them to git commits"
  homepage "https://github.com/varalys/lore"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.9/lore-aarch64-apple-darwin.tar.gz"
      sha256 "5c7d6fd640ad4bd6ef8283aa37136e8155a4f0a60d63c68b43286801d8f0f35a"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.9/lore-x86_64-apple-darwin.tar.gz"
      sha256 "aede7b4adb8c8e655bdc8f75bc540aee74ce8d07b001c4da44db57005a52c5a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.9/lore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19141ad73fea68e8f424a004fa79cc60f2f9655aae2b2e9ac4bf18275d8fc6e9"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.9/lore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "087773a417d7396017ffe8ed8791b62fb7c4f90b080934ba29fae8eef439504f"
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
