class Helix < Formula
  version "22.03"
  desc "Post-modern modal text editor"
  homepage "https://helix-editor.com"
  license "MPL-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/helix-editor/helix/releases/download/#{version}/helix-#{version}-x86_64-macos.tar.xz"
      sha256 "4624be398aff68af39c40ef401ec95a2d8722ae724328c1204afb663ffde72fb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/helix-editor/helix/releases/download/#{version}/helix-#{version}-x86_64-linux.tar.xz"
      sha256 "844ec88c81e2e4ca6153499a8b371cfbd3602f32492326b91bf2547d515f528f"
    end
  end

  def install
    libexec.install Dir["*"]
    (bin/"hx").write_env_script(libexec/"hx", :HELIX_RUNTIME => libexec/"runtime")
  end
end
