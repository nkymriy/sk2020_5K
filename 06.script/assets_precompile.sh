cd ../04.source/ideash || exit
echo 'precompile済みのデータを削除しています'
bundle exec rake assets:clobber RAILS_ENV=production
echo 'precompile実行中'
bundle exec rake assets:precompile RAILS_ENV=production
echo 'precompile完了'