class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column :email, :string
      t.column :name, :string

      t.timestamps
    end
  end
end
