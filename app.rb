require 'sinatra'

 get '/'  do 
 	erb :index
 end

 post '/' do 
 	@user_name = params[:user_name]
 	@phone     = params[:phone]
 	@date_time = params[:date_time]

    @name_page = 'Main page'

 	if @user_name == '' && @phone == '' && @date_time == ''
 	    @title = 'Not accepted!'
 	    @message = 'Error, fill in all fields!  :-('
 	    
 	    erb :flash_messages
 	else 
	 	@title = 'Thankee!  :-)'
	 	@message = "Dear - #{@user_name}, we will be waiting at #{@date_time} in our Barber Shope!"
    
	 	file = File.open 'visitors.txt', 'a'
	 	file.write "User - #{@user_name}, Phone: #{@phone}, Date and time: #{@date_time} \n"
	 	file.close
	 	erb :flash_messages
	end	
 end

 get '/admin' do 
	
 	@name_page = 'Main page'

 	erb :admin
 end	

post '/admin' do 

	@login = params[:login]
	@password = params[:password]

	@name_page = 'Main page'

	if @login == 'Art' and @password == 'Volga'

		@title = 'Admin Zone'
 		@message = 'Hi admin - Art@Volga'

 		@logfile = File.open("visitors.txt")

        erb :flash_messages
    else
          
       @message = "Access is denied!"

          erb :admin
       end


end