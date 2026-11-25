class DdnsIpv6Go < Formula
  desc "Monitor IPv4/IPv6 changes and auto-renew IP certificates with certbot"
  homepage "https://github.com/PengGeGe18/ddns-ipv6-go"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_darwin_x86_64.tar.gz"
      sha256 "500eb773552985bcd914057d36a9900db54581eaecadcb2172a38596c7a0349f"
    end

    on_arm do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_darwin_arm64.tar.gz"
      sha256 "e9f1904c9e641fb0b6fb355a7b7403228ea0d6054055da7ede4b7e1d0d6461d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_linux_x86_64.tar.gz"
      sha256 "7cb2dbee3a54e8dd891030134d12aded984bd18fe3817ece9c6c1f225d58819b"
    end

    on_arm do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_linux_arm64.tar.gz"
      sha256 "c72caca01f94d57a40ed629382e1714893b2eb5e49d2a0c011670fd63b8a3cf2"
    end
  end

  def install
    bin.install "ddns-ipv6-go"
  end

  service do
    run [opt_bin/"ddns-ipv6-go", "-l", ":9876"]
    keep_alive true
    log_path var/"log/ddns-ipv6-go.log"
    error_log_path var/"log/ddns-ipv6-go.err.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ddns-ipv6-go -v")
  end
end