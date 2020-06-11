# aptのアップデート
sudo apt update && sudo apt upgrade -y

#sqlite3のインストール
sudo apt install -y sqlite3 libsqlite3-dev

#rbenvのインストール
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

#ruby-buildのインストール
git clone git://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

#パスを通す
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

#設定を読み込ませる
exec $SHELL -l


#rubyをインストールして使うバージョンを変更する
rbenv install 2.7.1
rbenv global 2.7.1

