class ChangeBoardToGroup < ActiveRecord::Migration[5.1]
  def change
    drop_table :boards

    create_table :groups do |t|
      t.column :name, :string
      t.column :description, :string

      t.timestamps
    end
  end
end
