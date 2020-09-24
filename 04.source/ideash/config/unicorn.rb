# config/unicorn.rb

working_directory '/var/www/sk2020_5K/04.source/ideash'

pid '/var/www/sk2020_5K/04.source/ideash/pids/unicorn.pid'


stderr_path '/var/www/sk2020_5K/04.source/ideash/log/unicorn.log'
stdout_path '/var/www/sk2020_5K/04.source/ideash/log/unicorn.log'

listen '/tmp/unicorn.ideash.sock'

worker_processes 2

timeout 30