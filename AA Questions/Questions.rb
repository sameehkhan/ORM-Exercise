require 'sqlite3'
require 'singleton'


class QuestionsDatabase < SQLite3 ::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end

class Users
  def self.find_by_id
    t = PlayDBConnection.instance.execute(<<-SQL, title)


    SQL
  end
end

class Questions
  def self.find_by_id
    t = PlayDBConnection.instance.execute(<<-SQL, title)


    SQL
  end

end

class QuestionFollows
  def self.find_by_id
    t = PlayDBConnection.instance.execute(<<-SQL, title)


    SQL
  end

end

class Replies
  def self.find_by_id
    t = PlayDBConnection.instance.execute(<<-SQL, title)


    SQL
  end

end

class QuestionLikes
  def self.find_by_id
    t = PlayDBConnection.instance.execute(<<-SQL, title)


    SQL 
  end

end
