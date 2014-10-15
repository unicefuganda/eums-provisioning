execute "Dummy rapid pro token" do
	user "eums"
	command "echo \"export RAPIDPRO_API_TOKEN=''\" > /home/eums/.bash_profile"
end

bash "Source bashrc" do
	user "eums"
	command "source /home/eums/.bash_profile"
end