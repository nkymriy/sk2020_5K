# Homebrewのインストール前提

# 念の為にHomebrewをアップデートする
brew update

# GCCをインストール
brew install gcc

# rbenvをインストール
brew install rbenv

# rbenvインストール時にruby-buildはインストールされるが、一応実行しておく
brew install ruby-build

# pathを通す
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

# 同じくpathを通す
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile

# .bash_profileの内容を.zprofileに転記
cat .bash_profile >> .zprofile

# シェルの再起動
exec $SHELL -l

# ruby 2.7.1をインストール
rbenv install 2.7.1

# rbenvの再読み込み
rbenv rehash

# デフォルトで利用するrubyのバージョンを2.7.1に設定
rbenv global 2.7.1