module TokuDB
  class User < ActiveRecord::Base
    self.table_name = 'users_tokudb'
  end
end

module InnoDB
  class User < ActiveRecord::Base
    self.table_name = 'users_innodb'
  end
end
