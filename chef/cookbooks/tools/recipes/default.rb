execute "update repo information" do
    command "apt-get update"
end

%w{git build-essential python-setuptools python-dev python-pip libpq-dev libxml2 libxml2-dev libxslt1-dev nodejs npm}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "Install virtualenv" do
  command "pip install virtualenv"
end

execute "Install Bower" do
  command "npm install -g bower grunt-cli"
end

execute "Put 'node' on path for 'bower install to work'" do
  command "ln -s /usr/bin/nodejs /usr/bin/node"
  not_if { File.exist?("/usr/bin/node") }
end
