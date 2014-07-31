class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
	  t.string :email
	  t.string :token
	  t.boolean :continue
	  t.string :why_no
	  t.integer :number
	  
      t.timestamps
    end
  end
end
