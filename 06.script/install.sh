cd ../04.source/ideash || exit

echo '> bundle install'
bundle install --path vendor/bundle --jobs=4

echo '> yarn install'
yarn install

rake webpacker:install:erb

echo '> -rf tmp/pids/server.pid'
rm -rf tmp/pids/server.pid
