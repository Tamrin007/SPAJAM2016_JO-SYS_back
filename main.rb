require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'dotenv'

Dotenv.load

environment = ENV['RACK_ENV'].to_sym
ActiveRecord::Base.configurations = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(environment)

class User < ActiveRecord::Base
end

class Sound < ActiveRecord::Base
end

class MainApp < Sinatra::Base
		get '/' do
			User.all.to_json
		end

		get '/get_sound/:file_id' do |id|
			sound_data = Sound.where(file_id: id).to_json
			p sound_data
		end

		get '/get_info/:keyword' do |key|
			sound_info = Sound.select("file_id", "title", "comment").where('title like ? or comment like ?', "%#{key}%", "%#{key}%").to_json
            p sound_info
		end

        get '/locate' do
            lat = params[:lat]
            lon = params[:lon]
            near_point = Sound.select("file_id", "title", "comment").find_by_sql("SELECT SQRT(POWER((#{lat} - lat), 2) + POWER((#{lon} - lon), 2)) AS distance FROM sounds ORDER BY distance").to_json
            p near_point
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
