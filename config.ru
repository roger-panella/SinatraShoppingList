require 'sinatra/base'


require('./controllers/application')
require('./controllers/item')
require('./models/item')
require('./models/account')
require('./controllers/account')

map('/') { run ItemController }
map('/') { run AccountController }

# run Sinatra::Application
