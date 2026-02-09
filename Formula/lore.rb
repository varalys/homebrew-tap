class Lore < Formula
  desc "Capture AI coding sessions and link them to git commits"
  homepage "https://github.com/varalys/lore"
  version "0.1.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.12/lore-aarch64-apple-darwin.tar.gz"
      sha256 "0e7be99b4c997cc8d039a2fd4770181b737771205d9bf50356fb9d095543409e"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.12/lore-x86_64-apple-darwin.tar.gz"
      sha256 "1c43ad2446edb878506087a4298bc4d14e0ec56752f65d03fec202bee940b859"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.12/lore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2484c48125854b60f89426bc0b61cf21090eaa2bbe90fa0f7ec48604725ccd10"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.12/lore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d95f0ab69e47cc60fe03a9f19f899cfc4455012727f7db5d1c09016e44c45be"
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
