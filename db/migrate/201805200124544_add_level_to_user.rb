class AddLevelToUser < ActiveRecord::Migration

  def change
    add_column :users, :level, :integer, :default => 1, :after => :email
  end

end


