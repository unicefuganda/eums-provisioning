git "/var/www/eums" do
	user "www-data"
	repository "https://github.com/unicefuganda/eums.git"
	reference "master"
	revision "HEAD"
	action "sync"
end

directory "/var/www/env" do
    owner "www-data"
    group "www-data"
    action :create
end

execute "create_virtualenv" do
    cwd "/var/www/env/"
    command "virtualenv --no-site-packages eums"
end

execute "install pip dependencies" do
    cwd "/var/www/eums/"
    command "bash -c 'source /var/www/env/eums/bin/activate && pip install -r requirements.txt'"
    action :run
end

directory "/var/log/eums" do
        recursive true
        action :delete
end

directory "/var/log/eums" do
        recursive true
        action :create
end

execute "Remove admin statics" do
    cwd "/var/www/eums/eums/client"
    command "rm -f admin/admin"
end

execute "Link django admin statics to app statics" do
    cwd "/var/www/eums/eums/client"
    command "ln -s /var/www/env/eums/lib/python2.7/site-packages/django/contrib/admin/static/admin admin"
    not_if { File.exist?("admin") }
    action :run
end
