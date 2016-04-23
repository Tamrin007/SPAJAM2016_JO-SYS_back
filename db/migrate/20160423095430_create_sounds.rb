class CreateSounds < ActiveRecord::Migration
  def up
		create_table(:sounds, primary_key: 'file_id') do |t|
		  t.binary :data, :null => false
			t.string :title, :null => false
			t.string :comment
			t.float :lat, :null => false
      t.float :lon, :null => false
			t.integer :user_id, :null => false
			t.timestamps
		end
  end

	def down
		drop_table :users
	end
end
