class Lore < Formula
  desc "Capture AI coding sessions and link them to git commits"
  homepage "https://github.com/varalys/lore"
  version "0.1.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.11/lore-aarch64-apple-darwin.tar.gz"
      sha256 "5b6d774cb7285ae992ab79fb616e00cc707690de15718c4798022b1c81f34ed7"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.11/lore-x86_64-apple-darwin.tar.gz"
      sha256 "5a5d2d6b84504858b00102780829abc239efb0180905c54d91e0c9677ee386b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.11/lore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e5894f01f2eb1727efe433df89c56d1b56be85de6409ef70a2402ee2c516cc6"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.11/lore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3ebb95fc954320091420333ebc5a065a38a5f9b64924e91b9b61730b92a8f74"
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
