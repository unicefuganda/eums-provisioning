package "nginx" do
	action :install
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
end

template "/etc/nginx/conf.d/eums-server.conf" do
  source "eums-server.conf.erb"
end

service "nginx" do
  action :restart
end