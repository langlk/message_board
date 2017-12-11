class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.column :name, :string
      t.column :description, :string

      t.timestamps
    end
  end
end
