directory "/home/eums/app" do
	mode 0755
	owner "eums"
	group "eums"
	action :create
end

git "/home/eums/app" do
	user "eums"
	repository "https://github.com/unicefuganda/eums.git"
	reference "master"
	revision "HEAD"
	action "sync"
end

