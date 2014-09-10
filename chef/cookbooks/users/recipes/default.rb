user "eums" do
        action :create
        home "/home/eums"
        system true
        password "$1$.WsplVWP$vZGPs6vxS0FmQ0dh83M541"
end

user "eums" do
        action :modify
        home "/home/eums"
        supports :manage_home=>true
end