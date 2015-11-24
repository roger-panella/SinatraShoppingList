require 'bundler'
Bundler.require

get '/' do
  erb :index
end

get '/users' do
  erb :users
end

get '/items' do
  erb :users
end

get '/login' do
  erb :users
end

get '/signup' do
  erb :signup
end
