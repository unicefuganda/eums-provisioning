user "www-data" do
  action :create
  home "/var/www"
  system true
  #remove this.
  password "$1$.WsplVWP$vZGPs6vxS0FmQ0dh83M541"  
end

user "www-data" do
  action :modify
  home "/var/www"
  supports :manage_home=>true
end

directory "/var/www" do
  owner "www-data"
  group "www-data"
  mode "0755"
  action :create
end
