require "rubygems"
require "sinatra/base"

set :bind, '0.0.0.0'

class MyApp < Sinatra::Base

  get '/' do
    File.read('home.html')
  end

  get '/verificacao' do
    'Status OK - Versao 2.0'
  end
end