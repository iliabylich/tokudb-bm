class CreateUsersTokuDBZlibCompression < ActiveRecord::Migration
  def self.up
    create_table :users_tokudb_zlib_compression, options: 'ENGINE=TokuDB, ROW_FORMAT=TOKUDB_ZLIB' do |t|
      t.string :email
      t.string :full_name
      t.integer :age
    end
  end

  def self.down
    drop_table :users_tokudb_zlib_compression
  end
end

class CreateUsersTokuDBQuickLZCompression < ActiveRecord::Migration
  def self.up
    create_table :users_tokudb_quicklz_compression, options: 'ENGINE=TokuDB, ROW_FORMAT=TOKUDB_QUICKLZ' do |t|
      t.string :email
      t.string :full_name
      t.integer :age
    end
  end

  def self.down
    drop_table :users_tokudb_quicklz_compression
  end
end

class CreateUsersTokuDBLZMACompression < ActiveRecord::Migration
  def self.up
    create_table :users_tokudb_lzma_compression, options: 'ENGINE=TokuDB, ROW_FORMAT=TOKUDB_LZMA' do |t|
      t.string :email
      t.string :full_name
      t.integer :age
    end
  end

  def self.down
    drop_table :users_tokudb_lzma_compression
  end
end

class CreateUsersTokuDBNoCompression < ActiveRecord::Migration
  def self.up
    create_table :users_tokudb_no_compression, options: 'ENGINE=TokuDB, ROW_FORMAT=TOKUDB_UNCOMPRESSED' do |t|
      t.string :email
      t.string :full_name
      t.integer :age
    end
  end

  def self.down
    drop_table :users_tokudb_no_compression
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
