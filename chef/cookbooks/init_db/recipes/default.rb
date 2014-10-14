execute "Migrate database" do
	cwd "/home/eums/app"
   	command "bash -c 'source /home/eums/virtualenv/eums/bin/activate && ./manage.py migrate --noinput'"
   	action :run
   	environment ({'RAPIDPRO_API_TOKEN' => 'hello'})
end

