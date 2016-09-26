class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string "username", :null => false, :maximum => 63
      t.string :salt
      t.string :password
      t.timestamps
    end
  end
end
