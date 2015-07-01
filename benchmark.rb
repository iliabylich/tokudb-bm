require_relative 'support/boot'
require_relative 'support/connection'
require_relative 'support/models'

require 'benchmark'
GC.disable

ITERATIONS = ENV.fetch('ITERATIONS') { 2000 }.to_i
MODELS = {
  'zlib compression' => TokuDBZlibCompression::User,
  'quicklz compression' => TokuDBQuickLZCompression::User,
  'lzma compression' => TokuDBLZMACompression::User,
  'no compression' => TokuDBNoCompression::User,
  'innodb' => InnoDB::User
}

MODELS.each do |_, model_klass|
  model_klass.delete_all
end

def each_model(bm, action)
  MODELS.each do |name, model_klass|
    bm.report("#{name} #{action}") do
      yield model_klass
    end
  end
end

def insert(model_klass, count)
  count.times do |i|
    model_klass.create(email: "email#{i}@gmail.com", full_name: "User #{i}", age: i)
  end
end

def select(model_klass, count)
  count.times do |i|
    min_id = model_klass.first.id
    max_id = model_klass.last.id
    user_id = (min_id..max_id).to_a.sample
    model_klass.find(user_id)
  end
end

def batch_insert(model_klass, count)
  batch_size = 1000
  (count / batch_size).times do |batch_id|
    GC.start # we must control gc manually
    records = batch_size.times.map do |i|
      model_klass.new(email: "email#{batch_id}@gmail.com", full_name: "User #{i}", age: i)
    end
    model_klass.import(records)
  end
end

def delete_one_by_one(model_klass)
  model_klass.all.each(&:delete)
end

def delete_all(model_klass)
  model.delete_all
end

Benchmark.bm(60) do |bm|
  each_model(bm, 'insert') do |model_klass|
    insert(model_klass, ITERATIONS)
  end

  puts

  each_model(bm, 'select') do |model_klass|
    select(model_klass, ITERATIONS)
  end

  puts

  each_model(bm, 'insert single transaction') do |model_klass|
    batch_insert(model_klass, ITERATIONS)
  end
end