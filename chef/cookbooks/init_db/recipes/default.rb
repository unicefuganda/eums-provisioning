execute "Migrate database" do
  user "eums"
  cwd "/home/eums/app"
  command "/home/eums/virtualenv/eums/bin/python manage.py migrate"
  action :run
end

template "/home/eums/app/eums/signals/handlers.py" do
  source "pre_seed_handlers.py.erb"
end

execute "Seed showcase data" do
    user "eums"
    cwd "/home/eums/app"
    command "/home/eums/virtualenv/eums/bin/python manage.py loaddata eums/fixtures/show_case_data.json"
    action :run
end

execute "Seed flows and questions" do
    user "eums"
    cwd "/home/eums/app"
    command "/home/eums/virtualenv/eums/bin/python manage.py loaddata eums/fixtures/flows_and_questions.json"
    action :run
end

template "/home/eums/app/eums/signals/handlers.py" do
  source "handlers.py.erb"
end
