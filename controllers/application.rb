class ApplicationController < Sinatra::Base
  require 'bundler'
  Bundler.require

  ActiveRecord::Base.establish_connection(
    :database => 'shopping_items',
    :adapter => 'postgresql'
  )

set :views, File.expand_path('../../views', __FILE__)
set :public_dir, File.expand_path('../../public', __FILE__)

# get '/' do
#   @items = Item.all
#   erb :read
# end

  not_found do
    erb :not_found
  end

end
