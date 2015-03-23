execute "Migrate database" do
  user "www-data"
  cwd "/var/www/eums"
  command "/var/www/env/eums/bin/python manage.py migrate"
  action :run
end

template "/var/www/eums/eums/signals/handlers.py" do
  source "pre_seed_handlers.py.erb"
end

execute "Load new deployment instance data" do
    user "www-data"
    cwd "/var/www/eums"
    command "/var/www/env/eums/bin/python manage.py loaddata eums/fixtures/new-deployment-instance.json"
    action :run
end

template "/var/www/eums/eums/signals/handlers.py" do
  source "handlers.py.erb"
end
