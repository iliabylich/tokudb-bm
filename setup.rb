require_relative 'support/boot'
require_relative 'support/connection'
require_relative 'support/migration'

CreateUsersTokuDB.up
CreateUsersInnoDB.up
