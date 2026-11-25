class DdnsIpv6Go < Formula
  desc "Monitor IPv4/IPv6 changes and auto-renew IP certificates with certbot"
  homepage "https://github.com/PengGeGe18/ddns-ipv6-go"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_darwin_x86_64.tar.gz"
      sha256 "1f3dc1809cfff7037b3ae2424570e2c6c8c693c3bd7697b0e3dbc00a09fe39f7"
    end

    on_arm do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_darwin_arm64.tar.gz"
      sha256 "e625e2514dc9d6ec66b4793905c5c594005978b4280bd316f3bcf0ae91eafaa8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_linux_x86_64.tar.gz"
      sha256 "119e24a0933f45b58f7bada028edccae452e255e9f92a276da5413fca6f9fd43"
    end

    on_arm do
      url "https://github.com/PengGeGe18/ddns-ipv6-go/releases/download/v#{version}/ddns-ipv6-go_#{version}_linux_arm64.tar.gz"
      sha256 "51a015d0087b5be8af2c95fb6001c476e98d2180e578f26173cb1ccc3b7ddaf4"
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
