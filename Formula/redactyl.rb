class Redactyl < Formula
  desc "Deep artifact scanner for secrets in containers, Helm charts, and K8s manifests"
  homepage "https://github.com/varalys/redactyl"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/varalys/redactyl/releases/download/v1.0.2/redactyl_darwin_amd64.tar.gz"
      sha256 "48ec9f2267c98ffcc7e62ae29e90b6d8c6e4903098050f14480366e9a73a3213"
    end

    on_arm do
      url "https://github.com/varalys/redactyl/releases/download/v1.0.2/redactyl_darwin_arm64.tar.gz"
      sha256 "98ccb8aa4a060e18764efc2ba027ad79b2b812db9faf4dc0493b52dcdf5cbca6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/varalys/redactyl/releases/download/v1.0.2/redactyl_linux_amd64.tar.gz"
      sha256 "9d017c40d1b70c1772109391c5eb8503fa42eb5db4c805c5f33b3413d60e5b40"
    end

    on_arm do
      url "https://github.com/varalys/redactyl/releases/download/v1.0.2/redactyl_linux_arm64.tar.gz"
      sha256 "d96f74e114e341fd26465638fcfa83380739887f21985999dbefa91d839f414b"
    end
  end

  def install
    bin.install "redactyl"
  end

  test do
    assert_match "redactyl version", shell_output("#{bin}/redactyl version")
  end
end
