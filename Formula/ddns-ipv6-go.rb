class DdnsIpv6Go < Formula
  desc "Monitor IPv4/IPv6 changes and auto-renew IP certificates with certbot"
  homepage "https://github.com/PengGeGe18/ddns-ipv6-go"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_darwin_x86_64.tar.gz"
      sha256 "38a80070da7160c5ea383b5d64c35dc5a97ae0da9d1da90e2fd6c4618126252a"
    end

    on_arm do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_darwin_arm64.tar.gz"
      sha256 "f7e7e3771d799a194aa1c1e099240e6102c6d9ce9cf892c897bafaf552f12b58"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_linux_x86_64.tar.gz"
      sha256 "8dc5f261301f2069cf15174498d00c4310012353c98c19df7d5c9961365e9422"
    end

    on_arm do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_linux_arm64.tar.gz"
      sha256 "029b9ff5c31ebf58fb3528b7a3abd4a2abcc46f14a07d363e5088715b385f5d3"
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
