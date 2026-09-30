class Poketerm < Formula
  desc "Terminal Pokédex Collector"
  homepage "https://github.com/chris-wood-mo/poketerm"
  url "https://github.com/chris-wood-mo/poketerm/releases/tag/brew-test.tar.gz"
  version "0.1.0"

  def install
    require "etc"
    real_home = Etc.getpwuid(Process.uid).dir
    ENV["POKETERM_REAL_HOME"] = real_home
    install_root = prefix.to_s
    bin_dir = bin.to_s
    ENV["POKETERM_INSTALL_ROOT"] = install_root
    ENV["POKETERM_BIN_DIR"] = bin_dir
    ENV["POKETERM_ZSHRC"] = ""
    install_script = File.join(buildpath, "install.sh")
    system "bash", install_script, "--install-root", install_root, "--bin-dir", bin_dir, "--zshrc", ""
  end

  def uninstall
    require "etc"
    real_home = Etc.getpwuid(Process.uid).dir
    ENV["POKETERM_REAL_HOME"] = real_home
    install_root = prefix.to_s
    bin_dir = bin.to_s
    ENV["POKETERM_INSTALL_ROOT"] = install_root
    ENV["POKETERM_BIN_DIR"] = bin_dir
    ENV["POKETERM_ZSHRC"] = ""
    install_script = File.join(buildpath, "install.sh")
    system "bash", install_script, "--uninstall", "--install-root", install_root, "--bin-dir", bin_dir, "--zshrc", ""
  end

  def caveats
    <<~EOS
      Poketerm is installed.
      To enable shell startup, run:
        source ~/.zshrc

      To update later:
        brew upgrade poketerm

      To remove it:
        brew uninstall poketerm
    EOS
  end
end