class AccountController < ApplicationController

enable :sessions

  get '/login' do
    erb :login
  end

  # get '/' do
  #   'YO from account controller'
  # end

  post '/login' do
    user = Account.authenticate(params[:user_name], params[:password])
      if user
        session[:current_user] = user
        redirect '/'
      else
        @message = 'NO! Try again'
        erb :login
      end
    end


  get '/register' do
    erb :register
  end

  post '/register' do
    user = Account.create(user_email: params[:user_email], user_name: params[:user_name], password: params[:password])
    session[:current_user] = user
  end

end
