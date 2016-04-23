require 'sinatra'
require 'sinatra/base'
require 'active_record'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(ENV['RACK_ENV'])

class User < ActiveRecord::Base
end

class MainApp < Sinatra::Base
    get '/' do
        'Hello, World!'
    end

		post '/' do
			user = User.new
			user.user_name = params[:user_name]
			user.password = params[:password]
			user.save!
			status 202
		end
end

