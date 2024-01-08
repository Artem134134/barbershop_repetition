require 'sinatra'

 get '/'  do 
 	erb :index
 end

 post '/' do 
 	@user_name = params[:user_name]
 	@phone     = params[:phone]
 	@date_time = params[:date_time]

 	@title = 'Thankee!'
 	@message = "Dear #{@user_name}, we will be waiting at #{@date_time} in our Barber Shope!"

 	erb :flash_messages
 end	

 