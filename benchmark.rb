require_relative 'support/boot'
require_relative 'support/connection'
require_relative 'support/models'

TokuDB::User.delete_all
InnoDB::User.delete_all

require 'benchmark'
GC.disable

ITERATIONS = 200

def create(model_klass, count)
  count.times do |i|
    model_klass.create(email: "email#{i}@gmail.com", full_name: "User #{i}", age: i)
  end
end

def find(model_klass, count)
  count.times do |i|
    min_id = model_klass.first.id
    max_id = model_klass.last.id
    user_id = (min_id..max_id).to_a.sample
    model_klass.find(user_id)
  end
end

Benchmark.bm(40) do |bm|
  bm.report('InnoDB insert') do
    create(InnoDB::User, ITERATIONS)
  end
  bm.report('TokuDB insert') do
    create(TokuDB::User, ITERATIONS)
  end

  bm.report('InnoDB select') do
    find(InnoDB::User, ITERATIONS)
  end
  bm.report('TokuDB select') do
    find(TokuDB::User, ITERATIONS)
  end
end