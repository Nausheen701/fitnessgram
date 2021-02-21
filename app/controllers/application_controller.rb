require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :welcome
  end

  helpers do 

    def get_daily_update
      @daily_update = DailyUpdate.find_by(id:params[:id])

    end 

  end 

end
