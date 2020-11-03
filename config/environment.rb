require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'


require 'bundler/setup'
Bundler.require


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/artists.sqlite"
)

sql = <<-SQL
    CREATE TABLE artists (
        id INTEGER PRIMARY KEY,
        name TEXT,
        genre TEXT,
        age INTEGER,
        hometown TEXT
    );
SQL

ActiveRecord::Base.connection.execute("DROP TABLE IF EXISTS artists")
ActiveRecord::Base.connection.execute(sql)
# put the code to connect to the database here


require_relative "../artist.rb"
