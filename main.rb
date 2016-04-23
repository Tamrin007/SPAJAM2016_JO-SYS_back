require 'sinatra'
require 'sinatra/base'

class MainApp < Sinatra::Base
    get '/' do
        'Hello, World!'
    end
end

