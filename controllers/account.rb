class AccountController < ApplicationController

enable :sessions

def does_user_exist(username)
  user = Account.find_by(:user_name => username)
  if user
    return true
  else
    return false
  end
end

def authorization_check
  if session[:current_user] == nil
    redirect '/not_authorized'
  else
    return true
  end
end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = Account.authenticate(params[:user_name], params[:password])
      if user
        @message = 'Welcome back!'
        session[:current_user] = user
        redirect '/'
      else
        # @message = 'NO! Try again'
        # erb :login
        redirect '/account/register'
      end
    end

  get '/register' do
    erb :register
  end

  post '/register' do
    if does_user_exist(params[:user_name]) == true
      return {:message => 'User already exists!'}.to_json
    end
    user = Account.create(user_email: params[:user_email], user_name: params[:user_name], password: params[:password])
    session[:current_user] = user
    redirect '/'
  end

  get '/logout' do
  # authorization_check
  session[:current_user] = nil
  redirect '/'
end

end
