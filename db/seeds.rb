require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }