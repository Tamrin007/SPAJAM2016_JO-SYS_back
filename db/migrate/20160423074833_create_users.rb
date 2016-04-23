class CreateUsers < ActiveRecord::Migration
  def up
		create_table(:users, primary_key: 'user_id') do |t|
			t.string :user_name, :null => false
			t.string :password, :null => false
  	end
		add_index :users, :user_name, :unique => true
	end

	def down
	 	drop_table :users
	end
end
