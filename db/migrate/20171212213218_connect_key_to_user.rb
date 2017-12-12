class ConnectKeyToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :api_keys, :user_id, :integer
  end
end
