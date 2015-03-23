execute "Install npm dependencies" do
  cwd "/var/www/eums/eums/client"
  command "npm install"
end

execute "Install bower dependencies" do
  cwd "/var/www/eums/eums/client"
  command "bower install --allow-root --config.interactive=false"
end

execute "Build app js" do
  cwd "/var/www/eums/eums/client"
  command "grunt #{node['grunt_command']}"
end
