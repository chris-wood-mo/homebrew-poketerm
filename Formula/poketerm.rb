class Poketerm < Formula
  desc "Terminal Pokédex Collector"
  homepage "https://github.com/chriswood/poketerm"
  version "0.1.0"

  def install
    chdir srcdir do
      system "bash", "./install.sh"
    end
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
