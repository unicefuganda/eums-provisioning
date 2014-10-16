execute "Dummy rapid pro token" do
	user "root"
	command "echo \"RAPIDPRO_API_TOKEN=''\" > /etc/environment"
end

bash "Source bashrc" do
	user "root"
	command "source /etc/environment"
end
