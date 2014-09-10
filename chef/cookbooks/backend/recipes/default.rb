directory "/home/eums/app" do	
	owner "eums"
	group "eums"
	mode "0755"
	action :create
end

git "/home/eums/app" do
	user "eums"
	repository "https://github.com/unicefuganda/eums.git"
	reference "master"
	revision "HEAD"
	action "sync"
end

directory "/home/eums/virtualenv" do
    owner "eums"
    group "eums"
    action :create
end

execute "create_virtualenv" do
    cwd "/home/eums/virtualenv/"
    command "virtualenv --no-site-packages eums"
end

execute "install pip dependencies" do
    cwd "/home/eums/"
    command "bash -c 'source virtualenv/eums/bin/activate && pip install -r app/requirements.txt'"
    action :run
end

directory "/var/www" do
	recursive true
    action :delete
end

directory "/var/www" do
    action :create
end

directory "/var/log/eums" do
        recursive true
        action :delete
end

directory "/var/log/eums" do
        recursive true
        action :create
end

execute "Create link for nginx static files from the app" do
        command "ln -s /home/eums/app /var/www/eums"
        action :run
end