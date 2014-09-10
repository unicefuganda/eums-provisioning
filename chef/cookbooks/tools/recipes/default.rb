execute "update repo information" do
    command "apt-get update"
    action :run
end

%w{git build-essential python-setuptools python-dev python-pip libpq-dev libxml2 libxml2-dev libxslt1-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "virtualenv" do
    command "pip install virtualenv"
end