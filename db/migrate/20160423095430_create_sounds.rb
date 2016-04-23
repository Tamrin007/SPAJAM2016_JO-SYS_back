class CreateSounds < ActiveRecord::Migration
  def up
		create_table :sounds do |t|
			t.integer :file_id, 'PRIMARY KEY AUTO_INCREMENT'
			t.binary :sound_data, :null => false
			t.string :title, :null => false
			t.string :comment,
			t.double :lat, :null => false
			t.double :lon, :null => false
			t.integer :user_id, :null => false
			t.timestamps
		end
  end
	
	def down
		drop_table :users
	end
end
