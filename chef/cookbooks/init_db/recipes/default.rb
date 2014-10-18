bash "Migrate database" do
  user "eums"
  cwd "/home/eums/app"
    command "source /home/eums/virtualenv/eums/bin/activate && ./manage.py migrate --noinput"
    action :run
end

template "/home/eums/app/eums/signals/handlers.py" do
  source "pre_seed_handlers.py.erb"
end

bash "Seed showcase data" do
    user "eums"
    cwd "/home/eums/app"
    command "source /home/eums/virtualenv/eums/bin/activate && ./manage.py loaddata eums/fixtures/show_case_data.json"
    action :run
end

bash "Seed flows and questions" do
    user "eums"
    cwd "/home/eums/app"
    command "source /home/eums/virtualenv/eums/bin/activate && ./manage.py loaddata eums/fixtures/flows_and_questions.json"
    action :run
end

template "/home/eums/app/eums/signals/handlers.py" do
  source "handlers.py.erb"
end
