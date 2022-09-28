class CreateFolks < ActiveRecord::Migration[7.0]
  def change
    create_table :folks do |t|
      t.string :name
      t.integer :phone
      t.string :twitter
      t.string :email
      t.string :location

      t.timestamps
    end
  end
end
