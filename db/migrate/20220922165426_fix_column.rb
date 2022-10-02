class FixColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :url, :uid
  end
end
