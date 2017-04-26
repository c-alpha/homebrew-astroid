class Astroid < Formula
  desc ""
  homepage ""

  url "https://github.com/astroidmail/astroid/archive/v0.8.tar.gz"
  sha256 "867346e745726173c7728a1396311ee7558ec13098f93ea8c58cb3e63d5064f2"

  depends_on "scons" => :build
  depends_on "libsass"
  depends_on "libpeas"
  depends_on "notmuch"
  depends_on "boost"
  depends_on "webkitgtk@2.4.11"

  def install
    # these libraries are named differently in macOS
    inreplace "SConstruct", "boost_thread", "boost_thread-mt"
    inreplace "SConstruct", "boost_log'", "boost_log-mt'"

    args = [
      "--propagate-environment",
      "--prefix=#{prefix}",
      "--disable-embedded-editor",
      "--disable-plugins",
    ]
    scons "install", *args
  end

  test do
    system "false"
  end
end
