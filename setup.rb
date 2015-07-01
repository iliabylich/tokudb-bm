require_relative 'support/boot'
require_relative 'support/connection'
require_relative 'support/migration'

CreateUsersTokuDBZlibCompression.up
CreateUsersTokuDBQuickLZCompression.up
CreateUsersTokuDBLZMACompression.up
CreateUsersTokuDBNoCompression.up
CreateUsersInnoDB.up
