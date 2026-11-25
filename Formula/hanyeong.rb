class Hanyeong < Formula
  desc "Korean/English input switch for macOS that fires on key press"
  homepage "https://github.com/taeyun16/hanyeong"
  url "https://github.com/taeyun16/hanyeong/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "655cd6ab625ddd89612ea277e3aff4dd5064701caedcc8bec3f76dca9d5b6694"
  license "Apache-2.0"
  head "https://github.com/taeyun16/hanyeong.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/hanyeong")
  end

  def caveats
    <<~EOS
      한영 키를 켜려면 한 번 실행하세요:
        hanyeong install
      ~/Applications/hanyeong.app 을 만들고 로그인할 때 켜지도록 등록합니다.
      처음에는 손쉬운 사용 목록에서 hanyeong 을 켜야 합니다.

      brew upgrade 뒤에는 hanyeong install 을 다시 실행하세요.
      brew uninstall 전에는 hanyeong uninstall 을 먼저 실행하세요.
    EOS
  end

  test do
    assert_match(/^hanyeong \d+\.\d+\.\d+/, shell_output("#{bin}/hanyeong version"))
  end
end
