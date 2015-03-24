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

template "/var/www/eums/zimbabwe/eums/celery.py" do
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
  owner "www-data"
  group "www-data"
  mode "0755"
  action :create
end

service "supervisord" do
  action :start
end
