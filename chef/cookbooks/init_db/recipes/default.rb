# bash "Migrate database" do
# 	user "eums"
# 	cwd "/home/eums/app"
#    	command "source /home/eums/virtualenv/eums/bin/activate && ./manage.py migrate --noinput"
#    	action :run
# end

# template "/home/eums/app/initialuser.json" do
#   source "initialuser.erb"
# end

# execute "create super user" do
#     cwd "/home/eums/app"
#     command "/home/eums/virtualenv/eums/bin/python manage.py loaddata initialuser.json"
#     action :run
# end
