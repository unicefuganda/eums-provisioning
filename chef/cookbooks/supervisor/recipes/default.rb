execute "Install supervisord" do
  command "sudo easy_install supervisor"
  action :run
end

# %w{supervisor}.each do |pkg|
#   package pkg do
#     action :install
#   end
# end

# execute "start supervisor" do
#   user "eums"
#   command "supervisor -c /etc/supervisor/supervisord.conf"
#   action :nothing
# end

template "/etc/supervisord.conf" do
  source "supervisord.conf.erb"
end

template "/etc/init.d/supervisord" do
  source "supervisord.erb"
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
