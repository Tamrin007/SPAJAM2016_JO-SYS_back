require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'dotenv'

Dotenv.load

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(ENV['RACK_ENV'])

class User < ActiveRecord::Base
end
class Sound < ActiveRecord::Base
end

class MainApp < Sinatra::Base
		get '/' do
			'Hello, World!'
		end

		get '/get_sound/:file_id' do |id|
			sound_data = Sound.select("data").where(user_id: id)
			p sound_data
			p "ian"
		end

		get '/get_info/:title' do |title|
			sound_info = Sound.select("title", "comment").where(title: title)
			p sound_info
			p "ian"
		end

		post '/sign_up' do
			user = User.new
			user.user_name = params[:user_name]
			user.password = params[:password]
			user.save!
			status 202
		end

		post '/post_sound' do
			sound = Sound.new
			sound.data = params[:data]
			sound.title = params[:title]
			sound.comment = params[:comment]
			sound.lat = params[:lat]
			sound.lon = params[:lon]
			sound.user_id = params[:user_id]
			sound.save!
			status 202
		end

end
