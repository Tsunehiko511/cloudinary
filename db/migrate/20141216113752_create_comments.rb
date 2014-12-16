class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.string :name
			t.text :body
			t.text :filename
			t.timestamps :created_at
		end
	end
end
