class Lore < Formula
    desc "Capture AI coding sessions and link them to git commits"
    homepage "https://github.com/varalys/lore"
    version "0.1.6"
    license "Apache-2.0"

    on_macos do
      on_arm do
        url "https://github.com/varalys/lore/releases/download/v0.1.6/lore-aarch64-apple-darwin.tar.gz"
        sha256 "1151f5f87220b20484c1e8830da15a539aa71682b26afd548697f933d79a2be8"
      end
      on_intel do
        url "https://github.com/varalys/lore/releases/download/v0.1.6/lore-x86_64-apple-darwin.tar.gz"
        sha256 "3a97cbee455294895c8a71c80b49b2d528a44bec8bcaf2461d71025ec2180dfb"
      end
    end

    on_linux do
      on_arm do
        url "https://github.com/varalys/lore/releases/download/v0.1.6/lore-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "98862097b2a46849ef7e83d407e6365c34c29531b782efa72dbb1a4ad054460c"
      end
      on_intel do
        url "https://github.com/varalys/lore/releases/download/v0.1.6/lore-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "31e22ca1e97b5f8de58bd66d36ba6b60830e1a5e88bacd5fd5ebad87b262e46c"
      end
    end

    def install
      bin.install "lore"
    end

    def post_install
      # Restart daemon if running to pick up new version
      pid_file = Pathname.new(Dir.home)/".lore"/"daemon.pid"
      if pid_file.exist?
        system bin/"lore", "daemon", "stop"
        system bin/"lore", "daemon", "start"
      end
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
