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