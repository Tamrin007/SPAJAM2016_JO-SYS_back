require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'dotenv'

Dotenv.load

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(ENV['RACK_ENV'])

class User < ActiveRecord::Base
end

class MainApp < Sinatra::Base
    get '/' do
        'Hello, World!'
    end
end
