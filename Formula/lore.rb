class Lore < Formula
  desc "Capture AI coding sessions and link them to git commits"
  homepage "https://github.com/varalys/lore"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-aarch64-apple-darwin.tar.gz"
      sha256 "3b27e5fcc9b6b0930573cd2dd9551bd77eccaa1503bf9dba08342d94afc421b9"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-x86_64-apple-darwin.tar.gz"
      sha256 "0e58ba86a6874a079722da2f5f4764fcbb03c0f6d05e106affb18a7bd9af918c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30334ee58d03681ae16d15a874cb6a9df09a17acb16f6c532c66e2d3b5a774f5"
    end
    on_intel do
      url "https://github.com/varalys/lore/releases/download/v0.1.7/lore-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb13293309ffbb9c47b24f819c3cd7745b060b4c4fca47f2ccdc8cf5dc51d60f"
    end
  end

  def install
    bin.install "lore"
  end

  service do
    run [opt_bin/"lore", "daemon", "start", "--foreground"]
    keep_alive true
    log_path var/"log/lore.log"
    error_log_path var/"log/lore.log"
    working_dir HOMEBREW_PREFIX
  end

  def caveats
    <<~EOS
      Run this first to configure lore:
        lore init

      The background service will not work until lore init has been run.
    EOS
  end

  test do
    assert_match "lore", shell_output("#{bin}/lore --version")
  end
end
