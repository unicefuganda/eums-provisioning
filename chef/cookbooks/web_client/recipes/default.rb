execute "Install npm dependencies" do
  cwd "/home/eums/app/eums/client"
  command "npm install"
end

execute "Install bower dependencies" do
  cwd "/home/eums/app/eums/client"
  command "bower install --allow-root --config.interactive=false"
end

execute "Build app js" do
  cwd "/home/eums/app/eums/client"
  command "grunt #{node['grunt_command']}"
end
