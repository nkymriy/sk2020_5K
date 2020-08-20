cd ../04.source/ideash/
echo 'modelのannotateを実行します'
bundle exec annotate --models
echo 'routesのannotateを実行します'
bundle exec annotate --routes --ignore-routes 'cable'
