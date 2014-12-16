ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'sqlite3://localhost/comment.db')
class Comment < ActiveRecord::Base; end