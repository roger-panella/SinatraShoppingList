class ItemController < ApplicationController

  # def authorization_check
  #   if session[:current_user] == nil
  #     redirect '/accounts/not_authorized'
  #   else
  #     return true
  #   end
  # end

  get '/' do
    # if authorization_check == true
    # session[:current_user] = 'jeff'
    authorization_check
    # @user_name = session[:current_user].user_name
    @items = Item.all
    erb :read
end

  get '/create' do
    erb :create
  end

  post '/create' do
    @item = Item.new
    @item.name = params[:name]
    @item.quantity = params[:quantity]
    @item.save
    @message = 'Item added to shopping list!'
    redirect '/'
  end

  get '/update/:id' do
    @item = Item.find(params[:id])
    erb :update
  end

  post '/update' do
    @message = "Item Updated!"
    @item = Item.find(params[:id])
    @item.name = params[:name]
    @item.quantity = params[:quantity]
    @item.save
    # @message = "Item Updated!"
    redirect '/'
  end

  get '/destroy/:id' do
    @item = Item.find(params[:id])
    erb :destroy
  end

  post '/destroy' do
    @item = Item.find(params[:id])
    @item.destroy
    @message = 'Item deleted!'
    redirect '/'
  end

end
