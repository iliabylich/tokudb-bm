class CreateUsersTokuDB < ActiveRecord::Migration
  def self.up
    create_table :users_tokudb, options: 'ENGINE=TokuDB' do |t|
      t.string :email
      t.string :full_name
      t.integer :age
    end
  end

  def self.down
    drop_table :users_tokudb
  end
end

class CreateUsersInnoDB < ActiveRecord::Migration
  def self.up
    create_table :users_innodb, options: 'ENGINE=InnoDB' do |t|
      t.string :email
      t.string :full_name
      t.integer :age
    end
  end

  def self.down
    drop_table :users_innodb
  end
end
