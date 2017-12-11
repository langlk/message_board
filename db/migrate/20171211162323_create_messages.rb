class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.column :user_id, :integer
      t.column :group_id, :integer
      t.column :content, :text

      t.timestamps
    end
  end
end
