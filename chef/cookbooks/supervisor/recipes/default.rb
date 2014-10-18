execute "Install supervisord" do
  command "sudo easy_install supervisor"
  action :run
end

template "/etc/supervisord.conf" do
  source "supervisord.conf.erb"
end

template "/etc/init.d/supervisord" do
  source "supervisord.erb"
end

template "/home/eums/app/eums/celery.py" do
  source "celery.py.erb"
  variables({
     :celery_settings => node['celery_settings']
  })
end

file "/etc/init.d/supervisord" do
  mode "0755"
  action :touch
end

directory "/var/log/supervisor" do
  owner "eums"
  group "eums"
  mode "0755"
  action :create
end

service "supervisord" do
  action :start
end

execute "Start celery" do
  command "sudo supervisorctl start celery:eums_celery"
  action :run
end
