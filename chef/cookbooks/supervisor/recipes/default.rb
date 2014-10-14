%w{supervisor}.each do |pkg|
  package pkg do
    action :install
  end
end

link "/var/run/supervisor.sock" do
  action :delete
  only_if "test -L /var/run/supervisor.sock"
end

template "/etc/supervisor/supervisord.conf" do
	source "supervisord.conf.erb"
end

execute "start supervisor" do
  command "supervisor -c /etc/supervisor/supervisord.conf"
  action :nothing
end
