module TokuDBZlibCompression
  class User < ActiveRecord::Base
    self.table_name = 'users_tokudb_zlib_compression'
  end
end

module TokuDBQuickLZCompression
  class User < ActiveRecord::Base
    self.table_name = 'users_tokudb_quicklz_compression'
  end
end

module TokuDBLZMACompression
  class User < ActiveRecord::Base
    self.table_name = 'users_tokudb_lzma_compression'
  end
end

module TokuDBNoCompression
  class User < ActiveRecord::Base
    self.table_name = 'users_tokudb_no_compression'
  end
end

module InnoDB
  class User < ActiveRecord::Base
    self.table_name = 'users_innodb'
  end
end
