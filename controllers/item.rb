class ItemController < ApplicationController

  get '/' do
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
    erb :message
  end

  get '/update/:id' do
    @item = Item.find(params[:id])
    erb :update
  end

  post '/update' do
    @item = Item.find(params[:id])
    @item.name = params[:name]
    @item.quantity = params[:quantity]
    @item.save
    @message = "Item modified!"
    erb :message
  end

  get '/destroy/:id' do
    @item = Item.find(params[:id])
    erb :destroy
  end

  post '/destroy' do
    @item = Item.find(params[:id])
    @item.destroy
    @message = 'Item deleted!'
    erb :message
  end

end
