package "uwsgi" do
  action :install
end

package "uwsgi-plugin-python" do
  action :install
end

template "/etc/uwsgi/apps-enabled/eums.ini" do
  source "eums.ini.erb"
end

template "/etc/uwsgi/apps-available/eums.ini" do
  source "eums.ini.erb"
end

directory "/var/www/sockets" do
  recursive true
  action :delete
end

directory "/var/www/sockets" do
  recursive true
  action :create
end

service "uwsgi" do
	action :restart
end
