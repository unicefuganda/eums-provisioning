execute "Migrate database" do
  user "eums"
  cwd "/home/eums/app"
  command "/home/eums/virtualenv/eums/bin/python manage.py migrate"
  action :run
end

template "/home/eums/app/eums/signals/handlers.py" do
  source "pre_seed_handlers.py.erb"
end

execute "Load sample data" do
    user "eums"
    cwd "/home/eums/app"
    command "/home/eums/virtualenv/eums/bin/python manage.py loaddata eums/fixtures/sample-data.json"
    action :run
end

template "/home/eums/app/eums/signals/handlers.py" do
  source "handlers.py.erb"
end
