require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
  puts seed
  load seed 
end