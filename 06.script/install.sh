cd ../04.source/ideash
#pathを指定することで環境を隔離
bundle install --path vendor/bundle --jobs=4
yarn install
rm -rf tmp/pids/server.pid

