class CreateUsers < ActiveRecord::Migration
  def up
		create_table :users do |t|
			t.column :user_id, 'INTEGER PRIMARY KEY AUTO_INCREMENT'
			t.string :user_name, :null => false
			t.string :password, :null => false
  	end
		add_index :users, :user_name, :unique => true
	end

	def down
	 	drop_table :users
	end
end
