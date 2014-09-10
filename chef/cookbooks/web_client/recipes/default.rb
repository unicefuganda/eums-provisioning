execute "Install npm dependencies" do
	cwd "/home/eums/app/eums/client"
	command "npm install"
end

execute "Install bower dependencies" do
	cwd "/home/eums/app/eums/client"
	command " echo 'Y' | bower install --allow-root"
end