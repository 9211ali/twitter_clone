class AddNameToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :name, :string

    query = <<~SQL
      update users
      set name = username
      where name is null
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

  def down
    remove_column :users, :name
  end
end
